import '../database.dart';

class ProductsTable extends SupabaseTable<ProductsRow> {
  @override
  String get tableName => 'Products';

  @override
  ProductsRow createRow(Map<String, dynamic> data) => ProductsRow(data);
}

class ProductsRow extends SupabaseDataRow {
  ProductsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ProductsTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  DateTime get createdTime => getField<DateTime>('createdTime')!;
  set createdTime(DateTime value) => setField<DateTime>('createdTime', value);

  String? get title => getField<String>('title');
  set title(String? value) => setField<String>('title', value);

  String? get barcode => getField<String>('barcode');
  set barcode(String? value) => setField<String>('barcode', value);

  double? get price => getField<double>('price');
  set price(double? value) => setField<double>('price', value);

  int? get brandRef => getField<int>('brandRef');
  set brandRef(int? value) => setField<int>('brandRef', value);

  List<String> get featureList => getListField<String>('featureList');
  set featureList(List<String>? value) =>
      setListField<String>('featureList', value);

  List<String> get pros => getListField<String>('pros');
  set pros(List<String>? value) => setListField<String>('pros', value);

  List<String> get cons => getListField<String>('cons');
  set cons(List<String>? value) => setListField<String>('cons', value);
}
