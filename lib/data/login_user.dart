// class LoginUser {
//   bool error;
//   String message;
//   Data data;

//   LoginUser({this.error, this.message, this.data});

//   LoginUser.fromJson(Map<String, dynamic> json) {
//     error = json['error'];
//     message = json['message'];
//     data = json['data'] != null ? new Data.fromJson(json['data']) : null;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['error'] = this.error;
//     data['message'] = this.message;
//     if (this.data != null) {
//       data['data'] = this.data.toJson();
//     }
//     return data;
//   }
// }

class LoginUser {
  int? id;
  String? fName;
  String? lName;
  String? displayName;
  String? gender;
  String? phone;
  String? email;
  Null emailVerifiedAt;
  Null blockedAt;
  String? myReferralCode;
  Null avatarUrl;
  Null latitude;
  Null longitude;
  Null timeZone;
  Null location;
  Null timezoneIdentifier;
  String? onlineStatus;
  String? birthDate;
  Null hasAnsweredQuestions;
  Null usesBitmoji;
  String? authToken;
  Null fcmToken;
  int? companyId;
  String? staffId;
  Null rating;
  Null lastSeen;
  String? createdAt;
  String? updatedAt;

  LoginUser(
      {this.id,
      this.fName,
      this.lName,
      this.displayName,
      this.gender,
      this.phone,
      this.email,
      this.emailVerifiedAt,
      this.blockedAt,
      this.myReferralCode,
      this.avatarUrl,
      this.latitude,
      this.longitude,
      this.timeZone,
      this.location,
      this.timezoneIdentifier,
      this.onlineStatus,
      this.birthDate,
      this.hasAnsweredQuestions,
      this.usesBitmoji,
      this.authToken,
      this.fcmToken,
      this.companyId,
      this.staffId,
      this.rating,
      this.lastSeen,
      this.createdAt,
      this.updatedAt});

  LoginUser.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fName = json['f_name'];
    lName = json['l_name'];
    displayName = json['display_name'];
    gender = json['gender'];
    phone = json['phone'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    blockedAt = json['blocked_at'];
    myReferralCode = json['my_referral_code'];
    avatarUrl = json['avatar_url'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    timeZone = json['time_zone'];
    location = json['location'];
    timezoneIdentifier = json['timezone_identifier'];
    onlineStatus = json['online_status'];
    birthDate = json['birth_date'];
    hasAnsweredQuestions = json['has_answered_questions'];
    usesBitmoji = json['uses_bitmoji'];
    authToken = json['auth_token'];
    fcmToken = json['fcm_token'];
    companyId = json['company_id'];
    staffId = json['staff_id'];
    rating = json['rating'];
    lastSeen = json['last_seen'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['f_name'] = this.fName;
    data['l_name'] = this.lName;
    data['display_name'] = this.displayName;
    data['gender'] = this.gender;
    data['phone'] = this.phone;
    data['email'] = this.email;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['blocked_at'] = this.blockedAt;
    data['my_referral_code'] = this.myReferralCode;
    data['avatar_url'] = this.avatarUrl;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['time_zone'] = this.timeZone;
    data['location'] = this.location;
    data['timezone_identifier'] = this.timezoneIdentifier;
    data['online_status'] = this.onlineStatus;
    data['birth_date'] = this.birthDate;
    data['has_answered_questions'] = this.hasAnsweredQuestions;
    data['uses_bitmoji'] = this.usesBitmoji;
    data['auth_token'] = this.authToken;
    data['fcm_token'] = this.fcmToken;
    data['company_id'] = this.companyId;
    data['staff_id'] = this.staffId;
    data['rating'] = this.rating;
    data['last_seen'] = this.lastSeen;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
