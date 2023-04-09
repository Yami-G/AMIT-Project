class ValidationTextForm {
  static bool validatePhoneNumber(String phoneNumber) {
    RegExp regExp = RegExp(r'^\d{14}$');
    return regExp.hasMatch(phoneNumber);
  }

  static bool isValidPassword(String password) {
    RegExp passwordPattern = RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[!@#\$%\^&\*])(?=.{8,})');
    return passwordPattern.hasMatch(password);
  }

  static bool isValidEmail(String email) {
    return RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(email);
  }
}
