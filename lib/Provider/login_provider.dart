import 'package:amit_course1/Model/UsersModels.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'login_provider.g.dart';

final Dio dio = Dio();

@riverpod
Future login(LoginRef ref, String phone, String password) async {
  try {
    final Response response = await dio.post(
      'https://yalla-app.herokuapp.com/api/restaurant/login',
      data: FormData.fromMap(
        {
          'phone': phone,
          'password': password,
          'device_token': '8484848',
          'device_type': 'ios',
        },
      ),
    );
    if (response.statusCode == 200) {
      UsersModels.fromJson(response.data);
    } else {
      debugPrint('something in url login went wrong');
    }
  } catch (e) {
    throw Exception('url wrong');
  }
}
