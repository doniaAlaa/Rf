import 'package:shared_preferences/shared_preferences.dart';

class AppCachedDB {
  // Create storage
 static final String _userModel= 'userModel';

 static late final  SharedPreferences _prefs;

  // call this method from iniState() function of mainApp().
    static init() async {
    _prefs = await SharedPreferences.getInstance();
    // return _prefs;
  }
 


 static  setUserModel(String userModel) async {
    await _prefs?.setString(_userModel, userModel);
  }

  static getUserModel()  {
     _prefs?.getString(_userModel);
  }

  


 
}