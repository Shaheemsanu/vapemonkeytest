class TextFieldValidation {
  static bool phoneValidate(String value) {
    final RegExp regExp = RegExp(r'^[6-9]\d{9}$');
    return regExp.hasMatch(value);
  }

  static bool nameValidate(String value) {
    return value.isEmpty ? false : true;
  }

  static bool passWordValidate(String value) {
    return value.isEmpty ? false : true;
  }

  static bool confirmPasswordValidate(
      String value, String password, String confirmPassword) {
    return value.isEmpty
        ? false
        : (confirmPassword != null && password == confirmPassword)
            ? true
            : false;
  }

  // static bool confirmPasswordValidate(String value) {

  // }

  static bool defaultValidate(String value) {
    return value.isEmpty ? false : true;
  }

  static bool emailValidate(String value) {
    return RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(value);
  }
}
