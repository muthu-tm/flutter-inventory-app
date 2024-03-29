part of 'user.dart';

User _$UserFromJson(Map<String, dynamic> json) {
  return User()
    ..guid = json['guid'] as String ?? ''
    ..mobileNumber = json['mobile_number'] as int
    ..countryCode = json['country_code'] as int ?? 91
    ..firstName = json['first_name'] as String ?? ''
    ..lastName = json['last_name'] as String ?? ''
    ..emailID = json['emailID'] as String ?? ''
    ..password = json['password'] as String
    ..gender = json['gender'] as String ?? ''
    ..profilePath = json['profile_path'] as String ?? ''
    ..dateOfBirth = json['date_of_birth'] as int
    ..lastSignInTime = json['last_signed_in_at'] == null
        ? null
        : DateTime.fromMillisecondsSinceEpoch(
            _getMillisecondsSinceEpoch(json['last_signed_in_at'] as Timestamp))
    ..isActive = json['is_active'] as bool ?? true
    ..deactivatedAt = json['deactivated_at'] as int
    ..business = (json['business'] as List)?.map((e) => e as String)?.toList()
    ..primaryBusiness = json['primary_business'] as String ?? ''
    ..createdAt = json['created_at'] == null
        ? null
        : DateTime.fromMillisecondsSinceEpoch(
            _getMillisecondsSinceEpoch(json['created_at'] as Timestamp))
    ..updatedAt = json['updated_at'] == null
        ? null
        : DateTime.fromMillisecondsSinceEpoch(
            _getMillisecondsSinceEpoch(json['updated_at'] as Timestamp));
}

int _getMillisecondsSinceEpoch(Timestamp ts) {
  return ts.millisecondsSinceEpoch;
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'guid': instance.guid,
      'first_name': instance.firstName ?? '',
      'last_name': instance.lastName ?? '',
      'mobile_number': instance.mobileNumber,
      'country_code': instance.countryCode,
      'emailID': instance.emailID ?? '',
      'password': instance.password,
      'gender': instance.gender ?? '',
      'profile_path': instance.profilePath ?? '',
      'date_of_birth': instance.dateOfBirth,
      'last_signed_in_at': instance.lastSignInTime,
      'is_active': instance.isActive,
      'deactivated_at': instance.deactivatedAt,
      'business': instance.business ?? [],
      'primary_business': instance.primaryBusiness ?? '',
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
