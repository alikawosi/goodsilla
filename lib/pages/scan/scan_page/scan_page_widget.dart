import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'scan_page_model.dart';
export 'scan_page_model.dart';

class ScanPageWidget extends StatefulWidget {
  const ScanPageWidget({super.key});

  @override
  State<ScanPageWidget> createState() => _ScanPageWidgetState();
}

class _ScanPageWidgetState extends State<ScanPageWidget> {
  late ScanPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ScanPageModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).customPink,
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 12.0),
                child: Container(
                  width: double.infinity,
                  height: 200.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).accent1,
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      _model.scannedProductBarcode =
                          await FlutterBarcodeScanner.scanBarcode(
                        '#C62828', // scanning line color
                        'Cancel', // cancel button text
                        true, // whether to show the flash icon
                        ScanMode.QR,
                      );

                      _model.productQuery = await ProductsTable().queryRows(
                        queryFn: (q) => q.eq(
                          'barcode',
                          _model.scannedProductBarcode,
                        ),
                      );
                      if (!(_model.productQuery != null &&
                          (_model.productQuery)!.isNotEmpty)) {
                        _model.productFinder =
                            await ProductFinderByBarcodeCall.call(
                          productBarcode: _model.scannedProductBarcode,
                        );

                        if ((_model.productFinder?.succeeded ?? true)) {
                          _model.productBrandInfo = await BrandsTable().insert({
                            'title': ProductFinderByBarcodeCall.productBrand(
                              (_model.productFinder?.jsonBody ?? ''),
                            ),
                          });
                          await ProductsTable().insert({
                            'title': ProductFinderByBarcodeCall.productTitle(
                              (_model.productFinder?.jsonBody ?? ''),
                            ),
                            'barcode': ProductFinderByBarcodeCall.prodcuctCode(
                              (_model.productFinder?.jsonBody ?? ''),
                            ),
                            'price': getJsonField(
                              (_model.productFinder?.jsonBody ?? ''),
                              r'''$.items[0].highest_recorded_price''',
                            ),
                            'brandRef': _model.productBrandInfo?.id,
                          });
                        }
                      }

                      setState(() {});
                    },
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 12.0),
                          child: Icon(
                            Icons.qr_code_scanner_rounded,
                            color: FlutterFlowTheme.of(context).primary,
                            size: 56.0,
                          ),
                        ),
                        Text(
                          'Please  Upload a Poduct Photo!',
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .bodyMediumFamily,
                                fontSize: 16.0,
                                letterSpacing: 0.0,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .bodyMediumFamily),
                              ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
