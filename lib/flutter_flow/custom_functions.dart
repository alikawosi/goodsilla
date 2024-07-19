import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/auth/supabase_auth/auth_util.dart';

List<String> productPronsFinder(String inputString) {
  dynamic productDetails = json.decode(inputString);

  if (productDetails is Map && productDetails.containsKey('ProductProns')) {
    return List<String>.from(productDetails['ProductProns']);
  } else {
    return [];
  }
}

List<String> productConsFinder(String inputString) {
  dynamic productDetails = json.decode(inputString);

  if (productDetails is Map && productDetails.containsKey('ProductCons')) {
    return List<String>.from(productDetails['ProductCons']);
  } else {
    return [];
  }
}

List<String> productFeatureListFinder(String inputString) {
  dynamic productDetails = json.decode(inputString);

  if (productDetails is Map &&
      productDetails.containsKey('ProductFeatureList')) {
    return List<String>.from(productDetails['ProductFeatureList']);
  } else {
    return [];
  }
}
