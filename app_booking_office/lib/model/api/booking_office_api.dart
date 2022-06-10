import 'dart:convert';

import 'package:app_booking_office/model/book_office_model.dart';
import 'package:dio/dio.dart';

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
      print('Succes Fetching data');
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
    print('Error Fetching data');
    return [];
  }
}
