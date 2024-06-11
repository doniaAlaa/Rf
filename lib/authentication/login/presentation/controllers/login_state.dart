abstract class LoginStates {}

class LoginInitState extends LoginStates {}

class ChangeMobileNumberState extends LoginStates {}

class ValidateMobileNumber extends LoginStates {}

class ChangeUserType extends LoginStates {}

class ChangeCountryState extends LoginStates {}

class RemoveValidationStates extends LoginStates {}

class LoginLoadingState extends LoginStates {}

class LoginSuccessState extends LoginStates {}

class ValidationErrorLoginState extends LoginStates {}

class CatchErrorState extends LoginStates {}

class ErrorNetworkState extends LoginStates {}

class ServerErrorState extends LoginStates {}
