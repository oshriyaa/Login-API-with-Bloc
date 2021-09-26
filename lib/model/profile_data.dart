// To parse this JSON data, do
//
//     final userProfile = userProfileFromJson(jsonString);

import 'dart:convert';

UserProfile userProfileFromJson(String str) =>
    UserProfile.fromJson(json.decode(str));

String userProfileToJson(UserProfile data) => json.encode(data.toJson());

class UserProfile {
  UserProfile({
    this.status,
    this.message,
    this.profile,
  });

  String? status;
  String? message;
  Profile? profile;

  factory UserProfile.fromJson(Map<String, dynamic> json) => UserProfile(
        status: json["status"],
        message: json["message"],
        profile: Profile.fromJson(json["profile"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "profile": profile!.toJson(),
      };
}

class Profile {
  Profile({
    this.primaryEmail,
    this.fullName,
    this.level,
    this.phoneNumber,
    this.phoneVerify,
    this.currentAddress,
    this.permanentAddress,
    this.pointCounter,
    this.regDate,
    this.about,
    this.image,
  });

  String? primaryEmail;
  String? fullName;
  String? level;
  String? phoneNumber;
  String? phoneVerify;
  String? currentAddress;
  String? permanentAddress;
  String? pointCounter;
  DateTime? regDate;
  String? about;
  String? image;

  factory Profile.fromJson(Map<String, dynamic> json) => Profile(
        primaryEmail: json["primary_email"],
        fullName: json["full_name"],
        level: json["level"],
        phoneNumber: json["phone_number"],
        phoneVerify: json["phone_verify"],
        currentAddress: json["current_address"],
        permanentAddress: json["permanent_address"],
        pointCounter: json["point_counter"],
        regDate: DateTime.parse(json["reg_date"]),
        about: json["about"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "primary_email": primaryEmail,
        "full_name": fullName,
        "level": level,
        "phone_number": phoneNumber,
        "phone_verify": phoneVerify,
        "current_address": currentAddress,
        "permanent_address": permanentAddress,
        "point_counter": pointCounter,
        "reg_date":
            "${regDate!.year.toString().padLeft(4, '0')}-${regDate!.month.toString().padLeft(2, '0')}-${regDate!.day.toString().padLeft(2, '0')}",
        "about": about,
        "image": image,
      };
}
