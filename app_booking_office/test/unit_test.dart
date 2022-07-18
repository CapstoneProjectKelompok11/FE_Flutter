import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  Response response;
  var token;
  test('Login', () async {
    var dataLogin = {
      'email': 'brucebanner@gmail.com',
      'password': 'brucebanner'
    };
    var dataMap = jsonEncode(dataLogin);
    response = await Dio().post(
        'http://ec2-18-206-213-94.compute-1.amazonaws.com/api/login',
        data: dataMap);
    if (response.statusCode == 200 ||
        response.statusCode == 201 ||
        response.statusCode == 202 ||
        response.statusCode == 203) {
      token = response.data['data']['token'].toString();
    }
    expect(response.statusCode == 200, true);
  });
  test('data building', () async {
    var uri = Uri.http('ec2-18-206-213-94.compute-1.amazonaws.com',
        '/api/floor/', {"buildingId": '1'});
    response = await Dio().getUri(uri,
        options: Options(headers: {
          "Content-Type": "application/json",
        }));
    expect(response.statusCode == 200, true);
  });
  test('review', () async {
    var uri = Uri.http('ec2-18-206-213-94.compute-1.amazonaws.com',
        '/api/review', {'buildingId': '1', 'page': '0', 'limit': '3'});
    final response = await Dio().getUri(uri,
        options: Options(headers: {
          'Content-Type': 'application/json',
        }));
    expect(response.statusCode == 200, true);
  });
  test('search', () async {
    var uri = Uri.http('ec2-18-206-213-94.compute-1.amazonaws.com',
        '/api/building/search/', {'name': 'meja'});
    final response = await Dio().getUri(uri,
        options: Options(headers: {
          'Content-Type': 'application/json',
        }));
    expect(response.statusCode == 200, true);
  });
  test('get data user', () async {
    var uri = Uri.http(
        'ec2-18-206-213-94.compute-1.amazonaws.com', '/api/auth/profile/');
    final response = await Dio().getUri(uri,
        options: Options(headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        }));
    expect(response.statusCode == 200, true);
  });
}
