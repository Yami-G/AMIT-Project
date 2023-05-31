import 'dart:convert';

/// data : {"id":"26464c58-e244-4c5c-bb96-71734ab590c9","email":"restaurant@gmail.com","name":"restaurant","rest_name":"abouassi","is_available":1,"address":"tanta","longtitude":12.555565,"latitude":12.56545868,"type":"restaurant","phone":"01207333848","image":"http://yalla-app.herokuapp.com/storage/uploads/restaurant/1682342317_YqLtkIa4vZmW.jpeg","balance":"0.00","working_hours":{"id":"343f8fda-461e-4f2c-bf75-6ee512d4b00d","lat":12.56545868,"lng":12.555565,"saturday_active":0,"saturday_open":"12:12:00","saturday_close":"12:12:00","sunday_active":1,"sunday_open":"12:12:00","sunday_close":"12:12:00","monday_active":0,"monday_open":"12:12:00","monday_close":"12:12:00","tuesday_active":1,"tuesday_open":"12:12:00","tuesday_close":"12:12:00","wednesday_active":0,"wednesday_open":"12:12:00","wednesday_close":"12:12:00","thursday_active":1,"thursday_open":"12:12:00","thursday_close":"12:12:00","friday_active":1,"friday_open":"12:12:00","friday_close":"01:20:00"},"token":"91031f61-6277-498d-8ee4-dd7af2f9b1a0|ICCC96xWOMGZ0iNUFs4grZp7waZUumX6tPomsLhq","created_at":"2023-04-15"}
/// status : true
/// message : "auth.success_login"

UsersModels usersModelsFromJson(String str) => UsersModels.fromJson(json.decode(str));
String usersModelsToJson(UsersModels data) => json.encode(data.toJson());

class UsersModels {
  UsersModels({
    Data? data,
    bool? status,
    String? message,
  }) {
    _data = data;
    _status = status;
    _message = message;
  }

  UsersModels.fromJson(dynamic json) {
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
    _status = json['status'];
    _message = json['message'];
  }
  Data? _data;
  bool? _status;
  String? _message;
  UsersModels copyWith({
    Data? data,
    bool? status,
    String? message,
  }) =>
      UsersModels(
        data: data ?? _data,
        status: status ?? _status,
        message: message ?? _message,
      );
  Data? get data => _data;
  bool? get status => _status;
  String? get message => _message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    map['status'] = _status;
    map['message'] = _message;
    return map;
  }
}

/// id : "26464c58-e244-4c5c-bb96-71734ab590c9"
/// email : "restaurant@gmail.com"
/// name : "restaurant"
/// rest_name : "abouassi"
/// is_available : 1
/// address : "tanta"
/// longtitude : 12.555565
/// latitude : 12.56545868
/// type : "restaurant"
/// phone : "01207333848"
/// image : "http://yalla-app.herokuapp.com/storage/uploads/restaurant/1682342317_YqLtkIa4vZmW.jpeg"
/// balance : "0.00"
/// working_hours : {"id":"343f8fda-461e-4f2c-bf75-6ee512d4b00d","lat":12.56545868,"lng":12.555565,"saturday_active":0,"saturday_open":"12:12:00","saturday_close":"12:12:00","sunday_active":1,"sunday_open":"12:12:00","sunday_close":"12:12:00","monday_active":0,"monday_open":"12:12:00","monday_close":"12:12:00","tuesday_active":1,"tuesday_open":"12:12:00","tuesday_close":"12:12:00","wednesday_active":0,"wednesday_open":"12:12:00","wednesday_close":"12:12:00","thursday_active":1,"thursday_open":"12:12:00","thursday_close":"12:12:00","friday_active":1,"friday_open":"12:12:00","friday_close":"01:20:00"}
/// token : "91031f61-6277-498d-8ee4-dd7af2f9b1a0|ICCC96xWOMGZ0iNUFs4grZp7waZUumX6tPomsLhq"
/// created_at : "2023-04-15"

Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());

