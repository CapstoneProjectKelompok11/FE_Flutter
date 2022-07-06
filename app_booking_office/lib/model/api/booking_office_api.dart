import 'dart:convert';

import 'package:app_booking_office/model/book_office_model.dart';
import 'package:app_booking_office/property/show_dialog/token_expired.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GetBuilding {
  static Future<List<BuildingOffice>> getBuilding() async {
    final response = await Dio()
        .get('https://62a2ad7721232ff9b20d92b2.mockapi.io/office_data',
            options: Options(headers: {
              "Content-Type": "application/json",
            }));
    // var jsonString = jsonEncode(response.data);
    // var data = jsonDecode(jsonString);
    // print(data);
    if (response.statusCode == 200 ||
        response.statusCode == 201 ||
        response.statusCode == 202 ||
        response.statusCode == 203) {
      debugPrint('Succes Fetching data');
      List<BuildingOffice> result = (response.data as List)
          .map((e) => BuildingOffice(
              picture: e['picture'],
              name: e['name'],
              location: e['location'],
              capacity: e['capacity'],
              toilet: e['toilet'],
              stairs: e['Stairs'],
              rating: e['rating'],
              price: e['price'],
              desciption: e['desciption']))
          .toList();
      return result;
    }
    debugPrint('Error Fetching data');
    return [];
  }
}

class BookOfficeAPI {
  static Future<List<DataComplex>?> getComplex(String cityName) async {
    try {
      var uri = Uri.https(
          'c2-18-206-213-94.compute-1.amazonaws.com', '/api/complex', {
        'city': cityName,
      });
      final response = await Dio().getUri(uri,
          options: Options(headers: {"Content-Type": "application/json"}));
      var jsonString = jsonEncode(response.data);
      var data = jsonDecode(jsonString);
      if (response.statusCode == 200 ||
          response.statusCode == 201 ||
          response.statusCode == 202 ||
          response.statusCode == 203) {
        debugPrint('SuccesFull Fetching data Complex');
        return Complex.fromJson(data).data;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return [];
  }

  static Future<List<DataFloor>?> getFloor(String buildingId) async {
    try {
      var uri = Uri.http('ec2-18-206-213-94.compute-1.amazonaws.com',
          '/api/floor/', {"buildingId": buildingId});
      final response = await Dio().getUri(uri,
          options: Options(headers: {
            "Content-Type": "application/json",
          }));
      var jsonString = jsonEncode(response.data);
      var data = jsonDecode(jsonString);
      if (response.statusCode == 200 ||
          response.statusCode == 201 ||
          response.statusCode == 202 ||
          response.statusCode == 203) {
        debugPrint('Succes Fetching data Floor');
        return Floor.fromJson(data).data;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return [];
  }

  static Future<List<DataCity>?> getCity() async {
    try {
      final response = await Dio()
          .get('http://ec2-18-206-213-94.compute-1.amazonaws.com/api/city');

      var jsonString = jsonEncode(response.data);
      var data = jsonDecode(jsonString);
      if (response.statusCode == 200 ||
          response.statusCode == 201 ||
          response.statusCode == 202 ||
          response.statusCode == 203) {
        debugPrint('Succes Fetching data City');
        return City.fromJson(data).data;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return [];
  }

  static Future<List<DataBulding>?> getBuilding(
    String complexId,
    String page,
    String limit,
  ) async {
    try {
      var uri = Uri.http(
          'ec2-18-206-213-94.compute-1.amazonaws.com',
          '/api/buildings/',
          {'complexId': complexId, 'page': page, 'limit': limit});
      final response = await Dio().getUri(uri,
          options: Options(headers: {"Content-Type": "application/json"}));
      var jsonString = jsonEncode(response.data);
      var data = jsonDecode(jsonString);
      if (response.statusCode == 200 ||
          response.statusCode == 201 ||
          response.statusCode == 202 ||
          response.statusCode == 203) {
        debugPrint('Succes Fetching data Building');
        return Building.fromJson(data).data;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return [];
  }

  static Future<void> postReview(
      PostReview postReview, BuildContext context) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('token');
      debugPrint(token);
      var uri = Uri.http('ec2-18-206-213-94.compute-1.amazonaws.com',
          '/api/auth/review/', {'buildingId': postReview.buildingId});
      var dataReview = {
        'review': postReview.review,
        'rating': postReview.rating
      };
      var dataMap = jsonEncode(dataReview);
      Response response = await Dio().postUri(uri,
          options: Options(headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $token',
          }),
          data: dataMap);

      if (response.statusCode == 200 ||
          response.statusCode == 201 ||
          response.statusCode == 202 ||
          response.statusCode == 203) {
        debugPrint('Succes Sending Review');
      }
    } catch (e) {
      debugPrint(e.toString());
      showDialog(
          barrierDismissible: false,
          context: context,
          builder: (_) => const TokenExpired());
    }
  }

  static Future<List<DataGetReview>> getReview(
      String buildingId, String page, String limit) async {
    try {
      var uri = Uri.http(
          'ec2-18-206-213-94.compute-1.amazonaws.com',
          '/api/review',
          {'buildingId': buildingId, 'page': page, 'limit': limit});
      final response = await Dio().getUri(uri,
          options: Options(headers: {
            'Content-Type': 'application/json',
          }));
      var jsonString = jsonEncode(response.data);
      var data = jsonDecode(jsonString);
      if (response.statusCode == 200 ||
          response.statusCode == 201 ||
          response.statusCode == 202 ||
          response.statusCode == 203) {
        debugPrint('Succes Get Review');
        return GetReview.fromJson(data).data;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return [];
  }
}
