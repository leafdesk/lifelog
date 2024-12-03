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
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  void _showAddQuestionDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('새로운 질문 추가'),
        content: TextField(
          controller: _textController,
          decoration: const InputDecoration(
            hintText: '질문을 입력하세요',
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('취소'),
          ),
          TextButton(
            onPressed: () {
              if (_textController.text.isNotEmpty) {
                _questionsController.questions.add(_textController.text);
                _textController.clear();
                Navigator.pop(context);
              }
            },
            child: const Text('추가'),
          ),
        ],
      ),
    );
  }

  void _showEditQuestionDialog(int index, String currentQuestion) {
    _textController.text = currentQuestion; // 현재 질문으로 초기화
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('질문 수정'),
        content: TextField(
          controller: _textController,
          decoration: const InputDecoration(
            hintText: '질문을 입력하세요',
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('취소'),
          ),
          TextButton(
            onPressed: () {
              if (_textController.text.isNotEmpty) {
                _questionsController.questions[index] = _textController.text;
                _textController.clear();
                Navigator.pop(context);
              }
            },
            child: const Text('수정'),
          ),
        ],
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
            onPressed: () {
              _questionsController.questions.removeAt(index);
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
                    final item =
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
                          Text(
                            '${index + 1}. ',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          Expanded(
                            child: Text(_questionsController.questions[index]),
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
                              _questionsController.questions[index],
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
