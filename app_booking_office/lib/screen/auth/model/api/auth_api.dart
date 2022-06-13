import 'dart:async';
import 'dart:convert';

import 'package:app_booking_office/property/bottom_navigation_bar.dart';
import 'package:app_booking_office/property/login_failed_dialog.dart';
import 'package:app_booking_office/property/login_succesfull_dialog.dart';
import 'package:app_booking_office/screen/auth/model/auth_model.dart';
import 'package:app_booking_office/screen/auth/view_model/auth_view_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class AuthAPI {
  bool isChecked = false;
  Future<void> register(Auth auth) async {
    try {
      var dataUser = {
        'firstName': auth.firstName,
        'lastName': auth.lastName,
        'phone': auth.phone,
        'email': auth.email,
        'password': auth.password,
      };
      var dataMap = jsonEncode(dataUser);
      //sending data to API
      Response response = await Dio().post(
          'http://ec2-18-206-213-94.compute-1.amazonaws.com/api/register',
          data: dataMap);
      if (response.statusCode == 200 ||
          response.statusCode == 201 ||
          response.statusCode == 202 ||
          response.statusCode == 203) {
        //saving user input to local storag
        debugPrint('account created');
      } else {
        debugPrint('failed');
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> login(String email, String password, bool isChecked,
      BuildContext context) async {
    try {
      var dataLogin = {'email': email, 'password': password};
      var dataMap = jsonEncode(dataLogin);
      Response response = await Dio().post(
          'http://ec2-18-206-213-94.compute-1.amazonaws.com/api/login',
          data: dataMap);
      if (response.statusCode == 200 ||
          response.statusCode == 201 ||
          response.statusCode == 202 ||
          response.statusCode == 203) {
        debugPrint('Login Succesfull');
        String token = response.data['data']['token'].toString();
        isChecked
            ? AuthViewModel().userPreferences(email, password, token)
            : null;
      }
      showDialog(
          context: context,
          builder: (context) => const LoginSuccesfullDialog());
      Timer(
          const Duration(seconds: 2),
          () => Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (_) => const BottomNavBar())));
    } catch (e) {
      debugPrint(e.toString());
      showDialog(
          context: context, builder: (context) => const LoginFailedDialog());
      debugPrint(e.toString());
    }
  }
}
