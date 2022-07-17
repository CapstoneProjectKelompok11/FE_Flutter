import 'dart:convert';
import 'dart:io';

import 'package:app_booking_office/model/api/booking_office_api.dart';
import 'package:app_booking_office/model/book_office_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';

enum BookOfficeViewState { none, loading, error }

class BookingOfficeViewModel extends ChangeNotifier {
  List<BuildingOffice> _office = [];
  List<BuildingOffice> get offices => _office;
  BuildContext? context;

  List<dynamic> nameFloor = [];
  int index = 0;

  DateTime dateTime = DateTime.now();

  File? image;
  File? imageReceipt;

  List<DataComplex> _complex = [];
  List<DataComplex> get complex => _complex;

  List<DataListMessage> _listChat = [];
  List<DataListMessage> get listChat => _listChat;

  List<DataFloor> _floor = [];
  List<DataFloor> get floor => _floor;

  List<DataReservation> _dataReservation = [
    DataReservation(
        id: 0,
        user: UserReservation(
            id: 0,
            firstName: '',
            lastName: '',
            phone: '',
            email: '',
            image: ''),
        floor: FloorReservation(
            id: 0,
            name: '',
            type: '',
            floorSize: '',
            maxCapacity: 0,
            startingPrice: 0,
            image: ''),
        building: BuildingReservation(
            id: 0,
            name: '',
            address: '',
            description: '',
            rating: 0,
            buildingSize: '',
            floorCount: 0,
            capacity: 0,
            images: [],
            complex: ComplexReservation(
                id: 0,
                complexName: '',
                city: CityReservation(id: 0, cityName: '')),
            facilities: []),
        startReservation: '',
        company: '',
        price: 0,
        phone: '',
        participant: 0,
        note: '',
        status: '')
  ];
  List<DataReservation> get dataReservation => _dataReservation;

  List<DataFavorite> _dataFavorite = [];
  List<DataFavorite> get dataFavorite => _dataFavorite;

  List<DataCity> _city = [];
  List<DataCity> get city => _city;

  GetUserData _userData = GetUserData(
      id: 0, firstName: '', lastName: '', phone: '', email: '', image: '');
  GetUserData get userData => _userData;

  List<DataBuilding> _building = [];
  List<DataBuilding> get building => _building;

  List<DataGetReview> _review = [];
  List<DataGetReview> get review => _review;

  List<DataBuilding> _buildingById = [];
  List<DataBuilding> get buildingById => _buildingById;

  List<DataBuilding> _resultSearch = [];
  List<DataBuilding> get resultSearch => _resultSearch;

  List<DataBuilding> _buildingByComplex = [];
  List<DataBuilding> get buildingByComplex => _buildingByComplex;

  BookOfficeViewState _states = BookOfficeViewState.none;
  BookOfficeViewState get states => _states;

