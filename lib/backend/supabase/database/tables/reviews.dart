import '../database.dart';

class ReviewsTable extends SupabaseTable<ReviewsRow> {
  @override
  String get tableName => 'Reviews';

  @override
  ReviewsRow createRow(Map<String, dynamic> data) => ReviewsRow(data);
}

class ReviewsRow extends SupabaseDataRow {
  ReviewsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ReviewsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdTime => getField<DateTime>('createdTime')!;
  set createdTime(DateTime value) => setField<DateTime>('createdTime', value);

  int? get reviewSourceRef => getField<int>('reviewSourceRef');
  set reviewSourceRef(int? value) => setField<int>('reviewSourceRef', value);

  String? get title => getField<String>('title');
  set title(String? value) => setField<String>('title', value);

  String? get avatar => getField<String>('avatar');
  set avatar(String? value) => setField<String>('avatar', value);

  double? get score => getField<double>('score');
  set score(double? value) => setField<double>('score', value);

  String? get description => getField<String>('description');
  set description(String? value) => setField<String>('description', value);

  String? get productRef => getField<String>('productRef');
  set productRef(String? value) => setField<String>('productRef', value);
}
