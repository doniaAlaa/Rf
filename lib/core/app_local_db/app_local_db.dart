import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  // Create storage
  final storage = const FlutterSecureStorage();

  final String _keyUserName = 'username';
  final String _keyPassWord = 'password';
  final String _faceRequired= 'faceRequired';
  final String _loginUrl= 'loginUrl';
  final String _userModel= 'userModel';
  // final String _baseUrl= 'baseUrl';
  final String _compId= 'compId';
  final String _employeeData= 'employeeData';




  Future setUserModel(String userModel) async {
    await storage.write(key: _userModel, value: userModel);
  }

  Future<String?> getUserModel() async {
    return await storage.read(key: _userModel);
  }

  Future setUserName(String username) async {
    await storage.write(key: _keyUserName, value: username);
  }



  Future setEmployeeData(String employeeData) async {
    await storage.write(key: _employeeData, value: employeeData);
  }
  Future<String?> getEmployeeData() async {
    return await storage.read(key: _employeeData);
  }

  Future clearUserAccount() async {
    await storage.delete(key: _userModel, );
  }

  Future<String?> getUserName() async {
    return await storage.read(key: _keyUserName);
  }

  Future setPassWord(String password) async {
    await storage.write(key: _keyPassWord, value: password);
  }

  Future<String?> getPassWord() async {
    return await storage.read(key: _keyPassWord);
  }

  Future setFaceRequired(String faceRequired) async {
    await storage.write(key: _faceRequired, value: faceRequired);
  }

  Future<String?> getFaceRequired() async {
    return await storage.read(key: _faceRequired);
  }

  Future setLoginUrl(String loginUrl) async {
    await storage.write(key: _loginUrl, value: loginUrl);
  }

  Future<String?> getLoginUrl() async {
    return await storage.read(key: _loginUrl);
  }

  Future setCompanyId(String compId) async {
    await storage.write(key: _compId, value: compId);
  }

  Future<String?> getCompId() async {
    return await storage.read(key: _compId);
  }
}