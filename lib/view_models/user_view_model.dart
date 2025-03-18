

import 'dart:convert';

import 'package:ders2/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserViewModel{

  Future<void> saveUserSettings(UserModel usermodel)async{
    final prefs = await SharedPreferences.getInstance();

    // Mapten String' e çevirince JsonEncode

    String jsonString = jsonEncode(usermodel.toJson());
    print('Mapten Stringe => $jsonString');
    await prefs.setString('user', jsonString);
  }

  Future<UserModel?> getUserSettings() async{
    final prefs = await SharedPreferences.getInstance();
    String? jsonString= prefs.getString('user');
    if(jsonString != null){
      // String' ten Map'e çevirince JsonDecode
      return UserModel.fromJson(jsonDecode(jsonString));
    }
    return null;

  }

}