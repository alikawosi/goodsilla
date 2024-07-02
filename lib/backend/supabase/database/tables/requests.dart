import '../database.dart';

class RequestsTable extends SupabaseTable<RequestsRow> {
  @override
  String get tableName => 'Requests';

  @override
  RequestsRow createRow(Map<String, dynamic> data) => RequestsRow(data);
}

class RequestsRow extends SupabaseDataRow {
  RequestsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => RequestsTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  DateTime get createdTime => getField<DateTime>('createdTime')!;
  set createdTime(DateTime value) => setField<DateTime>('createdTime', value);

  String get userRef => getField<String>('userRef')!;
  set userRef(String value) => setField<String>('userRef', value);

  String? get status => getField<String>('status');
  set status(String? value) => setField<String>('status', value);
}
