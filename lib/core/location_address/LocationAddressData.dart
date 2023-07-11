part of 'LocationAddressImports.dart';

class LocationAddressData {
  final GlobalKey<ScaffoldState> scaffold = new GlobalKey<ScaffoldState>();
  late Completer<GoogleMapController> controller = Completer();
  late LocationModel locationModel;
  final GenericCubit<bool> mapType = GenericCubit(false);
  final GenericCubit<bool> showMainMarker = GenericCubit(true);
  final GenericCubit<LocationModel?> locationModelBloc = GenericCubit(null);
  final LocationCubit locationCubit = new LocationCubit();
  final GenericCubit<Set<Marker>> addMarkerCubit = new GenericCubit({});
  late GoogleMapController googleMapController;
  final Mode _mode = Mode.overlay;
  static const kGoogleApiKey = 'AIzaSyAUmn1DI_PvYJ_3Bo-2ZRn2iwT_tNlzxC8';
  GoogleMapsPlaces places = GoogleMapsPlaces(apiKey: kGoogleApiKey);

  void getLocationAddress(BuildContext context) async {
    LatLng loc = LatLng(locationModel.lat, locationModel.lng);
    String address = await Utils.getAddress(loc, context);
    locationModel.address = address;
    context.read<LocationCubit>().onLocationUpdated(locationModel);
  }

  ///used  to get init location

  Future<Uint8List> getBytesFromAsset(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(
      data.buffer.asUint8List(),
    );
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!
        .buffer
        .asUint8List();
  }

  /// method user to change and customize the shape of marker

  void saveChangedLocation(BuildContext context) async {
    if (locationModel.address.isEmpty) {
      // CustomToast.showToastNotification(tr(context, "selectLocationOnMap"));
      return;
    }
    context
        .read<LocationCubit>()
        .onLocationUpdated(locationModel, change: true);
    Navigator.pop(context);
  }

  /// method used to save locationModel after fill it with location values(lat,lng,address).

  Future<void> getMyLocationByButtonPressed() async {
    Position? position = await Utils.getCurrentLocation();
    locationCubit.onLocationUpdated(LocationModel(
      lat: position?.latitude ?? 24.774265,
      lng: position?.longitude ?? 46.738586,
      address: "",
    ));
    googleMapController.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(
            target: LatLng(position?.latitude.toDouble() ?? 0.0,
                position?.longitude.toDouble() ?? 0.0),
            zoom: 16,
            tilt: 45,
            bearing: 30.0)));
    addMarkerCubit.state.data.clear();
  }

  /// custom button used t get my current location.

  addMarker(BuildContext context, LatLng latLng) async {
    Uint8List markerImg = await getBytesFromAsset(AssetsManager.location, 5);
     await Utils.getAddress(latLng, context);
    addMarkerCubit.state.data.clear();
    addMarkerCubit.state.data.add(Marker(
      markerId: const MarkerId("0"),
      icon: BitmapDescriptor.fromBytes(markerImg),
      position: latLng,
      onTap: () {},
      // infoWindow: InfoWindow(title: address,)
    ));
    addMarkerCubit.onUpdateData(addMarkerCubit.state.data);
    showMainMarker.onUpdateData(false);
    showModalBottomSheet(
      context: context,
      builder: (_) => MarkerDetailsButtonSheet(
        address: 'address',
        title: "${latLng.latitude},${latLng.longitude}",
      ),
      isDismissible: true,
      backgroundColor: Colors.transparent,
      barrierColor: Colors.transparent,
    );
  }

//******************** map by search ***************************

  Future<void> onSearchPressed(BuildContext context) async {
    var lang = context.read<LangCubit>().state.locale.languageCode;
    Prediction? p = await PlacesAutocomplete.show(
        context: context,
        apiKey: kGoogleApiKey,
        onError: onSearchError,
        mode: _mode,
        language: lang == "ar" ? 'ar' : 'en',
        strictbounds: false,
        types: [""],
        decoration: InputDecoration(
            hintText: '${tr(context,"search")}',
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(color: Colors.white))),
        components: [
          Component(Component.country, "eg"),
          Component(Component.country, "usa"),
          Component(Component.country, "sa"),
        ]);
    displaySearchPrediction(p!);
  }

  /// used when search get pressed.

  void onSearchError(PlacesAutocompleteResponse response) {
    // ScaffoldMessenger.of(ctx).showSnackBar(SnackBar(content: Text(response.errorMessage!)));
    SnackBarHelper.showBasicSnack(msg: response.errorMessage ?? '');
  }

  Future<void> displaySearchPrediction(Prediction p) async {
    GoogleMapsPlaces places = GoogleMapsPlaces(
        apiKey: kGoogleApiKey,
        apiHeaders: await const GoogleApiHeaders().getHeaders());
    PlacesDetailsResponse detail = await places.getDetailsByPlaceId(p.placeId!);
    final lat = detail.result.geometry!.location.lat;
    final lng = detail.result.geometry!.location.lng;

    ///***************
    // searchMarkerCubit.state.data.clear();
    // searchMarkerCubit.state.data.add(Marker(
    //     markerId: const MarkerId("0"),
    //     position: LatLng(lat, lng),
    //     infoWindow: InfoWindow(title: detail.result.name)));
    // searchMarkerCubit.onUpdateData(searchMarkerCubit.state.data);
    ///to display custom marker for search uncomment the text
    googleMapController
        .animateCamera(CameraUpdate.newLatLngZoom(LatLng(lat, lng), 16.4746));
  }

  /// used to fetch & display the search results from Google_Api_Services .
}

// final apiKey = "AIzaSyDIBH6mfPQ13UnF9aZtmaUQtuu-mQcxxb0";
// static const apiKey = "AIzaSyDIBH6mfPQ13UnF9aZtmaUQtuu-mQcxxb0";
// static const apiKey = "AIzaSyAUmn1DI_PvYJ_3Bo-2ZRn2iwT_tNlzxC8";
