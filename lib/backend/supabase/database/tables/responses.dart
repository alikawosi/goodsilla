import '../database.dart';

class ResponsesTable extends SupabaseTable<ResponsesRow> {
  @override
  String get tableName => 'Responses';

  @override
  ResponsesRow createRow(Map<String, dynamic> data) => ResponsesRow(data);
}

class ResponsesRow extends SupabaseDataRow {
  ResponsesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ResponsesTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  DateTime get createdTime => getField<DateTime>('createdTime')!;
  set createdTime(DateTime value) => setField<DateTime>('createdTime', value);

  String? get requestRef => getField<String>('requestRef');
  set requestRef(String? value) => setField<String>('requestRef', value);

  List<dynamic> get reviews => getListField<dynamic>('reviews');
  set reviews(List<dynamic>? value) => setListField<dynamic>('reviews', value);

  double? get averageScore => getField<double>('averageScore');
  set averageScore(double? value) => setField<double>('averageScore', value);

  String? get description => getField<String>('description');
  set description(String? value) => setField<String>('description', value);

  List<String> get featureList => getListField<String>('featureList');
  set featureList(List<String>? value) =>
      setListField<String>('featureList', value);
}
