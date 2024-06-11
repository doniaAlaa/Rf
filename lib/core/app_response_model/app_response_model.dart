
class ResponseModel<T> {
  bool? succeess;
  String? errorCode;
  String? message;
  T? data;

  // int status;
  // String? message;

  ResponseModel({
    this.succeess,
    this.errorCode,
    this.message,
    this.data,
  });

  ResponseModel.fromJson(Map<String, dynamic> json) {
    succeess = json['succeess'];
    errorCode = json['errorCode'];
    message = json['message'];
    data = json['data'];
  }
}
