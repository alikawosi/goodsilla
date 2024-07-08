// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class UsersInfoStruct extends BaseStruct {
  UsersInfoStruct({
    String? firstName,
    String? lastName,
    String? avatar,
    String? email,
    DateTime? birthDate,
    String? phoneNumber,
  })  : _firstName = firstName,
        _lastName = lastName,
        _avatar = avatar,
        _email = email,
        _birthDate = birthDate,
        _phoneNumber = phoneNumber;

  // "firstName" field.
  String? _firstName;
  String get firstName => _firstName ?? '';
  set firstName(String? val) => _firstName = val;

  bool hasFirstName() => _firstName != null;

  // "lastName" field.
  String? _lastName;
  String get lastName => _lastName ?? '';
  set lastName(String? val) => _lastName = val;

  bool hasLastName() => _lastName != null;

  // "avatar" field.
  String? _avatar;
  String get avatar => _avatar ?? '';
  set avatar(String? val) => _avatar = val;

  bool hasAvatar() => _avatar != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  set email(String? val) => _email = val;

  bool hasEmail() => _email != null;

  // "birthDate" field.
  DateTime? _birthDate;
  DateTime? get birthDate => _birthDate;
  set birthDate(DateTime? val) => _birthDate = val;

  bool hasBirthDate() => _birthDate != null;

  // "phoneNumber" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  set phoneNumber(String? val) => _phoneNumber = val;

  bool hasPhoneNumber() => _phoneNumber != null;

  static UsersInfoStruct fromMap(Map<String, dynamic> data) => UsersInfoStruct(
        firstName: data['firstName'] as String?,
        lastName: data['lastName'] as String?,
        avatar: data['avatar'] as String?,
        email: data['email'] as String?,
        birthDate: data['birthDate'] as DateTime?,
        phoneNumber: data['phoneNumber'] as String?,
      );

  static UsersInfoStruct? maybeFromMap(dynamic data) => data is Map
      ? UsersInfoStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'firstName': _firstName,
        'lastName': _lastName,
        'avatar': _avatar,
        'email': _email,
        'birthDate': _birthDate,
        'phoneNumber': _phoneNumber,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'firstName': serializeParam(
          _firstName,
          ParamType.String,
        ),
        'lastName': serializeParam(
          _lastName,
          ParamType.String,
        ),
        'avatar': serializeParam(
          _avatar,
          ParamType.String,
        ),
        'email': serializeParam(
          _email,
          ParamType.String,
        ),
        'birthDate': serializeParam(
          _birthDate,
          ParamType.DateTime,
        ),
        'phoneNumber': serializeParam(
          _phoneNumber,
          ParamType.String,
        ),
      }.withoutNulls;

  static UsersInfoStruct fromSerializableMap(Map<String, dynamic> data) =>
      UsersInfoStruct(
        firstName: deserializeParam(
          data['firstName'],
          ParamType.String,
          false,
        ),
        lastName: deserializeParam(
          data['lastName'],
          ParamType.String,
          false,
        ),
        avatar: deserializeParam(
          data['avatar'],
          ParamType.String,
          false,
        ),
        email: deserializeParam(
          data['email'],
          ParamType.String,
          false,
        ),
        birthDate: deserializeParam(
          data['birthDate'],
          ParamType.DateTime,
          false,
        ),
        phoneNumber: deserializeParam(
          data['phoneNumber'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'UsersInfoStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is UsersInfoStruct &&
        firstName == other.firstName &&
        lastName == other.lastName &&
        avatar == other.avatar &&
        email == other.email &&
        birthDate == other.birthDate &&
        phoneNumber == other.phoneNumber;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([firstName, lastName, avatar, email, birthDate, phoneNumber]);
}

UsersInfoStruct createUsersInfoStruct({
  String? firstName,
  String? lastName,
  String? avatar,
  String? email,
  DateTime? birthDate,
  String? phoneNumber,
}) =>
    UsersInfoStruct(
      firstName: firstName,
      lastName: lastName,
      avatar: avatar,
      email: email,
      birthDate: birthDate,
      phoneNumber: phoneNumber,
    );
