part of 'utils_imports.dart';

class Utils {
  static Future<void> manipulateSplashData(BuildContext context) async {
    getCurrentLocation();
    var strUser = Preferences.getString("user");
    if (strUser != null) {
      UserModel data = UserModel.fromJson(json.decode("$strUser"));
      Preferences.setString("token", data.token ?? "");
      changeLanguage(
          context.read<LangCubit>().state.locale.languageCode, context);
      setCurrentUserData(data);
    } else {
      changeLanguage("ar", context);
      NavigationService.removeUntil(SelectLangView());
      // AutoRouter.of(context).push(SelectUserRoute());
    }
  }

  static Future<bool> manipulateLoginData(dynamic data, String token) async {
    if (data != null) {
      log("token : $token");
      await Utils.setDeviceId("$token");
      UserModel user = UserModel.fromJson(data);
      Preferences.setString("token", token);
      await Utils.saveUserData(user);
      Utils.setCurrentUserData(user);
      return true;
    }
    return false;
  }

  static void setCurrentUserData(UserModel model) async {
    navigatorKey.currentContext!.read<AuthCubit>().onUpdateAuth(true);
    navigatorKey.currentContext?.read<UserCubit>().onUpdateUserData(model);
    NavigationService.removeUntil(
      BlocProvider(
        create: (context) => BottomNavCubit(),
        child: MainNavigationBar(),
      ),
    );
  }

  static Future<void> saveUserData(UserModel model) async {
    Preferences.setString("user", json.encode(model.toJson()));
  }

  static void changeLanguage(String lang, BuildContext context) {
    context.read<LangCubit>().changeLanguage(lang);
  }

  // static UserModel getSavedUser({required BuildContext context}) {
  //   return context.read<UserCubit>().state.model;
  // }

  static Future<String?> getDeviceId() async {
    return Preferences.getString("deviceId");
  }

  static Future<void> setDeviceId(String token) async {
    Preferences.setString("deviceId", token);
  }

  static void clearSavedData() async {
    Preferences.clearAll();
    navigatorKey.currentContext!.read<AuthCubit>().onUpdateAuth(false);
  }

  static String getCurrentUserId({required BuildContext context}) {
    // var provider = context.watch<UserCubit>().state.model;
    return '';
  }

  static void launchURL({required String url}) async {
    if (!url.toString().startsWith("https")) {
      url = "https://" + url;
    }
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      SnackBarHelper.showBasicSnack(msg: "من فضلك تآكد من الرابط");
    }
  }

  static void launchWhatsApp(phone) async {
    String message = 'مرحبا بك';
    if (phone.startsWith("00966")) {
      phone = phone.substring(5);
    }
    var _whatsAppUrl = "whatsapp://send?phone=+966$phone&text=$message";
    print(_whatsAppUrl);
    if (await canLaunch(_whatsAppUrl)) {
      await launch(_whatsAppUrl);
    } else {
      throw 'حدث خطأ ما';
    }
  }

  static void launchYoutube({required String url}) async {
    if (Platform.isIOS) {
      if (await canLaunch('$url')) {
        await launch('$url', forceSafariVC: false);
      } else {
        if (await canLaunch('$url')) {
          await launch('$url');
        } else {
          throw 'Could not launch $url';
        }
      }
    } else {
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        throw 'Could not launch $url';
      }
    }
  }

  static void callPhone({phone}) async {
    await launch("tel:$phone");
  }

  static void sendMail(mail) async {
    await launch("mailto:$mail");
  }

  static void shareApp(url) {
    AppLoaderHelper.showLoadingDialog();
    Share.share(url).whenComplete(() {
      EasyLoading.dismiss();
    });
  }

  static Future<File?> getImage() async {
    final ImagePicker _picker = ImagePicker();
    XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      File imageFile = File(image.path);
      return imageFile;
    }
    return null;
  }

  static Future<List<File>> getImages() async {
    final ImagePicker _picker = ImagePicker();
    final List<XFile>? result = await _picker.pickMultiImage();
    if (result != null) {
      List<File> files = result.map((e) => File(e.path)).toList();
      return files;
    } else {
      return [];
    }
  }

  static Future<File?> getVideo() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? video = await _picker.pickVideo(source: ImageSource.gallery);
    if (video != null) {
      File imageFile = File(video.path);
      return imageFile;
    }
    return null;
  }

  static void copToClipboard(
      {required String text, required GlobalKey<ScaffoldState> scaffold}) {
    if (text.trim().isEmpty) {
      SnackBarHelper.showBasicSnack(msg: "لا يوجد بيانات للنسخ");
      return;
    } else {
      Clipboard.setData(ClipboardData(text: "$text")).then((value) {
        SnackBarHelper.showBasicSnack(msg: "تم النسخ بنجاح");
      });
    }
  }

  static Future<Position?> getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;
    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      SnackBarHelper.showBasicSnack(msg: 'Location services are disabled');
      return null;
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        SnackBarHelper.showBasicSnack(msg: 'Location permissions are denied');
        return null;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      SnackBarHelper.showBasicSnack(
          msg:
              'Location permissions are permanently denied, we cannot request permissions');
      return null;
    }

    return await Geolocator.getCurrentPosition();
  }

  static void navigateToMapWithDirection(
      {required String lat,
      required String lng,
      required BuildContext context}) async {
    if (lat == "0") return;
    try {
      final coords = Coords(double.parse(lat), double.parse(lng));
      final title = "Destination";
      final availableMaps = await MapLauncher.installedMaps;

      showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return SafeArea(
            child: SingleChildScrollView(
              child: Container(
                child: Wrap(
                  children: <Widget>[
                    for (var map in availableMaps)
                      ListTile(
                        onTap: () => map.showMarker(
                          coords: coords,
                          title: title,
                        ),
                        title: Text(map.mapName),
                        leading: SvgPicture.asset(
                          map.icon,
                          height: 30.0,
                          width: 30.0,
                        ),
                      ),
                  ],
                ),
              ),
            ),
          );
        },
      );
    } catch (e) {
      SnackBarHelper.showBasicSnack(msg: "$e");
    }
  }

  static Future<String> getAddress(LatLng latLng, BuildContext context) async {
    try {
      List<Placemark> placeMarks =
          await placemarkFromCoordinates(latLng.latitude, latLng.longitude);

      var data =
          "${placeMarks[0].country ?? ""}  ${placeMarks[0].administrativeArea ?? ""}  ${placeMarks[0].subAdministrativeArea ?? ""} ${placeMarks[0].street ?? ""}";
      return data;
    } catch (e) {
      log('Error');
      return "Error";
    }
  }

  static String convertDigitsToLatin(String s) {
    var sb = new StringBuffer();
    for (int i = 0; i < s.length; i++) {
      switch (s[i]) {
        //Arabic digits
        case '\u0660':
          sb.write('0');
          break;
        case '\u0661':
          sb.write('1');
          break;
        case '\u0662':
          sb.write('2');
          break;
        case '\u0663':
          sb.write('3');
          break;
        case '\u0664':
          sb.write('4');
          break;
        case '\u0665':
          sb.write('5');
          break;
        case '\u0666':
          sb.write('6');
          break;
        case '\u0667':
          sb.write('7');
          break;
        case '\u0668':
          sb.write('8');
          break;
        case '\u0669':
          sb.write('9');
          break;
        default:
          sb.write(s[i]);
          break;
      }
    }
    return sb.toString();
  }
}
