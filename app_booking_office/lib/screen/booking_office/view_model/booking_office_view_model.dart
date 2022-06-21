import 'package:app_booking_office/model/api/booking_office_api.dart';
import 'package:app_booking_office/model/book_office_model.dart';
import 'package:flutter/widgets.dart';

enum BookOfficeViewState { none, loading, error }

class BookingOfficeViewModel extends ChangeNotifier {
  List<BuildingOffice> _office = [];
  List<BuildingOffice> get offices => _office;

  List<DataComplex> _complex = [];
  List<DataComplex> get complex => _complex;

  List<ImageBuildings> _imageBuilding = [];
  List<ImageBuildings> get imageBuildings => _imageBuilding;

  List<DataFloor> _floor = [];
  List<DataFloor> get floor => _floor;

  List<DataCity> _city = [];
  List<DataCity> get city => _city;

  List<DataBuilding> _building = [];
  List<DataBuilding> get building => _building;

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
      var data = await BookOfficeAPI.getBuilding('0', '5');
      _building = data!;
      changeState(BookOfficeViewState.none);
    } catch (e) {
      debugPrint(e.toString());
      changeState(BookOfficeViewState.error);
    }
    notifyListeners();
  }
}
