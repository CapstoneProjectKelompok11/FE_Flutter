import 'dart:async';
import 'dart:convert';
import 'package:app_booking_office/property/bottom_navigation_bar.dart';
import 'package:app_booking_office/property/login_error_screen.dart';
import 'package:app_booking_office/screen/auth/login_screen.dart';
import 'package:app_booking_office/screen/auth/model/auth_model.dart';
import 'package:app_booking_office/screen/auth/splash_screen.dart';
import 'package:app_booking_office/screen/booking_office/home_screen.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum AuthViewState { none, loading, error }

class AuthViewModel extends ChangeNotifier {
  List<Auth> _dataUsers = [];
  List<Auth> get dataUsers => _dataUsers;
  bool isChecked = false;
  AuthViewState _states = AuthViewState.none;
  AuthViewState get states => _states;

  changeState(AuthViewState state) {
    _states = state;
    notifyListeners();
  }

  //user registation
  Future<void> register(Auth auth) async {
    changeState(AuthViewState.loading);
    try {
      var dataUsers = {
        'firstName': auth.firstName,
        'lastName': auth.lastName,
        'phone': auth.phone,
        'email': auth.email,
        'password': auth.password,
      };
      var dataMap = jsonEncode(dataUsers);
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
      changeState(AuthViewState.none);
    } catch (e) {
      changeState(AuthViewState.error);
    }

    notifyListeners();
  }

  //saving userdata in local storage
  Future<void> userPreferences(
      String email, String password, String token) async {
    changeState(AuthViewState.loading);
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('token', token);
      prefs.setString('email', email);
      prefs.setString('password', password);
      notifyListeners();
      changeState(AuthViewState.none);
    } catch (e) {
      changeState(AuthViewState.error);
    }
  }

  //delete userdata in local storage
  Future<void> logout(BuildContext context) async {
    changeState(AuthViewState.loading);
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.clear();
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (_) => const LoginScreen()));
      notifyListeners();
      changeState(AuthViewState.none);
    } catch (e) {
      changeState(AuthViewState.error);
    }
  }

  Future<List<Auth>> getUser() async {
    final response =
        await Dio().get('https://62909ea1665ea71fe136c605.mockapi.io/users/');

    List<Auth> auths = (response.data as List)
        .map((e) => Auth(
            firstName: e['firstName'],
            lastName: e['lastName'],
            phone: e['phone'],
            email: e['email'],
            password: e['password']))
        .toList();
    if (response.statusCode == 200 ||
        response.statusCode == 201 ||
        response.statusCode == 202 ||
        response.statusCode == 203) {
      debugPrint('Succes Fetching data');
      _dataUsers = auths;
    }
    return auths;
  }

  Future<void> login(
      String email, String password, BuildContext context) async {
    changeState(AuthViewState.loading);
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
        debugPrint('Logging in');
        //get token response
        String token = response.data['data']['token'].toString();
        //if checkbox is checked it will saving data to local storage
        isChecked
            ? userPreferences(
                email,
                password,
                token,
              )
            : null;
        //Succes state
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (_) => const BottomNavBar()));
      }
      changeState(AuthViewState.none);
    } catch (e) {
      debugPrint(e.toString());
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (_) => const LoginErrorScreen()));
      changeState(AuthViewState.error);
    }
    notifyListeners();
  }

  Future<void> checkLogin(BuildContext context) async {
    changeState(AuthViewState.loading);
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      //checking in local storage is there email and password, while true it wil navigate to home screen
      if (prefs.getString('token') != null) {
        Timer(
            const Duration(seconds: 2),
            () => Navigator.push(context,
                MaterialPageRoute(builder: (_) => const BottomNavBar())));
      }
      //when not found data email and password in local storage it will navigate to login screen
      else {
        Timer(
            const Duration(seconds: 2),
            () => Navigator.push(context,
                MaterialPageRoute(builder: (_) => const SplashScreen())));
      }
      notifyListeners();
      changeState(AuthViewState.none);
    } catch (e) {
      changeState(AuthViewState.error);
    }
  }
}
