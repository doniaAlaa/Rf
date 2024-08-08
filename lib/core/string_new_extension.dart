//THIS CLASS TO ADD NEW EXTENSION ON TYPE STRING
//FOR EXAMPLE : LIKE TYPE( .length)
import 'package:test2/core/app_utils.dart';

extension NewStringExtension on String {
  /// Discover if the String is a Phone Number
  bool get isPhoneNumber => AppUtils.isPhoneNumber(this);

  /// Discover if the String is a Email
  bool get isEmail => AppUtils.isEmail(this);
}
