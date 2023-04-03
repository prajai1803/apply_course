import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  UserModel({
    this.uid,
    this.displayName,
    this.email,
    this.photoUrl,
    this.phoneNumber,
    this.token,
    this.emailVerified,
  });

  String? uid;
  String? displayName;
  String? email;
  String? photoUrl;
  String? phoneNumber;
  String? token;
  bool? emailVerified;

  UserModel copyWith({
    String? uid,
    String? displayName,
    String? email,
    String? photoUrl,
    String? phoneNumber,
    String? token,
    bool? emailVerified,
  }) =>
      UserModel(
        uid: uid ?? this.uid,
        displayName: displayName ?? this.displayName,
        email: email ?? this.email,
        photoUrl: photoUrl ?? this.photoUrl,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        token: token ?? this.token,
        emailVerified: emailVerified ?? this.emailVerified,
      );

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        uid: json["uid"],
        displayName: json["displayName"],
        email: json["email"],
        photoUrl: json["photoUrl"],
        phoneNumber: json["phoneNumber"],
        token: json["token"],
        emailVerified: json["emailVerified"],
      );

  Map<String, dynamic> toJson() => {
        "uid": uid,
        "displayName": displayName,
        "email": email,
        "photoUrl": photoUrl,
        "phoneNumber": phoneNumber,
        "token": token,
        "emailVerified": emailVerified
      };
}
