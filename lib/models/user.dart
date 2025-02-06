class User {
  int id;
  String f_name;
  String l_name;
  String display_name;
  String gender;
  String phone;
  String email;
  DateTime? email_verified_at;
  DateTime? blocked_at;
  String my_referral_code;
  String avatar_url;
  String location;
  String timezone_identifier;
  String online_status;
  String? birth_date;
  bool has_answered_questions;
  String uses_bitmoji;
  String auth_token;
  String fcm_token;
  String staff_id;
  double rating;
  String last_seen;
  String? created_at;
  String? updated_at;
  String quote;
  User({
    required this.id,
    required this.f_name,
    required this.l_name,
    required this.display_name,
    required this.gender,
    required this.phone,
    required this.email,
    required this.email_verified_at,
    required this.blocked_at,
    required this.my_referral_code,
    required this.avatar_url,
    required this.location,
    required this.timezone_identifier,
    required this.online_status,
    required this.birth_date,
    required this.has_answered_questions,
    required this.uses_bitmoji,
    required this.auth_token,
    required this.fcm_token,
    required this.staff_id,
    required this.rating,
    required this.last_seen,
    required this.created_at,
    required this.updated_at,
    required this.quote,
  });

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: (map['id'] ?? 0) as int,
      f_name: (map['f_name'] ?? '') as String,
      l_name: (map['l_name'] ?? '') as String,
      display_name: (map['display_name'] ?? '') as String,
      gender: map['gender'] ?? "",
      phone: (map['phone'] ?? '') as String,
      email: (map['email'] ?? '') as String,
      email_verified_at: map['email_verified_at'],
      blocked_at: map['blocked_at'],
      my_referral_code: (map['my_referral_code'] ?? '') as String,
      avatar_url: map['avatar_url'] ?? "",
      location: (map['location'] ?? '') as String,
      timezone_identifier: (map['timezone_identifier'] ?? '') as String,
      online_status: (map['online_status'] ?? '') as String,
      birth_date: map['birth_date'],
      has_answered_questions: map['has_answered_questions'] ?? false,
      uses_bitmoji: map['uses_bitmoji'] ?? "",
      auth_token: (map['auth_token'] ?? '') as String,
      fcm_token: map['fcm_token'] ?? "",
      staff_id: (map['staff_id'] ?? '') as String,
      rating: map['rating'] ?? 0.0,
      last_seen: (map['last_seen'] ?? '') as String,
      created_at: map['created_at'],
      updated_at: map['updated_at'],
      quote: (map['quote'] ?? '') as String,
    );
  }
}
