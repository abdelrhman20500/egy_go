
class AuthModel {
  String? token;
  String? expiration;
  User? user;

  AuthModel({this.token, this.expiration, this.user});

  AuthModel.fromJson(Map<String, dynamic> json) {
    if(json["token"] is String) {
      token = json["token"];
    }
    if(json["expiration"] is String) {
      expiration = json["expiration"];
    }
    if(json["user"] is Map) {
      user = json["user"] == null ? null : User.fromJson(json["user"]);
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["token"] = token;
    data["expiration"] = expiration;
    if(user != null) {
      data["user"] = user?.toJson();
    }
    return data;
  }
}

class User {
  int? id;
  String? fullName;
  String? email;
  String? phoneNumber;
  dynamic profileImageUrl;
  dynamic country;
  dynamic city;

  User({this.id, this.fullName, this.email, this.phoneNumber, this.profileImageUrl, this.country, this.city});

  User.fromJson(Map<String, dynamic> json) {
    if(json["id"] is num) {
      id = (json["id"] as num).toInt();
    }
    if(json["fullName"] is String) {
      fullName = json["fullName"];
    }
    if(json["email"] is String) {
      email = json["email"];
    }
    if(json["phoneNumber"] is String) {
      phoneNumber = json["phoneNumber"];
    }
    profileImageUrl = json["profileImageUrl"];
    country = json["country"];
    city = json["city"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["fullName"] = fullName;
    data["email"] = email;
    data["phoneNumber"] = phoneNumber;
    data["profileImageUrl"] = profileImageUrl;
    data["country"] = country;
    data["city"] = city;
    return data;
  }
}