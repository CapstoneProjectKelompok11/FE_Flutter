import 'dart:convert';
import 'dart:io';

import 'package:app_booking_office/model/api/booking_office_api.dart';
import 'package:app_booking_office/model/book_office_model.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';

enum BookOfficeViewState { none, loading, error }

class BookingOfficeViewModel extends ChangeNotifier {
  List<BuildingOffice> _office = [];
  List<BuildingOffice> get offices => _office;

  File? image;

  List<DataComplex> _complex = [];
  List<DataComplex> get complex => _complex;

  List<DataFloor> _floor = [];
  List<DataFloor> get floor => _floor;

  List<DataCity> _city = [];
  List<DataCity> get city => _city;

  List<DataBulding> _building = [];
  List<DataBulding> get building => _building;

  List<DataBulding> _buildingById = [];
  List<DataBulding> get buildingById => _buildingById;

  List<DataBulding> _buildingByComplex = [];
  List<DataBulding> get buildingByComplex => _buildingByComplex;

  BookOfficeViewState _states = BookOfficeViewState.none;
  BookOfficeViewState get states => _states;

  changeState(BookOfficeViewState state) {
    _states = state;
    notifyListeners();
  }

  Future<void> getOffice() async {
    changeState(BookOfficeViewState.loading);
    try {
      var data = await GetBuilding.getBuilding();
      _office = data;

      changeState(BookOfficeViewState.none);
    } catch (e) {
      changeState(BookOfficeViewState.error);
    }
    notifyListeners();
  }

  Future<void> getComplex(String cityName) async {
    changeState(BookOfficeViewState.loading);
    try {
      var data = await BookOfficeAPI.getComplex(cityName);
      _complex = data!;
      changeState(BookOfficeViewState.none);
    } catch (e) {
      debugPrint(e.toString());
      changeState(BookOfficeViewState.error);
    }
    notifyListeners();
  }

  Future<void> getFloor(String buildingId) async {
    changeState(BookOfficeViewState.loading);
    try {
      var data = await BookOfficeAPI.getFloor(buildingId);
      _floor = data!;
      changeState(BookOfficeViewState.none);
    } catch (e) {
      debugPrint(e.toString());
      changeState(BookOfficeViewState.error);
    }
    notifyListeners();
  }

  Future<void> getCity() async {
    changeState(BookOfficeViewState.loading);
    try {
      var data = await BookOfficeAPI.getCity();
      _city = data!;
      changeState(BookOfficeViewState.none);
    } catch (e) {
      debugPrint(e.toString());
      changeState(BookOfficeViewState.error);
    }
    notifyListeners();
  }

  Future<void> getBuilding() async {
    changeState(BookOfficeViewState.loading);
    try {
      var data = await BookOfficeAPI.getBuilding('', '0', '8');
      _building = data!;
      changeState(BookOfficeViewState.none);
    } catch (e) {
      debugPrint(e.toString());
      changeState(BookOfficeViewState.error);
    }
    notifyListeners();
  }

  Future<void> getBuildingById(String complexId) async {
    changeState(BookOfficeViewState.loading);
    try {
      var data = await BookOfficeAPI.getBuilding(complexId, '0', '4');
      _buildingById = data!;
      changeState(BookOfficeViewState.none);
    } catch (e) {
      debugPrint(e.toString());
      changeState(BookOfficeViewState.error);
    }
    notifyListeners();
  }

  Future<void> getBuildingByComplex(String complexId) async {
    changeState(BookOfficeViewState.loading);
    try {
      var data = await BookOfficeAPI.getBuilding(complexId, '0', '1');
      _buildingByComplex = data!;
      changeState(BookOfficeViewState.none);
    } catch (e) {
      debugPrint(e.toString());
      changeState(BookOfficeViewState.error);
    }
    notifyListeners();
  }

  Future<void> pickImageGallery() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    final imageTemporary = File(image!.path);
    this.image = imageTemporary;
    notifyListeners();
  }

  Future<void> sendReview(PostReview postReview) async {
    try {
      BookOfficeAPI.postReview(postReview);
    } catch (e) {
      debugPrint(e.toString());
    }
    notifyListeners();
  }
}
