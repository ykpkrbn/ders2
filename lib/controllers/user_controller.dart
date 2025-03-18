import 'package:ders2/models/user_model.dart';
import 'package:ders2/view_models/user_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  final UserViewModel _userViewModel = UserViewModel();
  RxBool gender = true.obs;
  RxString username= ''.obs;
  RxString email= ''.obs;

  @override
  void onInit() {
    loadSettings();
    super.onInit();
  }

  var usermodel =
      UserModel(
        username: 'username',
        email: 'email@gmail.com',
        gender: true,
      ).obs;


  Future<void> loadSettings() async {
    var settings = await _userViewModel.getUserSettings();
    if (settings != null) {
      usermodel.value = settings;
      print('Veriler Çekildi');
    } else {
      Get.showSnackbar(GetSnackBar(
        title: 'Hata',
        message: 'Henüz kişiler yok',
        backgroundColor: Colors.red,
        duration: Duration(seconds: 2),
        snackPosition: SnackPosition.TOP,
      ));
    }
  }


  Future<void> updateUserSettings(UserModel usermodels) async {
    var newSettings = UserModel(username: usermodels.username,
        email: usermodels.email,
        gender: usermodels.gender);

    await _userViewModel.saveUserSettings(newSettings);
    usermodel.value = newSettings;
  }
}
