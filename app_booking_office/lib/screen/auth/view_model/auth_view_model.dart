import 'dart:convert';

import 'package:app_booking_office/screen/auth/model/auth_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class AuthViewModel extends ChangeNotifier {
  Future<void> register(Auth auth) async {
    try {
      var dataUsers = {
        'first_name': auth.firstName,
        'last_name': auth.lastName,
        'phone': auth.phone,
        'email': auth.email,
        'password': auth.password,
      };
      var dataMap = jsonEncode(dataUsers);
      Response response = await Dio().post(
          'https://62909ea1665ea71fe136c605.mockapi.io/users/',
          data: dataMap);
      if (response.statusCode == 200 ||
          response.statusCode == 201 ||
          response.statusCode == 202 ||
          response.statusCode == 203) {
        debugPrint('account created');
      } else {
        debugPrint('failed');
      }
    } catch (e) {
      debugPrint(e.toString());
    }

    notifyListeners();
  }
}
