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

  //  BuildingOffice.fromJson(Map<String, dynamic> json) {
  //   picture = json['picture'];
  //   name = json['name'];
  //   location = json['location'];
  //   capacity = json['capacity'];
  //   toilet = json['toilet'];
  //   stairs = json['Stairs'];
  //   rating = json['rating'];
  //   price = json['price'];
  //   desciption = json['desciption'];
  //   id = json['id'];
  // }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = <String, dynamic>{};
  //   data['picture'] = picture;
  //   data['name'] = name;
  //   data['price'] = price;
  //   data['location'] = location;
  //   data['capacity'] = capacity;
  //   data['toilet'] = toilet;
  //   data['Stairs'] = stairs;
  //   data['rating'] = rating;
  //   data['desciption'] = desciption;
  //   data['id'] = id;
  // return data;
  // }
}

List<String> image = [
  'https://www.ceosuite.com/wp-content/uploads/2013/04/CEO_SSC_Room_Office_IMG_1611-1024x683.jpg',
  'https://www.officeevolution.com/hubfs/PrivateOfficeHomeUpdated.jpg',
  'https://webcdn.executivecentre.com/wp-content/uploads/2020/05/Singapore-GatewayWest-OfficeView.jpg',
  'https://www.decorilla.com/online-decorating/wp-content/uploads/2022/01/online-office-design-Ibrahim-H.jpg',
  'https://images.ctfassets.net/9mt55bm0937w/1VhXxVR2AP6jpbAaXKdr4I/6ba92dd0b690f2b59fc2caae3991504f/Key-Visual_Flexible-Office_Frankfurt_Wiesenh__ttenplatz.jpg?q=75&fm=webp',
  'https://5.imimg.com/data5/FS/AT/KB/SELLER-11981626/office-room-design-500x500.jpeg',
];