class Data {
  Data({
    String? id,
    String? email,
    String? name,
    String? restName,
    num? isAvailable,
    String? address,
    num? longtitude,
    num? latitude,
    String? type,
    String? phone,
    String? image,
    String? balance,
    WorkingHours? workingHours,
    String? token,
    String? createdAt,
  }) {
    _id = id;
    _email = email;
    _name = name;
    _restName = restName;
    _isAvailable = isAvailable;
    _address = address;
    _longtitude = longtitude;
    _latitude = latitude;
    _type = type;
    _phone = phone;
    _image = image;
    _balance = balance;
    _workingHours = workingHours;
    _token = token;
    _createdAt = createdAt;
  }

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _email = json['email'];
    _name = json['name'];
    _restName = json['rest_name'];
    _isAvailable = json['is_available'];
    _address = json['address'];
    _longtitude = json['longtitude'];
    _latitude = json['latitude'];
    _type = json['type'];
    _phone = json['phone'];
    _image = json['image'];
    _balance = json['balance'];
    _workingHours = json['working_hours'] != null ? WorkingHours.fromJson(json['working_hours']) : null;
    _token = json['token'];
    _createdAt = json['created_at'];
  }
  String? _id;
  String? _email;
  String? _name;
  String? _restName;
  num? _isAvailable;
  String? _address;
  num? _longtitude;
  num? _latitude;
  String? _type;
  String? _phone;
  String? _image;
  String? _balance;
  WorkingHours? _workingHours;
  String? _token;
  String? _createdAt;
  Data copyWith({
    String? id,
    String? email,
    String? name,
    String? restName,
    num? isAvailable,
    String? address,
    num? longtitude,
    num? latitude,
    String? type,
    String? phone,
    String? image,
    String? balance,
    WorkingHours? workingHours,
    String? token,
    String? createdAt,
  }) =>
      Data(
        id: id ?? _id,
        email: email ?? _email,
        name: name ?? _name,
        restName: restName ?? _restName,
        isAvailable: isAvailable ?? _isAvailable,
        address: address ?? _address,
        longtitude: longtitude ?? _longtitude,
        latitude: latitude ?? _latitude,
        type: type ?? _type,
        phone: phone ?? _phone,
        image: image ?? _image,
        balance: balance ?? _balance,
        workingHours: workingHours ?? _workingHours,
        token: token ?? _token,
        createdAt: createdAt ?? _createdAt,
      );
  String? get id => _id;
  String? get email => _email;
  String? get name => _name;
  String? get restName => _restName;
  num? get isAvailable => _isAvailable;
  String? get address => _address;
  num? get longtitude => _longtitude;
  num? get latitude => _latitude;
  String? get type => _type;
  String? get phone => _phone;
  String? get image => _image;
  String? get balance => _balance;
  WorkingHours? get workingHours => _workingHours;
  String? get token => _token;
  String? get createdAt => _createdAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['email'] = _email;
    map['name'] = _name;
    map['rest_name'] = _restName;
    map['is_available'] = _isAvailable;
    map['address'] = _address;
    map['longtitude'] = _longtitude;
    map['latitude'] = _latitude;
    map['type'] = _type;
    map['phone'] = _phone;
    map['image'] = _image;
    map['balance'] = _balance;
    if (_workingHours != null) {
      map['working_hours'] = _workingHours?.toJson();
    }
    map['token'] = _token;
    map['created_at'] = _createdAt;
    return map;
  }
}

/// id : "343f8fda-461e-4f2c-bf75-6ee512d4b00d"
/// lat : 12.56545868
/// lng : 12.555565
/// saturday_active : 0
/// saturday_open : "12:12:00"
/// saturday_close : "12:12:00"
/// sunday_active : 1
/// sunday_open : "12:12:00"
/// sunday_close : "12:12:00"
/// monday_active : 0
/// monday_open : "12:12:00"
/// monday_close : "12:12:00"
/// tuesday_active : 1
/// tuesday_open : "12:12:00"
/// tuesday_close : "12:12:00"
/// wednesday_active : 0
/// wednesday_open : "12:12:00"
/// wednesday_close : "12:12:00"
/// thursday_active : 1
/// thursday_open : "12:12:00"
/// thursday_close : "12:12:00"
/// friday_active : 1
/// friday_open : "12:12:00"
/// friday_close : "01:20:00"

