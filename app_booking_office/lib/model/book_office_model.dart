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
  final ComplexBuilding complex;

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
        complex: ComplexBuilding.fromJson(json["complex"]),
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

class CaroselComplex {
  String id;
  String image;
  String title;

  CaroselComplex({
    required this.id,
    required this.image,
    required this.title,
  });
}

List<CaroselComplex> complexCarosel = [
  CaroselComplex(
      id: '3',
      image:
          'https://lampungpro.co/laravel-filemanager/photos/17/BARU3/IMG_20200406_080722.jpg',
      title: 'Tanah Abang'),
  CaroselComplex(
      id: '4',
      image:
          'https://pict.sindonews.net/dyn/620/content/2017/09/25/179/1242880/manajemen-bantah-mal-senayan-city-dijual-rp5-5-triliun-HBT-thumb.jpg',
      title: 'Senayan City'),
  CaroselComplex(
      id: '5',
      image:
          'http://assets.kompasiana.com/items/album/2022/01/03/3764246768-61d256db4b660d3a3b61ccc2.jpg?t=o&v=770',
      title: 'SCBD'),
  CaroselComplex(
      id: '10',
      image:
          'https://cdn.antaranews.com/cache/800x533/2020/06/03/20200603_172512.jpg',
      title: 'Sudirman'),
  CaroselComplex(
      id: '11',
      image:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRjxDGdqLTtAgbfXqN5x53gzp0ham9OlmYpz0dBUF2Nyn71nDCamCTOAS3SNrRlhmgFOqQ&usqp=CAU',
      title: 'Kuningan'),
  CaroselComplex(
      id: '2',
      image:
          'https://cdn1-production-images-kly.akamaized.net/E1Bzjr7fnxJiXjUEaMoGvnrUNDg=/640x360/smart/filters:quality(75):strip_icc():format(jpeg)/kly-media-production/medias/2726919/original/065948600_1549973574-20190212-Aplikasi-MOS-Pelabuhan-Tekan-Biaya-Lebih-Hemat-Johan4.jpg',
      title: 'Tanjung Priok'),
  CaroselComplex(
      id: '1',
      image:
          'https://media-cdn.tripadvisor.com/media/photo-s/23/d5/08/c8/holiday-inn-express-jakarta.jpg',
      title: 'Pluit'),
  CaroselComplex(
      id: '9',
      image:
          'https://s-light.tiket.photos/t/01E25EBZS3W0FY9GTG6C42E1SE/t_htl-dskt/tix-hotel/images-web/2020/10/31/0078c537-9ec0-4643-a002-3d57cb2057fe-1604162939502-8e090269f6534acf3fe0946593ac8c45.jpg',
      title: 'Cengkareang'),
  CaroselComplex(
      id: '8',
      image:
          'https://ik.imagekit.io/tvlk/apr-asset/dgXfoyh24ryQLRcGq00cIdKHRmotrWLNlvG-TxlcLxGkiDwaUSggleJNPRgIHCX6/hotel/asset/20023265-de9931e266080ac88064ed37af8cd877.jpeg?_src=imagekit&tr=c-at_max,h-488,q-40,w-768',
      title: 'Kebon Jeruk'),
  CaroselComplex(
      id: '7',
      image: 'https://kfmap.asia/thumbs/photos/ID.JKT.HT.I6/ID.JKT.HT.I6_1.jpg',
      title: 'Cawang'),
  CaroselComplex(
      id: '6',
      image:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT2V85ra9SKW_S6OuBIaF8622vqnN5b2RGo9gJ-OIoe_rWPRRJiVef_FPb5v8S1Okgnq8M&usqp=CAU',
      title: 'Rawamangun')
];
