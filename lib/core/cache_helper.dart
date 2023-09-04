import 'package:shared_preferences/shared_preferences.dart';

class CacheHeper {
  static late SharedPreferences _prefs;

  static init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static saveName({required String name}) async {
    await _prefs.setString('name', name);
  }

  static String getName() => _prefs.getString('name') ?? '';
  // static String getName() {
  //   return _prefs.getString('name')?? '';
  // }

  static saveLastName({required String lastName}) async {
    await _prefs.setString('lastName', lastName);
  }

  static String getLastName() => _prefs.getString('lastName') ?? '';

  static saveEmail({required String email}) async {
    await _prefs.setString('email', email);
  }

  static String getEmail() => _prefs.getString('email') ?? '';

  static saveNotFirstTime() async {
    await _prefs.setBool('notFirstTime', false);
  }

  static bool getFirstTime() => _prefs.getBool('notFirstTime') ?? true;

  static saveAppointment({required String appointment}) async {
    await _prefs.setString('appointment', appointment);
  }

  static String getAppointment() =>
      _prefs.getString('appointment') ?? 'No Appointment';

  static saveToken({required String token}) async {
    await _prefs.setString('token', token);
  }

  static String getToken() => _prefs.getString('token') ?? '';

  static clear() {
    _prefs.clear();
  }
}
