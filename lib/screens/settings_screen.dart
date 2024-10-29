import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  // 프로필 상태
  String nickname = "사용자";
  String email = "user@example.com";
  String? profileImage;

  // 설정 상태
  bool isDarkMode = false;
  TimeOfDay alarmTime = const TimeOfDay(hour: 21, minute: 0);
  bool pushNotification = true;
  String fileFormat = 'txt';

  void _handleLogout() {
    // 로그아웃 로직 구현
    debugPrint("로그아웃");
  }

  void _handleProfileUpdate() {
    // 프로필 업데이트 로직 구현
    debugPrint("프로필 업데이트");
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: alarmTime,
    );
    if (picked != null && picked != alarmTime) {
      setState(() {
        alarmTime = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('설정'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 프로필 섹션
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        '프로필',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 40,
                            backgroundImage: profileImage != null
                                ? NetworkImage(profileImage!)
                                : null,
                            child: profileImage == null
                                ? const Icon(Icons.person, size: 40)
                                : null,
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              children: [
                                TextField(
                                  decoration: const InputDecoration(
                                    labelText: '닉네임',
                                  ),
                                  controller:
                                      TextEditingController(text: nickname),
                                  onChanged: (value) {
                                    nickname = value;
                                  },
                                ),
                                const SizedBox(height: 8),
                                TextField(
                                  decoration: const InputDecoration(
                                    labelText: '이메일',
                                  ),
                                  controller: TextEditingController(text: email),
                                  enabled: false,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: _handleProfileUpdate,
                          child: const Text('프로필 수정'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 16),

              // 설정 섹션
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // 테마 설정
                      const Text(
                        '테마 설정',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SwitchListTile(
                        title: Row(
                          children: [
                            Icon(isDarkMode ? Icons.dark_mode : Icons.light_mode),
                            const SizedBox(width: 8),
                            Text(isDarkMode ? '다크 모드' : '라이트 모드'),
                          ],
                        ),
                        value: isDarkMode,
                        onChanged: (bool value) {
                          setState(() {
                            isDarkMode = value;
                          });
                        },
                      ),

                      const Divider(),

                      // 알림 설정
                      const Text(
                        '알림 설정',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      ListTile(
                        title: const Text('일기 알림 시간'),
                        trailing: Text(
                            '${alarmTime.hour.toString().padLeft(2, '0')}:${alarmTime.minute.toString().padLeft(2, '0')}'),
                        onTap: () => _selectTime(context),
                      ),
                      SwitchListTile(
                        title: const Text('푸시 알림'),
                        value: pushNotification,
                        onChanged: (bool value) {
                          setState(() {
                            pushNotification = value;
                          });
                        },
                      ),

                      const Divider(),

                      // 데이터 관리
                      const Text(
                        '데이터 관리',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      DropdownButtonFormField<String>(
                        decoration: const InputDecoration(
                          labelText: '내보내기 형식',
                        ),
                        value: fileFormat,
                        items: const [
                          DropdownMenuItem(value: 'txt', child: Text('TXT')),
                          DropdownMenuItem(value: 'pdf', child: Text('PDF')),
                          DropdownMenuItem(value: 'docx', child: Text('DOCX')),
                        ],
                        onChanged: (String? value) {
                          if (value != null) {
                            setState(() {
                              fileFormat = value;
                            });
                          }
                        },
                      ),
                      const SizedBox(height: 8),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            // 데이터 내보내기 로직
                          },
                          child: const Text('데이터 내보내기'),
                        ),
                      ),

                      const Divider(),

                      // 계정 관리
                      const Text(
                        '계정 관리',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: _handleLogout,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                            foregroundColor: Colors.white,
                          ),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.logout),
                              SizedBox(width: 8),
                              Text('로그아웃'),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
