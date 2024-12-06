import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lifelog/screens/questions/questions_controller.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key});

  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  final QuestionsController _questionsController =
      Get.put(QuestionsController());
  final TextEditingController _textController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _questionsController.loadQuestions(); // 화면이 처음 생성될 때 질문 목록 로드
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // 탭 이동 시마다 질문 목록을 로드
    _questionsController.loadQuestions();
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  void _showAddQuestionDialog() {
    _textController.clear(); // 다이얼로그를 열기 전에 텍스트 필드를 비웁니다.
    showDialog(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setState) {
          return AlertDialog(
            title: const Text('새로운 질문 추가'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: _textController,
                  decoration: const InputDecoration(
                    hintText: '질문을 입력하세요',
                  ),
                ),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () {
                  _textController.clear(); // 취소 시에도 텍스트 필드를 비웁니다.
                  Navigator.pop(context);
                },
                child: const Text('취소'),
              ),
              TextButton(
                onPressed: () async {
                  if (_textController.text.isNotEmpty) {
                    await _questionsController.createCustomQuestion(
                      _textController.text,
                      "주관식", // 기본값으로 주관식 설정
                      [], // 옵션을 빈 리스트로 설정
                    );
                    _textController.clear();
                    Navigator.pop(context);
                  }
                },
                child: const Text('추가'),
              ),
            ],
          );
        },
      ),
    );
  }

  void _showEditQuestionDialog(int index, String currentQuestion) {
    _textController.text = currentQuestion;

    showDialog(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setState) {
          return AlertDialog(
            title: const Text('질문 수정'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: _textController,
                  decoration: const InputDecoration(
                    hintText: '질문을 입력하세요',
                  ),
                ),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () {
                  _textController.clear(); // 취소 시에도 텍스트 필드를 비웁니다.
                  Navigator.pop(context);
                },
                child: const Text('취소'),
              ),
              TextButton(
                onPressed: () async {
                  if (_textController.text.isNotEmpty) {
                    await _questionsController.updateCustomQuestion(
                      index,
                      _textController.text,
                      "주관식", // 기본값으로 주관식 설정
                    );
                    _textController.clear();
                    Navigator.pop(context);
                  }
                },
                child: const Text('수정'),
              ),
            ],
          );
        },
      ),
    );
  }

  void _showDeleteConfirmDialog(int index) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('질문 삭제'),
        content: const Text('정말로 이 질문을 삭제하시겠습니까?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('취소'),
          ),
          TextButton(
            onPressed: () async {
              await _questionsController.deleteCustomQuestion(index);
              Navigator.pop(context);
            },
            child: const Text('삭제'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('사용자 지정 질문'),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _showAddQuestionDialog,
        label: const Row(
          children: [
            Text('추가'),
            SizedBox(width: 8),
            Icon(Icons.add),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              '나의 질문 목록',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: Obx(
                () => ReorderableListView.builder(
                  buildDefaultDragHandles: false,
                  itemCount: _questionsController.questions.length,
                  onReorder: (oldIndex, newIndex) {
                    if (oldIndex < newIndex) {
                      newIndex -= 1;
                    }

                    // RxList에서 직접 순서 변경
                    final item = _questionsController.questions[oldIndex];
                    _questionsController.questions.removeAt(oldIndex);
                    _questionsController.questions.insert(newIndex, item);
                  },
                  itemBuilder: (context, index) {
                    return ListTile(
                      key: Key('$index'),
                      leading: ReorderableDragStartListener(
                        index: index,
                        child: const Icon(Icons.drag_indicator),
                      ),
                      title: Row(
                        children: [
                          // 인덱스 번호 표시
                          Text(
                            '${index + 1}. ', // 1부터 시작하는 인덱스 표시
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          Expanded(
                            child: Text(_questionsController
                                .questions[index].question!),
                          ),
                        ],
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.edit),
                            onPressed: () => _showEditQuestionDialog(
                              index,
                              _questionsController.questions[index].question!,
                            ),
                          ),
                          IconButton(
                            icon: const Icon(Icons.delete),
                            onPressed: () => _showDeleteConfirmDialog(index),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
