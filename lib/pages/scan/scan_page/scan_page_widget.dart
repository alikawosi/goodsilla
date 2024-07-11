import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
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
                        ScanMode.BARCODE,
                      );

                      _model.barcode = _model.scannedProductBarcode;
                      setState(() {});
                      _model.productQuery = await ProductsTable().queryRows(
                        queryFn: (q) => q.eq(
                          'barcode',
                          _model.scannedProductBarcode,
                        ),
                      );
                      if (_model.productQuery != null &&
                          (_model.productQuery)!.isNotEmpty) {
                        await showDialog(
                          context: context,
                          builder: (alertDialogContext) {
                            return AlertDialog(
                              title: Text('Yeaahhh!'),
                              content: Text('Product is available in Db!'),
                              actions: [
                                TextButton(
                                  onPressed: () =>
                                      Navigator.pop(alertDialogContext),
                                  child: Text('Ok'),
                                ),
                              ],
                            );
                          },
                        );
                        _model.existedProductDetailsInfo =
                            await ProductDetailFinderCall.call(
                          productTitle: _model.productQuery?.first?.title,
                        );

                        _model.gptObjectResponseExistedProduct =
                            await actions.stringToJSON(
                          getJsonField(
                            (_model.existedProductDetailsInfo?.jsonBody ?? ''),
                            r'''$.message''',
                          ).toString(),
                        );
                        await showDialog(
                          context: context,
                          builder: (alertDialogContext) {
                            return AlertDialog(
                              title: Text('Yesss!'),
                              content: Text(getJsonField(
                                (_model.existedProductDetailsInfo?.jsonBody ??
                                    ''),
                                r'''$.message.pros''',
                              ).toString()),
                              actions: [
                                TextButton(
                                  onPressed: () =>
                                      Navigator.pop(alertDialogContext),
                                  child: Text('Ok'),
                                ),
                              ],
                            );
                          },
                        );

                        context.pushNamed('ProductSummary');
                      } else {
                        _model.productFinder =
                            await ProductFinderByBarcodeCall.call(
                          productBarcode: _model.scannedProductBarcode,
                        );

                        if (getJsonField(
                              (_model.productFinder?.jsonBody ?? ''),
                              r'''$.items[0].title''',
                            ) !=
                            null) {
                          _model.brandsQuery = await BrandsTable().queryRows(
                            queryFn: (q) => q.eq(
                              'title',
                              getJsonField(
                                (_model.productFinder?.jsonBody ?? ''),
                                r'''$.items[0].brand''',
                              ).toString(),
                            ),
                          );
                          if (!(_model.brandsQuery != null &&
                              (_model.brandsQuery)!.isNotEmpty)) {
                            _model.productBrand = await BrandsTable().insert({
                              'title': getJsonField(
                                (_model.productFinder?.jsonBody ?? ''),
                                r'''$.items[0].brand''',
                              ).toString(),
                            });
                          }
                          _model.insertedProductInfo =
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
                            'brandRef': _model.brandsQuery != null &&
                                    (_model.brandsQuery)!.isNotEmpty
                                ? _model.brandsQuery?.first?.id
                                : _model.productBrand?.id,
                          });
                          _model.productDetailsInfo =
                              await ProductDetailFinderCall.call(
                            productTitle: _model.insertedProductInfo?.title,
                          );

                          _model.gptObjectResponse = await actions.stringToJSON(
                            getJsonField(
                              (_model.productDetailsInfo?.jsonBody ?? ''),
                              r'''$.message''',
                            ).toString(),
                          );
                          await ProductsTable().update(
                            data: {
                              'pros': (getJsonField(
                                _model.gptObjectResponse,
                                r'''$.pros''',
                                true,
                              ) as List)
                                  .map<String>((s) => s.toString())
                                  .toList(),
                              'cons': (getJsonField(
                                _model.gptObjectResponse,
                                r'''$.cons''',
                                true,
                              ) as List)
                                  .map<String>((s) => s.toString())
                                  .toList(),
                              'featureList': (getJsonField(
                                _model.gptObjectResponse,
                                r'''$.featureList''',
                                true,
                              ) as List)
                                  .map<String>((s) => s.toString())
                                  .toList(),
                            },
                            matchingRows: (rows) => rows.eq(
                              'id',
                              _model.insertedProductInfo?.id,
                            ),
                          );
                          await showDialog(
                            context: context,
                            builder: (alertDialogContext) {
                              return AlertDialog(
                                title: Text('Yesss!'),
                                content: Text(
                                    'Product Added to db!!/n${ProductFinderByBarcodeCall.productTitle(
                                  (_model.productFinder?.jsonBody ?? ''),
                                )}'),
                                actions: [
                                  TextButton(
                                    onPressed: () =>
                                        Navigator.pop(alertDialogContext),
                                    child: Text('Ok'),
                                  ),
                                ],
                              );
                            },
                          );

                          context.pushNamed('ProductSummary');
                        } else {
                          await showDialog(
                            context: context,
                            builder: (alertDialogContext) {
                              return AlertDialog(
                                title: Text('Ooopss!!'),
                                content: Text(getJsonField(
                                  (_model.productFinder?.jsonBody ?? ''),
                                  r'''$.code''',
                                ).toString()),
                                actions: [
                                  TextButton(
                                    onPressed: () =>
                                        Navigator.pop(alertDialogContext),
                                    child: Text('Try something new!'),
                                  ),
                                ],
                              );
                            },
                          );
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
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 20.0, 0.0, 0.0),
                          child: Text(
                            valueOrDefault<String>(
                              _model.barcode,
                              'nothing',
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .bodyMediumFamily,
                                  fontSize: 16.0,
                                  letterSpacing: 0.0,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .bodyMediumFamily),
                                ),
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
