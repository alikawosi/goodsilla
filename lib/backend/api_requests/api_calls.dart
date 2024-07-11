import 'dart:convert';
import 'dart:typed_data';
import '../schema/structs/index.dart';

import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class ProductDetailFinderCall {
  static Future<ApiCallResponse> call({
    String? productTitle = '',
  }) async {
    final ffApiRequestBody = '''
{
  "productTitle": "${productTitle}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'productDetailFinder',
      apiUrl: 'https://spa3he.buildship.run/productDetailFinder',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ProductFinderByBarcodeCall {
  static Future<ApiCallResponse> call({
    String? productBarcode = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'ProductFinderByBarcode',
      apiUrl: 'https://api.upcitemdb.com/prod/trial/lookup',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'upc': productBarcode,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? prodcuctCode(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.items[0].ean''',
      ));
  static String? productTitle(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.items[0].title''',
      ));
  static List? productInfo(dynamic response) => getJsonField(
        response,
        r'''$.items[0]''',
        true,
      ) as List?;
  static String? productBrand(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.items[0].brand''',
      ));
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _toEncodable(dynamic item) {
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}
