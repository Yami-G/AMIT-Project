class LoginData {
  final String? phone, password;
  LoginData({this.phone, this.password});

  factory LoginData.fromJson(json) => LoginData(password: json['password'], phone: json['phone']);

  static Map<String, dynamic> toMap({required String phone, required String password}) =>
      <String, dynamic>{'phone': phone, 'password': password};
}
