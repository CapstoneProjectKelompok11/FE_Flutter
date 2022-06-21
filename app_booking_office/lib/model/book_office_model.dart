import 'dart:convert';

import 'package:flutter/cupertino.dart';

class BuildingOffice {
  String picture;
  String name;
  String location;
  int capacity;
  int toilet;
  int stairs;
  int rating;
  String price;
  String desciption;

  BuildingOffice({
    required this.picture,
    required this.name,
    required this.price,
    required this.location,
    required this.capacity,
    required this.toilet,
    required this.stairs,
    required this.rating,
    required this.desciption,
  });
}

class Complex {
  String? timestamp;
  StatusComplex? status;
  List<DataComplex>? data;

  Complex({this.timestamp, this.status, this.data});

  Complex.fromJson(Map<String, dynamic> json) {
    timestamp = json['timestamp'];
    status =
        json['status'] != null ? StatusComplex.fromJson(json['status']) : null;
    if (json['data'] != null) {
      data = <DataComplex>[];
      json['data'].forEach((v) {
        data!.add(DataComplex.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['timestamp'] = timestamp;
    if (status != null) {
      data['status'] = status!.toJson();
    }
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class StatusComplex {
  String? code;
  String? message;

  StatusComplex({this.code, this.message});

  StatusComplex.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['message'] = message;
    return data;
  }
}

class DataComplex {
  int? id;
  String? complexName;
  CityComplex? city;

  DataComplex({this.id, this.complexName, this.city});

  DataComplex.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    complexName = json['complexName'];
    city = json['city'] != null ? CityComplex.fromJson(json['city']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['complexName'] = complexName;
    if (city != null) {
      data['city'] = city!.toJson();
    }
    return data;
  }
}

class CityComplex {
  int? id;
  String? cityName;

  CityComplex({this.id, this.cityName});

  CityComplex.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    cityName = json['cityName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['cityName'] = cityName;
    return data;
  }
}

//---------------------------------------------------------
//----------------------------------------------------------

Floor floorFromJson(String str) => Floor.fromJson(json.decode(str));

String floorToJson(Floor data) => json.encode(data.toJson());

class Floor {
  Floor({
    required this.timestamp,
    required this.status,
    required this.data,
  });

  String timestamp;
  Status status;
  List<DataFloor> data;

  factory Floor.fromJson(Map<String, dynamic> json) => Floor(
        timestamp: json["timestamp"],
        status: Status.fromJson(json["status"]),
        data: List<DataFloor>.from(
            json["data"].map((x) => DataFloor.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "timestamp": timestamp,
        "status": status.toJson(),
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class DataFloor {
  DataFloor({
    required this.id,
    required this.name,
    required this.type,
    required this.floorSize,
    required this.maxCapacity,
    required this.startingPrice,
    required this.image,
    required this.facilities,
  });

  int id;
  String name;
  String type;
  String floorSize;
  int maxCapacity;
  int startingPrice;
  String image;
  List<dynamic> facilities;

  factory DataFloor.fromJson(Map<String, dynamic> json) => DataFloor(
        id: json["id"],
        name: json["name"],
        type: json["type"],
        floorSize: json["floor_size"],
        maxCapacity: json["max_capacity"],
        startingPrice: json["starting_price"],
        image: json["image"],
        facilities: List<dynamic>.from(json["facilities"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "type": type,
        "floor_size": floorSize,
        "max_capacity": maxCapacity,
        "starting_price": startingPrice,
        "image": image,
        "facilities": List<dynamic>.from(facilities.map((x) => x)),
      };
}

class StatusFloor {
  StatusFloor({
    required this.code,
    required this.message,
  });

  String code;
  String message;

  factory StatusFloor.fromJson(Map<String, dynamic> json) => StatusFloor(
        code: json["code"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
      };
}

//-------------------------------------------------------------
//------------------------------------------------------------
class City {
  String? timestamp;
  StatusCity? status;
  List<DataCity>? data;

  City({this.timestamp, this.status, this.data});

  City.fromJson(Map<String, dynamic> json) {
    timestamp = json['timestamp'];
    status =
        json['status'] != null ? StatusCity.fromJson(json['status']) : null;
    if (json['data'] != null) {
      data = <DataCity>[];
      json['data'].forEach((v) {
        data!.add(DataCity.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['timestamp'] = timestamp;
    if (status != null) {
      data['status'] = status!.toJson();
    }
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class StatusCity {
  String? code;
  String? message;

  StatusCity({this.code, this.message});

  StatusCity.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['message'] = message;
    return data;
  }
}

class DataCity {
  int? id;
  String? cityName;

  DataCity({this.id, this.cityName});

  DataCity.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    cityName = json['cityName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['cityName'] = cityName;
    return data;
  }
}

//--------------------------------------------------------------
//--------------------------------------------------------------

Buildings buildingsFromJson(String str) => Buildings.fromJson(json.decode(str));

String buildingsToJson(Buildings data) => json.encode(data.toJson());

class Buildings {
  Buildings({
    required this.timestamp,
    required this.status,
    required this.data,
  });

  final String timestamp;
  final Status status;
  final List<DataBuilding> data;

  factory Buildings.fromJson(Map<String, dynamic> json) => Buildings(
        timestamp: json["timestamp"],
        status: Status.fromJson(json["status"]),
        data: List<DataBuilding>.from(
            json["data"].map((x) => DataBuilding.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "timestamp": timestamp,
        "status": status.toJson(),
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class DataBuilding {
  DataBuilding({
    required this.id,
    required this.name,
    required this.address,
    required this.description,
    required this.rating,
    required this.officeType,
    required this.buildingSize,
    required this.floorCount,
    required this.capacity,
    required this.images,
    required this.complex,
  });

  final int id;
  final String name;
  final String address;
  final String description;
  final double rating;
  final List<String> officeType;
  final String buildingSize;
  final int floorCount;
  final int capacity;
  final List<ImageBuildings> images;
  final Complex complex;

  factory DataBuilding.fromJson(Map<String, dynamic> json) => DataBuilding(
        id: json["id"],
        name: json["name"],
        address: json["address"],
        description: json["description"],
        rating: json["rating"],
        officeType: List<String>.from(json["office_type"].map((x) => x)),
        buildingSize: json["building_size"],
        floorCount: json["floor_count"],
        capacity: json["capacity"],
        images: List<ImageBuildings>.from(
            json["images"].map((x) => ImageBuildings.fromJson(x))),
        complex: Complex.fromJson(json["complex"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "address": address,
        "description": description,
        "rating": rating,
        "office_type": List<dynamic>.from(officeType.map((x) => x)),
        "building_size": buildingSize,
        "floor_count": floorCount,
        "capacity": capacity,
        "images": List<dynamic>.from(images.map((x) => x.toJson())),
        "complex": complex.toJson(),
      };
}

class ComplexBuilding {
  ComplexBuilding({
    required this.id,
    required this.complexName,
    required this.city,
  });

  final int id;
  final String complexName;
  final City city;

  factory ComplexBuilding.fromJson(Map<String, dynamic> json) =>
      ComplexBuilding(
        id: json["id"],
        complexName: json["complex_name"],
        city: City.fromJson(json["city"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "complex_name": complexName,
        "city": city.toJson(),
      };
}

class CityBuilding {
  CityBuilding({
    required this.id,
    required this.cityName,
  });

  final int id;
  final String cityName;

  factory CityBuilding.fromJson(Map<String, dynamic> json) => CityBuilding(
        id: json["id"],
        cityName: json["city_name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "city_name": cityName,
      };
}

class ImageBuildings {
  ImageBuildings({
    required this.fileName,
  });

  final String fileName;

  factory ImageBuildings.fromJson(Map<String, dynamic> json) => ImageBuildings(
        fileName: json["fileName"],
      );

  Map<String, dynamic> toJson() => {
        "fileName": fileName,
      };
}

class Status {
  Status({
    required this.code,
    required this.message,
  });

  final String code;
  final String message;

  factory Status.fromJson(Map<String, dynamic> json) => Status(
        code: json["code"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
      };
}

//------------------------------------------------------------
//----------------------------------------------------------

class ImageFloor {
  Image? imageFloor;

  ImageFloor({
    this.imageFloor,
  });
}

class ImageBuilding {
  String? imageBuilding;

  ImageBuilding({
    this.imageBuilding,
  });
}
