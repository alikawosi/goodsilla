import '../database.dart';

class ReviewSourceTable extends SupabaseTable<ReviewSourceRow> {
  @override
  String get tableName => 'ReviewSource';

  @override
  ReviewSourceRow createRow(Map<String, dynamic> data) => ReviewSourceRow(data);
}

class ReviewSourceRow extends SupabaseDataRow {
  ReviewSourceRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ReviewSourceTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  String? get title => getField<String>('title');
  set title(String? value) => setField<String>('title', value);

  String? get address => getField<String>('address');
  set address(String? value) => setField<String>('address', value);

  String? get description => getField<String>('description');
  set description(String? value) => setField<String>('description', value);

  DateTime get createdTime => getField<DateTime>('createdTime')!;
  set createdTime(DateTime value) => setField<DateTime>('createdTime', value);
}
