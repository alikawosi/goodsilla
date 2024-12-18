import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'scan_page_widget.dart' show ScanPageWidget;
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ScanPageModel extends FlutterFlowModel<ScanPageWidget> {
  ///  Local state fields for this page.

  String? barcode;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  var scannedProductBarcode = '';
  // Stores action output result for [Backend Call - Query Rows] action in Column widget.
  List<ProductsRow>? productQuery;
  // Stores action output result for [Backend Call - API (productDetailFinder)] action in Column widget.
  ApiCallResponse? existedProductDetailsInfo;
  // Stores action output result for [Backend Call - API (ProductFinderByBarcode)] action in Column widget.
  ApiCallResponse? productFinder;
  // Stores action output result for [Backend Call - Query Rows] action in Column widget.
  List<BrandsRow>? brandsQuery;
  // Stores action output result for [Backend Call - Insert Row] action in Column widget.
  BrandsRow? productBrand;
  // Stores action output result for [Backend Call - Insert Row] action in Column widget.
  ProductsRow? insertedProductInfo;
  // Stores action output result for [Backend Call - API (productDetailFinder)] action in Column widget.
  ApiCallResponse? productDetailsInfo;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
