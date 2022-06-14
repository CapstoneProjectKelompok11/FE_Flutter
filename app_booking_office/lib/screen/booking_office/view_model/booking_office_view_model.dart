import 'package:app_booking_office/model/api/booking_office_api.dart';
import 'package:app_booking_office/model/book_office_model.dart';
import 'package:flutter/widgets.dart';

enum BookOfficeViewState { none, loading, error }

class BookingOfficeViewModel extends ChangeNotifier {
  List<BuildingOffice> _office = [];
  List<BuildingOffice> get offices => _office;

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
}
