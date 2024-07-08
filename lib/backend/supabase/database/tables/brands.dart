import '../database.dart';

class BrandsTable extends SupabaseTable<BrandsRow> {
  @override
  String get tableName => 'Brands';

  @override
  BrandsRow createRow(Map<String, dynamic> data) => BrandsRow(data);
}

class BrandsRow extends SupabaseDataRow {
  BrandsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => BrandsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdTime => getField<DateTime>('createdTime')!;
  set createdTime(DateTime value) => setField<DateTime>('createdTime', value);

  String? get title => getField<String>('title');
  set title(String? value) => setField<String>('title', value);
}
