import 'dart:async';
import 'dart:ui' as ui;
import 'package:base_flutter/core/generic_cubit/generic_cubit.dart';
import 'package:base_flutter/core/helpers/snack_helper.dart';
import 'package:base_flutter/core/resource/assets_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_api_headers/google_api_headers.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_webservice/places.dart';

import '../../../core/localization/app_localizations.dart';
import '../../../core/localization/lang_cubit/lang_cubit.dart';
import '../../../core/utils/utils_imports.dart';
import 'location_cubit/location_cubit.dart';
import 'location_model/location_model.dart';
import 'widgets/LocationWidgetsImports.dart';


part 'LocationAddress.dart';

part 'LocationAddressData.dart';