WorkingHours workingHoursFromJson(String str) => WorkingHours.fromJson(json.decode(str));
String workingHoursToJson(WorkingHours data) => json.encode(data.toJson());

class WorkingHours {
  WorkingHours({
    String? id,
    num? lat,
    num? lng,
    num? saturdayActive,
    String? saturdayOpen,
    String? saturdayClose,
    num? sundayActive,
    String? sundayOpen,
    String? sundayClose,
    num? mondayActive,
    String? mondayOpen,
    String? mondayClose,
    num? tuesdayActive,
    String? tuesdayOpen,
    String? tuesdayClose,
    num? wednesdayActive,
    String? wednesdayOpen,
    String? wednesdayClose,
    num? thursdayActive,
    String? thursdayOpen,
    String? thursdayClose,
    num? fridayActive,
    String? fridayOpen,
    String? fridayClose,
  }) {
    _id = id;
    _lat = lat;
    _lng = lng;
    _saturdayActive = saturdayActive;
    _saturdayOpen = saturdayOpen;
    _saturdayClose = saturdayClose;
    _sundayActive = sundayActive;
    _sundayOpen = sundayOpen;
    _sundayClose = sundayClose;
    _mondayActive = mondayActive;
    _mondayOpen = mondayOpen;
    _mondayClose = mondayClose;
    _tuesdayActive = tuesdayActive;
    _tuesdayOpen = tuesdayOpen;
    _tuesdayClose = tuesdayClose;
    _wednesdayActive = wednesdayActive;
    _wednesdayOpen = wednesdayOpen;
    _wednesdayClose = wednesdayClose;
    _thursdayActive = thursdayActive;
    _thursdayOpen = thursdayOpen;
    _thursdayClose = thursdayClose;
    _fridayActive = fridayActive;
    _fridayOpen = fridayOpen;
    _fridayClose = fridayClose;
  }

