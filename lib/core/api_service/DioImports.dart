import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:base_flutter/core/helpers/snack_helper.dart';
import 'package:base_flutter/features/presentation/auth/screens/login/login_view.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tf_dio_cache/tf_dio_cache.dart';

import '../helpers/preferences_helper.dart';
import '../localization/lang_cubit/lang_cubit.dart';
import '../resource/navigation_service.dart';

part 'DioHelper.dart';


