import '../database.dart';

class UsersTable extends SupabaseTable<UsersRow> {
  @override
  String get tableName => 'Users';

  @override
  UsersRow createRow(Map<String, dynamic> data) => UsersRow(data);
}

class UsersRow extends SupabaseDataRow {
  UsersRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => UsersTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  DateTime get createdTime => getField<DateTime>('createdTime')!;
  set createdTime(DateTime value) => setField<DateTime>('createdTime', value);

  String get firstName => getField<String>('firstName')!;
  set firstName(String value) => setField<String>('firstName', value);

  String get lastName => getField<String>('lastName')!;
  set lastName(String value) => setField<String>('lastName', value);

  String? get avatar => getField<String>('avatar');
  set avatar(String? value) => setField<String>('avatar', value);

  String get email => getField<String>('email')!;
  set email(String value) => setField<String>('email', value);

  DateTime? get birthDate => getField<DateTime>('birthDate');
  set birthDate(DateTime? value) => setField<DateTime>('birthDate', value);

  String? get phoneNumber => getField<String>('phoneNumber');
  set phoneNumber(String? value) => setField<String>('phoneNumber', value);
}
