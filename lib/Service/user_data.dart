class LoginData {
  final String email, password;
  LoginData({required this.email, required this.password});

  Map<String, String> toJason() {
    return {'email': email, 'password': password};
  }
}
