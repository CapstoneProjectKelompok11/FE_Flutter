import 'package:app_booking_office/model/api/booking_office_api.dart';
import 'package:app_booking_office/model/book_office_model.dart';
import 'package:flutter/widgets.dart';

class BookingOfficeViewModel extends ChangeNotifier {
  List<BuildingOffice> _office = [];
  List<BuildingOffice> get offices => _office;

  Future<void> getOffice() async {
    var data = await GetBuilding.getBuilding();
    _office = data;
    notifyListeners();
  }
}
