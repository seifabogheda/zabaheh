import 'dart:developer';
import 'dart:io';
import 'package:base_flutter/core/helpers/preferences_helper.dart';
import 'package:base_flutter/core/resource/navigation_service.dart';
import 'package:flutter_svg/svg.dart';

import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import '../../features/presentation/auth/screens/select_lang/select_lang_view.dart';
import '../helpers/snack_helper.dart';
import '../localization/lang_cubit/lang_cubit.dart';
import '../helpers/app_loader_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:map_launcher/map_launcher.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'utils.dart';

