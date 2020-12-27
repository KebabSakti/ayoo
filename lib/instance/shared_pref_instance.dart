import 'package:shared_preferences/shared_preferences.dart';

class PrefInstance {
  Future<SharedPreferences> prefInstance() async {
    return await SharedPreferences.getInstance();
  }
}
