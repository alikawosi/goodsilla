// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ProductInfoStruct extends BaseStruct {
  ProductInfoStruct({
    String? ean,
    String? title,
    String? description,
    String? elid,
    String? brand,
    String? model,
    String? color,
    String? size,
    String? dimension,
    String? weight,
    String? category,
    double? lowestRecordedPrice,
    double? highestRecordedPrice,
    List<String>? images,
    List<String>? offers,
  })  : _ean = ean,
        _title = title,
        _description = description,
        _elid = elid,
        _brand = brand,
        _model = model,
        _color = color,
        _size = size,
        _dimension = dimension,
        _weight = weight,
        _category = category,
        _lowestRecordedPrice = lowestRecordedPrice,
        _highestRecordedPrice = highestRecordedPrice,
        _images = images,
        _offers = offers;

  // "ean" field.
  String? _ean;
  String get ean => _ean ?? '';
  set ean(String? val) => _ean = val;

  bool hasEan() => _ean != null;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  set title(String? val) => _title = val;

  bool hasTitle() => _title != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  set description(String? val) => _description = val;

  bool hasDescription() => _description != null;

  // "elid" field.
  String? _elid;
  String get elid => _elid ?? '';
  set elid(String? val) => _elid = val;

  bool hasElid() => _elid != null;

  // "brand" field.
  String? _brand;
  String get brand => _brand ?? '';
  set brand(String? val) => _brand = val;

  bool hasBrand() => _brand != null;

  // "model" field.
  String? _model;
  String get model => _model ?? '';
  set model(String? val) => _model = val;

  bool hasModel() => _model != null;

  // "color" field.
  String? _color;
  String get color => _color ?? '';
  set color(String? val) => _color = val;

  bool hasColor() => _color != null;

  // "size" field.
  String? _size;
  String get size => _size ?? '';
  set size(String? val) => _size = val;

  bool hasSize() => _size != null;

  // "dimension" field.
  String? _dimension;
  String get dimension => _dimension ?? '';
  set dimension(String? val) => _dimension = val;

  bool hasDimension() => _dimension != null;

  // "weight" field.
  String? _weight;
  String get weight => _weight ?? '';
  set weight(String? val) => _weight = val;

  bool hasWeight() => _weight != null;

  // "category" field.
  String? _category;
  String get category => _category ?? '';
  set category(String? val) => _category = val;

  bool hasCategory() => _category != null;

  // "lowest_recorded_price" field.
  double? _lowestRecordedPrice;
  double get lowestRecordedPrice => _lowestRecordedPrice ?? 0.0;
  set lowestRecordedPrice(double? val) => _lowestRecordedPrice = val;

  void incrementLowestRecordedPrice(double amount) =>
      lowestRecordedPrice = lowestRecordedPrice + amount;

  bool hasLowestRecordedPrice() => _lowestRecordedPrice != null;

  // "highest_recorded_price" field.
  double? _highestRecordedPrice;
  double get highestRecordedPrice => _highestRecordedPrice ?? 0.0;
  set highestRecordedPrice(double? val) => _highestRecordedPrice = val;

  void incrementHighestRecordedPrice(double amount) =>
      highestRecordedPrice = highestRecordedPrice + amount;

  bool hasHighestRecordedPrice() => _highestRecordedPrice != null;

  // "images" field.
  List<String>? _images;
  List<String> get images => _images ?? const [];
  set images(List<String>? val) => _images = val;

  void updateImages(Function(List<String>) updateFn) {
    updateFn(_images ??= []);
  }

  bool hasImages() => _images != null;

  // "offers" field.
  List<String>? _offers;
  List<String> get offers => _offers ?? const [];
  set offers(List<String>? val) => _offers = val;

  void updateOffers(Function(List<String>) updateFn) {
    updateFn(_offers ??= []);
  }

  bool hasOffers() => _offers != null;

  static ProductInfoStruct fromMap(Map<String, dynamic> data) =>
      ProductInfoStruct(
        ean: data['ean'] as String?,
        title: data['title'] as String?,
        description: data['description'] as String?,
        elid: data['elid'] as String?,
        brand: data['brand'] as String?,
        model: data['model'] as String?,
        color: data['color'] as String?,
        size: data['size'] as String?,
        dimension: data['dimension'] as String?,
        weight: data['weight'] as String?,
        category: data['category'] as String?,
        lowestRecordedPrice: castToType<double>(data['lowest_recorded_price']),
        highestRecordedPrice:
            castToType<double>(data['highest_recorded_price']),
        images: getDataList(data['images']),
        offers: getDataList(data['offers']),
      );

  static ProductInfoStruct? maybeFromMap(dynamic data) => data is Map
      ? ProductInfoStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'ean': _ean,
        'title': _title,
        'description': _description,
        'elid': _elid,
        'brand': _brand,
        'model': _model,
        'color': _color,
        'size': _size,
        'dimension': _dimension,
        'weight': _weight,
        'category': _category,
        'lowest_recorded_price': _lowestRecordedPrice,
        'highest_recorded_price': _highestRecordedPrice,
        'images': _images,
        'offers': _offers,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'ean': serializeParam(
          _ean,
          ParamType.String,
        ),
        'title': serializeParam(
          _title,
          ParamType.String,
        ),
        'description': serializeParam(
          _description,
          ParamType.String,
        ),
        'elid': serializeParam(
          _elid,
          ParamType.String,
        ),
        'brand': serializeParam(
          _brand,
          ParamType.String,
        ),
        'model': serializeParam(
          _model,
          ParamType.String,
        ),
        'color': serializeParam(
          _color,
          ParamType.String,
        ),
        'size': serializeParam(
          _size,
          ParamType.String,
        ),
        'dimension': serializeParam(
          _dimension,
          ParamType.String,
        ),
        'weight': serializeParam(
          _weight,
          ParamType.String,
        ),
        'category': serializeParam(
          _category,
          ParamType.String,
        ),
        'lowest_recorded_price': serializeParam(
          _lowestRecordedPrice,
          ParamType.double,
        ),
        'highest_recorded_price': serializeParam(
          _highestRecordedPrice,
          ParamType.double,
        ),
        'images': serializeParam(
          _images,
          ParamType.String,
          isList: true,
        ),
        'offers': serializeParam(
          _offers,
          ParamType.String,
          isList: true,
        ),
      }.withoutNulls;

  static ProductInfoStruct fromSerializableMap(Map<String, dynamic> data) =>
      ProductInfoStruct(
        ean: deserializeParam(
          data['ean'],
          ParamType.String,
          false,
        ),
        title: deserializeParam(
          data['title'],
          ParamType.String,
          false,
        ),
        description: deserializeParam(
          data['description'],
          ParamType.String,
          false,
        ),
        elid: deserializeParam(
          data['elid'],
          ParamType.String,
          false,
        ),
        brand: deserializeParam(
          data['brand'],
          ParamType.String,
          false,
        ),
        model: deserializeParam(
          data['model'],
          ParamType.String,
          false,
        ),
        color: deserializeParam(
          data['color'],
          ParamType.String,
          false,
        ),
        size: deserializeParam(
          data['size'],
          ParamType.String,
          false,
        ),
        dimension: deserializeParam(
          data['dimension'],
          ParamType.String,
          false,
        ),
        weight: deserializeParam(
          data['weight'],
          ParamType.String,
          false,
        ),
        category: deserializeParam(
          data['category'],
          ParamType.String,
          false,
        ),
        lowestRecordedPrice: deserializeParam(
          data['lowest_recorded_price'],
          ParamType.double,
          false,
        ),
        highestRecordedPrice: deserializeParam(
          data['highest_recorded_price'],
          ParamType.double,
          false,
        ),
        images: deserializeParam<String>(
          data['images'],
          ParamType.String,
          true,
        ),
        offers: deserializeParam<String>(
          data['offers'],
          ParamType.String,
          true,
        ),
      );

  @override
  String toString() => 'ProductInfoStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is ProductInfoStruct &&
        ean == other.ean &&
        title == other.title &&
        description == other.description &&
        elid == other.elid &&
        brand == other.brand &&
        model == other.model &&
        color == other.color &&
        size == other.size &&
        dimension == other.dimension &&
        weight == other.weight &&
        category == other.category &&
        lowestRecordedPrice == other.lowestRecordedPrice &&
        highestRecordedPrice == other.highestRecordedPrice &&
        listEquality.equals(images, other.images) &&
        listEquality.equals(offers, other.offers);
  }

  @override
  int get hashCode => const ListEquality().hash([
        ean,
        title,
        description,
        elid,
        brand,
        model,
        color,
        size,
        dimension,
        weight,
        category,
        lowestRecordedPrice,
        highestRecordedPrice,
        images,
        offers
      ]);
}

ProductInfoStruct createProductInfoStruct({
  String? ean,
  String? title,
  String? description,
  String? elid,
  String? brand,
  String? model,
  String? color,
  String? size,
  String? dimension,
  String? weight,
  String? category,
  double? lowestRecordedPrice,
  double? highestRecordedPrice,
}) =>
    ProductInfoStruct(
      ean: ean,
      title: title,
      description: description,
      elid: elid,
      brand: brand,
      model: model,
      color: color,
      size: size,
      dimension: dimension,
      weight: weight,
      category: category,
      lowestRecordedPrice: lowestRecordedPrice,
      highestRecordedPrice: highestRecordedPrice,
    );