  changeState(BookOfficeViewState state) {
    _states = state;
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
      var data = await BookOfficeAPI.getBuilding('', '', '');
      _building = data!;
      changeState(BookOfficeViewState.none);
    } catch (e) {
      debugPrint(e.toString());
      changeState(BookOfficeViewState.error);
    }
    notifyListeners();
  }

  Future<void> getBuildingById(String complexId, String limit) async {
    changeState(BookOfficeViewState.loading);
    try {
      var data = await BookOfficeAPI.getBuilding(complexId, '', '');
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
      var data = await BookOfficeAPI.getBuilding(complexId, '', '');
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

  Future<void> pickImageReceiptGallery() async {
    final imageReceipt =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    final imageTemporary = File(imageReceipt!.path);
    this.imageReceipt = imageTemporary;
    notifyListeners();
  }

  Future<void> sendReview(PostReview postReview, BuildContext context) async {
    changeState(BookOfficeViewState.loading);
    try {
      BookOfficeAPI.postReview(postReview, context);
      changeState(BookOfficeViewState.none);
    } catch (e) {
      debugPrint(e.toString());
      changeState(BookOfficeViewState.error);
    }
    notifyListeners();
  }

  Future<void> getReview(String buildingId) async {
    changeState(BookOfficeViewState.loading);
    try {
      var data = await BookOfficeAPI.getReview(buildingId, '0', '4');
      _review = data;
      changeState(BookOfficeViewState.none);
    } catch (e) {
      debugPrint(e.toString());
      changeState(BookOfficeViewState.error);
    }
    notifyListeners();
  }

  Future<void> getDataFloor(String buildingId) async {
    var uri = Uri.http('ec2-18-206-213-94.compute-1.amazonaws.com',
        '/api/floor/', {"buildingId": buildingId});
    final response = await Dio().getUri(uri,
        options: Options(headers: {
          "Content-Type": "application/json",
        }));
    var jsonString = jsonEncode(response.data);
    var data = jsonDecode(jsonString);
    nameFloor = data['data'];

    notifyListeners();
  }

  Future<void> postReservation(
      Reservation reservation, String floorId, BuildContext context) async {
    changeState(BookOfficeViewState.loading);
    try {
      BookOfficeAPI.reservation(reservation, floorId, context);
      changeState(BookOfficeViewState.none);
    } catch (e) {
      debugPrint(e.toString());
      changeState(BookOfficeViewState.error);
    }
    notifyListeners();
  }

  Future<void> searchBuilding(String nameBuilding) async {
    changeState(BookOfficeViewState.loading);
    try {
      var data = await BookOfficeAPI.searchBuilding(nameBuilding);
      _resultSearch = data;
      changeState(BookOfficeViewState.none);
    } catch (e) {
      debugPrint(e.toString());
      changeState(BookOfficeViewState.error);
    }
    notifyListeners();
  }

  Future<void> addFavorite(String buildingId, BuildContext context) async {
    changeState(BookOfficeViewState.loading);
    try {
      BookOfficeAPI.postFavorite(buildingId, context);
      changeState(BookOfficeViewState.none);
    } catch (e) {
      changeState(BookOfficeViewState.error);
      debugPrint(e.toString());
    }
    notifyListeners();
  }

  Future<void> getFavorite(BuildContext context) async {
    changeState(BookOfficeViewState.loading);
    try {
      var data = await BookOfficeAPI.getFavorite(context);
      _dataFavorite = data;
      changeState(BookOfficeViewState.none);
    } catch (e) {
      debugPrint(e.toString());
      changeState(BookOfficeViewState.error);
    }
    notifyListeners();
  }

  Future<void> unFavorite(String buildingId, BuildContext context) async {
    changeState(BookOfficeViewState.loading);
    try {
      BookOfficeAPI.deleteFavorite(buildingId, context);
      changeState(BookOfficeViewState.none);
    } catch (e) {
      debugPrint(e.toString());
      changeState(BookOfficeViewState.error);
    }
    notifyListeners();
  }

  Future<void> getUserData() async {
    changeState(BookOfficeViewState.loading);
    try {
      var data = await BookOfficeAPI.getDataUser();
      _userData = data;
      changeState(BookOfficeViewState.none);
    } catch (e) {
      debugPrint(e.toString());
      changeState(BookOfficeViewState.error);
    }
    notifyListeners();
  }

  Future<void> getReservation() async {
    changeState(BookOfficeViewState.loading);
    try {
      var data = await BookOfficeAPI.getReservation();
      _dataReservation = data!;
      changeState(BookOfficeViewState.none);
    } catch (e) {
      debugPrint(e.toString());
      changeState(BookOfficeViewState.error);
    }
    notifyListeners();
  }

  Future<void> postProfilePicture(File image) async {
    changeState(BookOfficeViewState.loading);
    try {
      BookOfficeAPI.postProfilePicture(image);
      changeState(BookOfficeViewState.none);
    } catch (e) {
      debugPrint(e.toString());
      changeState(BookOfficeViewState.error);
    }
    notifyListeners();
  }

  Future<void> postImageReceipt(File imageReceipt, String reservationId) async {
    changeState(BookOfficeViewState.loading);
    try {
      BookOfficeAPI.postPaymentReceipt(reservationId, imageReceipt);
      changeState(BookOfficeViewState.none);
    } catch (error) {
      debugPrint(error.toString());
      changeState(BookOfficeViewState.error);
    }
    notifyListeners();
  }

  Future<void> getListMessage() async {
    changeState(BookOfficeViewState.loading);
    try {
      var data = await BookOfficeAPI.getListMessage();
      _listChat = data;
      changeState(BookOfficeViewState.none);
    } catch (error) {
      debugPrint(error.toString());
      changeState(BookOfficeViewState.error);
    }
    notifyListeners();
  }

  Future<void> sendMessage(DataMessage dataMessage) async {
    changeState(BookOfficeViewState.loading);
    try {
      BookOfficeAPI.sendMessage(dataMessage);
      changeState(BookOfficeViewState.none);
    } catch (error) {
      debugPrint(error.toString());
      changeState(BookOfficeViewState.error);
    }
    notifyListeners();
  }

  Future<void> cancelRequestBooking(String reservationId) async {
    changeState(BookOfficeViewState.loading);
    try {
      BookOfficeAPI.cancelRequestBooking(reservationId);
      changeState(BookOfficeViewState.none);
    } catch (error) {
      debugPrint(error.toString());
      changeState(BookOfficeViewState.error);
    }
    notifyListeners();
  }
}
