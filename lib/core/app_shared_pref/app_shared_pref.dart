import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class AppSharedPref {
  static SharedPreferences? _preferences;

  static init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  //   ******** image and camera permissions count **********

  static Future<bool> saveCameraCount(int cameraCount) async {
    return await _preferences!.setInt('CAMERA_COUNT', cameraCount);
  }

  static int getCameraCount() {
    return _preferences!.getInt('CAMERA_COUNT') ?? 0;
  }

  static Future<bool> saveImageCount(int imageCount) async {
    return await _preferences!.setInt('IMAGE_COUNT', imageCount);
  }

  static int getImageCount() {
    return _preferences!.getInt('IMAGE_COUNT') ?? 0;
  }

  static Future<bool> saveOnBoardCount(int onBoardCount) async {
    return await _preferences!.setInt('OnBoard_Count', onBoardCount);
  }

  static int getOnBoardCount() {
    return _preferences!.getInt('OnBoard_Count') ?? 0;
  }

  // static saveUserData(UserDataModel userDataModel) async {
  //   await _preferences!.setString('User_Data', jsonEncode(userDataModel.toJson()));
  // }
  //
  // static removeUserData() async {
  //   return await _preferences!.remove('User_Data');
  // }
  //
  // static UserDataModel? getUserData() {
  //
  //   String? userData = _preferences?.getString('User_Data') ?? null;
  //
  //   if (userData == null) {
  //     return null;
  //   }
  //
  //   return UserDataModel.fromJson(jsonDecode(userData));
  // }
}