  WorkingHours.fromJson(dynamic json) {
    _id = json['id'];
    _lat = json['lat'];
    _lng = json['lng'];
    _saturdayActive = json['saturday_active'];
    _saturdayOpen = json['saturday_open'];
    _saturdayClose = json['saturday_close'];
    _sundayActive = json['sunday_active'];
    _sundayOpen = json['sunday_open'];
    _sundayClose = json['sunday_close'];
    _mondayActive = json['monday_active'];
    _mondayOpen = json['monday_open'];
    _mondayClose = json['monday_close'];
    _tuesdayActive = json['tuesday_active'];
    _tuesdayOpen = json['tuesday_open'];
    _tuesdayClose = json['tuesday_close'];
    _wednesdayActive = json['wednesday_active'];
    _wednesdayOpen = json['wednesday_open'];
    _wednesdayClose = json['wednesday_close'];
    _thursdayActive = json['thursday_active'];
    _thursdayOpen = json['thursday_open'];
    _thursdayClose = json['thursday_close'];
    _fridayActive = json['friday_active'];
    _fridayOpen = json['friday_open'];
    _fridayClose = json['friday_close'];
  }
  String? _id;
  num? _lat;
  num? _lng;
  num? _saturdayActive;
  String? _saturdayOpen;
  String? _saturdayClose;
  num? _sundayActive;
  String? _sundayOpen;
  String? _sundayClose;
  num? _mondayActive;
  String? _mondayOpen;
  String? _mondayClose;
  num? _tuesdayActive;
  String? _tuesdayOpen;
  String? _tuesdayClose;
  num? _wednesdayActive;
  String? _wednesdayOpen;
  String? _wednesdayClose;
  num? _thursdayActive;
  String? _thursdayOpen;
  String? _thursdayClose;
  num? _fridayActive;
  String? _fridayOpen;
  String? _fridayClose;
  WorkingHours copyWith({
    String? id,
    num? lat,
    num? lng,
    num? saturdayActive,
    String? saturdayOpen,
    String? saturdayClose,
    num? sundayActive,
    String? sundayOpen,
    String? sundayClose,
    num? mondayActive,
    String? mondayOpen,
    String? mondayClose,
    num? tuesdayActive,
    String? tuesdayOpen,
    String? tuesdayClose,
    num? wednesdayActive,
    String? wednesdayOpen,
    String? wednesdayClose,
    num? thursdayActive,
    String? thursdayOpen,
    String? thursdayClose,
    num? fridayActive,
    String? fridayOpen,
    String? fridayClose,
  }) =>
      WorkingHours(
        id: id ?? _id,
        lat: lat ?? _lat,
        lng: lng ?? _lng,
        saturdayActive: saturdayActive ?? _saturdayActive,
        saturdayOpen: saturdayOpen ?? _saturdayOpen,
        saturdayClose: saturdayClose ?? _saturdayClose,
        sundayActive: sundayActive ?? _sundayActive,
        sundayOpen: sundayOpen ?? _sundayOpen,
        sundayClose: sundayClose ?? _sundayClose,
        mondayActive: mondayActive ?? _mondayActive,
        mondayOpen: mondayOpen ?? _mondayOpen,
        mondayClose: mondayClose ?? _mondayClose,
        tuesdayActive: tuesdayActive ?? _tuesdayActive,
        tuesdayOpen: tuesdayOpen ?? _tuesdayOpen,
        tuesdayClose: tuesdayClose ?? _tuesdayClose,
        wednesdayActive: wednesdayActive ?? _wednesdayActive,
        wednesdayOpen: wednesdayOpen ?? _wednesdayOpen,
        wednesdayClose: wednesdayClose ?? _wednesdayClose,
        thursdayActive: thursdayActive ?? _thursdayActive,
        thursdayOpen: thursdayOpen ?? _thursdayOpen,
        thursdayClose: thursdayClose ?? _thursdayClose,
        fridayActive: fridayActive ?? _fridayActive,
        fridayOpen: fridayOpen ?? _fridayOpen,
        fridayClose: fridayClose ?? _fridayClose,
      );
  String? get id => _id;
  num? get lat => _lat;
  num? get lng => _lng;
  num? get saturdayActive => _saturdayActive;
  String? get saturdayOpen => _saturdayOpen;
  String? get saturdayClose => _saturdayClose;
  num? get sundayActive => _sundayActive;
  String? get sundayOpen => _sundayOpen;
  String? get sundayClose => _sundayClose;
  num? get mondayActive => _mondayActive;
  String? get mondayOpen => _mondayOpen;
  String? get mondayClose => _mondayClose;
  num? get tuesdayActive => _tuesdayActive;
  String? get tuesdayOpen => _tuesdayOpen;
  String? get tuesdayClose => _tuesdayClose;
  num? get wednesdayActive => _wednesdayActive;
  String? get wednesdayOpen => _wednesdayOpen;
  String? get wednesdayClose => _wednesdayClose;
  num? get thursdayActive => _thursdayActive;
  String? get thursdayOpen => _thursdayOpen;
  String? get thursdayClose => _thursdayClose;
  num? get fridayActive => _fridayActive;
  String? get fridayOpen => _fridayOpen;
  String? get fridayClose => _fridayClose;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['lat'] = _lat;
    map['lng'] = _lng;
    map['saturday_active'] = _saturdayActive;
    map['saturday_open'] = _saturdayOpen;
    map['saturday_close'] = _saturdayClose;
    map['sunday_active'] = _sundayActive;
    map['sunday_open'] = _sundayOpen;
    map['sunday_close'] = _sundayClose;
    map['monday_active'] = _mondayActive;
    map['monday_open'] = _mondayOpen;
    map['monday_close'] = _mondayClose;
    map['tuesday_active'] = _tuesdayActive;
    map['tuesday_open'] = _tuesdayOpen;
    map['tuesday_close'] = _tuesdayClose;
    map['wednesday_active'] = _wednesdayActive;
    map['wednesday_open'] = _wednesdayOpen;
    map['wednesday_close'] = _wednesdayClose;
    map['thursday_active'] = _thursdayActive;
    map['thursday_open'] = _thursdayOpen;
    map['thursday_close'] = _thursdayClose;
    map['friday_active'] = _fridayActive;
    map['friday_open'] = _fridayOpen;
    map['friday_close'] = _fridayClose;
    return map;
  }
}
