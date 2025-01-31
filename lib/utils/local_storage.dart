import 'package:get_storage/get_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {

  static saveTokenSharedPref( tokenValue) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString("token", tokenValue);
  }
  static Future<String?>  getTokenShared()  async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString("token");
  }
  /// use this to [saveRefreshTokenShared] to local storage
  static saveRefreshTokenShared( tokenValue) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString("refreshToken", tokenValue);
  }
  static Future<String?>  getRefreshTokenShared()  async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString("refreshToken");
  }
  static saveProfileId(String profileIdValue) {
    return GetStorage().write("profileId", profileIdValue);
  }
  static getTProfileId() {
    return GetStorage().read("profileId");
  }
  /// use this to [getToken] from local storage
  static getToken() {
    return GetStorage().read("token");
  }
  static saveLoginType(dynamic value){
    return GetStorage().write("loginType", value);
  }

  /// use this to [getToken] from local storage


  /// use this to [saveEmail] to local storage
  static saveEmail(String emailValue) {
    return GetStorage().write("email", emailValue);
  }
  /// use this to [getToken] from local storage
  static getEmail() {
    return GetStorage().read("email");
  }
  /// use this to [saveLocation] to local storage
  static saveLocation(String locationValue) {
    return GetStorage().write("location", locationValue);
  }
  static getLocation() {
    return GetStorage().read("location");
  }

  /// use this to [deleteToken] from local storage
  static deleteToken() {
    return GetStorage().remove("token");
  }

  /// use this to [saveUsername] to local storage
  static saveUsername(String userName) {
    return GetStorage().write('name', userName);
  }

  /// use this to [getUsername] from local storage
  static getUsername() {
    return GetStorage().read('name');
  }

}