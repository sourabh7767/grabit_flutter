import 'package:grabit/models/UserModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

late SharedPrefs sharedPrefs;

class SharedPrefs {
  final SharedPreferences prefs;

  SharedPrefs(this.prefs);

  set userData(User? user) {
    if (user != null) {
      prefs.setString('userData', user.toJson());
    }
  }

  User? get userData {
    final json = prefs.getString('userData');
    return json == null ? null : User.fromJson(json);
  }

  String? get fbToken {
    return prefs.getString('fbtoken');
  }

  set fbToken(String? val) {
    if (val != null) {
      prefs.setString('fbtoken', val);
    }
  }


  clearData(){
    prefs.clear();
  }
}
