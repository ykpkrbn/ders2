import 'package:ders2/controllers/user_controller.dart';
import 'package:ders2/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsView extends StatelessWidget {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    UserController _userController = Get.put(UserController());
    return Scaffold(
      appBar: AppBar(title: Text('Ayarlar')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          spacing: 20,
          children: [
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(
                label: Text('Kullanıcı Adı'),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(32),
                ),
              ),
            ),
            TextField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                label: Text('E mail'),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(32),
                ),
              ),
            ),
            Obx(() {
              return Column(
                children: [
                  Text('Cinsiyet'),

                  SwitchListTile(
                    title: Text('Erkek'),
                    value: _userController.gender.value,
                    onChanged: (value) {
                      _userController.gender.value =
                          !_userController.gender.value;
                    },
                  ),
                  SwitchListTile(
                    title: Text('Kadın'),
                    value: !_userController.gender.value,
                    onChanged: (value) {
                      _userController.gender.value =
                          !_userController.gender.value;
                    },
                  ),
                ],
              );
            }),

            MaterialButton(
              height: 50,
              minWidth: Get.size.width * 0.5,
              color: Colors.green.shade800,
              shape: StadiumBorder(),
              onPressed: () {
                if (_usernameController.text.trim().isNotEmpty &&
                    _emailController.text.trim().isNotEmpty) {
                  _userController.updateUserSettings(
                    UserModel(
                      username: _usernameController.text.trim(),
                      email: _emailController.text.trim(),
                      gender: _userController.gender.value,
                    ),
                  );
                } else {
                  Get.snackbar('Hata', 'Kullanıcı adı veya e mail boş kaldı');
                }
              },
              child: Text('Kaydet', style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}
