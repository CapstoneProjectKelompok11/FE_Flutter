import 'dart:convert';

import 'package:app_booking_office/model/book_office_model.dart';
import 'package:app_booking_office/property/show_dialog/token_expired.dart';
import 'package:app_booking_office/screen/booking_office/view_model/booking_office_view_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
  Response? response;
  Dio? dio;
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

  static Future<List<DataBuilding>?> getBuilding(
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

  static Future<void> reservation(
      Reservation reservation, String floorId, BuildContext context) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('token');
      var uri = Uri.http('ec2-18-206-213-94.compute-1.amazonaws.com',
          '/api/auth/reservation/', {'floorId': floorId});
      var dataReservation = {
        'start_reservation': reservation.startReservation,
        'company': reservation.company,
        'phone': reservation.phone,
        'participant': reservation.participant,
        'note': reservation.note
      };
      var dataMap = jsonEncode(dataReservation);
      final response = await Dio().postUri(uri,
          options: Options(headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $token',
          }),
          data: dataMap);
      if (response.statusCode == 200 ||
          response.statusCode == 201 ||
          response.statusCode == 202 ||
          response.statusCode == 203) {
        debugPrint('Succes Sending Request Booking');
      }
    } catch (e) {
      debugPrint(e.toString());

      showDialog(
          barrierDismissible: false,
          context: context,
          builder: (_) => const TokenExpired());
    }
  }

  static Future<List<DataBuilding>> searchBuilding(String nameBuilding) async {
    try {
      var uri = Uri.http('ec2-18-206-213-94.compute-1.amazonaws.com',
          '/api/building/search/', {'name': nameBuilding});
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
        debugPrint('Succes Fetching Result Search');
        return Building.fromJson(data).data;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return [];
  }

  static Future<void> postFavorite(
      String buildingId, BuildContext context) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('token');
      var uri = Uri.http('ec2-18-206-213-94.compute-1.amazonaws.com',
          '/api/auth/building/favorite', {'buildingId': buildingId});
      final response = await Dio().postUri(
        uri,
        options: Options(headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        }),
      );
      if (response.statusCode == 200 ||
          response.statusCode == 201 ||
          response.statusCode == 202 ||
          response.statusCode == 203) {
        debugPrint('Succes Adding to Favorite');
      }
    } catch (e) {
      debugPrint(e.toString());
      showDialog(
          barrierDismissible: false,
          context: context,
          builder: (_) => const TokenExpired());
    }
  }

  static Future<List<DataFavorite>> getFavorite(BuildContext context) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('token');
      var uri = Uri.http('ec2-18-206-213-94.compute-1.amazonaws.com',
          '/api/auth/building/favorite/');
      final response = await Dio().getUri(uri,
          options: Options(headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $token',
          }));
      var jsonString = jsonEncode(response.data);
      var data = jsonDecode(jsonString);
      if (response.statusCode == 200 ||
          response.statusCode == 201 ||
          response.statusCode == 202 ||
          response.statusCode == 203) {
        return GetFavorite.fromJson(data).data;
      }
    } catch (e) {
      debugPrint(e.toString());
      showDialog(
          barrierDismissible: false,
          context: context,
          builder: (_) => const TokenExpired());
    }
    return [];
  }

  static Future<void> deleteFavorite(
      String buildingId, BuildContext context) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('token');
      var uri = Uri.http('ec2-18-206-213-94.compute-1.amazonaws.com',
          '/api/auth/building/unfavorite/', {'buildingId': buildingId});
      final response = await Dio().deleteUri(uri,
          options: Options(headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $token',
          }));
      if (response.statusCode == 200 ||
          response.statusCode == 201 ||
          response.statusCode == 202 ||
          response.statusCode == 203) {
        debugPrint('Succes UnFavorite the Building');
      }
    } catch (e) {
      debugPrint(e.toString());
      showDialog(
          barrierDismissible: false,
          context: context,
          builder: (_) => const TokenExpired());
    }
  }
}
