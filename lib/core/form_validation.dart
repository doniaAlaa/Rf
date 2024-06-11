import 'package:test2/core/string_new_extension.dart';

class FormValidation {
  static String? phoneValidation(String? phone) {
    if (phone == null || phone.trim().isEmpty) {
      return "this field is required ";
    } else if (phone.isPhoneNumber) {
      return "the data not valid";
    }
    return null;
  }

  static String? emailValidation(String? email) {
    if (email == null || email.trim().isEmpty) {
      return "this field is required ";
    } else if (email.isEmail) {
      return "the data not valid";
    }
    return null;
  }
}
