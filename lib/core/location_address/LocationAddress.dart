part of 'LocationAddressImports.dart';

class LocationAddress extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LocationAddress();
}

class _LocationAddress extends State<LocationAddress> {
  final LocationAddressData locationAddressData = new LocationAddressData();
  @override
  void initState() {
    var loc = context.read<LocationCubit>().state.model;
    double lat = loc?.lat ?? 24.774265;
    double lng = loc?.lng ?? 46.738586;
    locationAddressData.locationModel = LocationModel(lat: lat, lng: lng);
    locationAddressData.getLocationAddress(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      key: locationAddressData.scaffold,
      // appBar: AppBar(
      //   leadingWidth: 0,
      //   titleSpacing: 0,
      //   title: BlocBuilder<LocationCubit, LocationState>(
      //     builder: (context, state) {
      //       return Padding(
      //         padding: const EdgeInsets.symmetric(horizontal: 20),
      //         child: Center(
      //           child: MyText(
      //             alien: TextAlign.center,
      //             title: "${tr(context, "currentLocation")}",
      //             size: 12,
      //             color: MyColors.black,
      //             fontWeight: FontWeight.bold,
      //           ),
      //         ),
      //       );
      //     },
      //   ),
      //   backgroundColor: MyColors.white,
      //   automaticallyImplyLeading: false,
      //   centerTitle: true,
      //   flexibleSpace: Padding(
      //     padding: EdgeInsets.symmetric(horizontal: 5),
      //   ),
      //   bottom: PreferredSize(
      //     preferredSize: Size.fromHeight(10),
      //     child: BlocBuilder<LocationCubit, LocationState>(
      //       builder: (context, state) {
      //         return Visibility(
      //           visible: state.model!.address == '',
      //           child: LinearProgressIndicator(color: MyColors.primary.withOpacity(.5)),
      //         );
      //       },
      //     ),
      //   ),
      // ),
      ///if u want to add appbar use it .
      body: SafeArea(
        child: BuildGoogleMapView(
          locationAddressData: locationAddressData,
        ),
      ),
      floatingActionButton: BuildSaveButton(
        locationAddressData: locationAddressData,
      ),
    );
  }
}

// class SearchPlacesScreen extends StatefulWidget {
//   const SearchPlacesScreen({Key? key}) : super(key: key);
//
//   @override
//   State<SearchPlacesScreen> createState() => _SearchPlacesScreenState();
// }
//
// class _SearchPlacesScreenState extends State<SearchPlacesScreen> {
//   final LocationAddressData locationAddressData = LocationAddressData();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       key: locationAddressData.homeScaffoldKey,
//       appBar: AppBar(
//         title: const Text("Google Search Places"),
//       ),
//       body: Stack(
//         children: [
//           BlocBuilder<GenericBloc<Set<Marker>>, GenericState<Set<Marker>>>(
//             bloc: locationAddressData.searchMarkerCubit,
//             builder: (context, state) {
//               return BlocBuilder<GenericBloc<bool>, GenericState<bool>>(
//                 bloc: locationAddressData.mapType,
//                 builder: (context, state) {
//                   return GoogleMap(
//                     mapType: state.data? MapType.satellite:MapType.normal,
//                     initialCameraPosition:
//                     LocationAddressData.initialCameraPosition,
//                     markers: locationAddressData.searchMarkerCubit.state.data,
//                     onMapCreated: (GoogleMapController controller) {
//                       locationAddressData.googleMapController = controller;
//                     },
//                   );
//                 },
//               );
//             },
//           ),
//           InkWell(
//             onTap: () {
//               locationAddressData.handlePressButton(context);
//             },
//             child: Container(
//               margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
//               padding: const EdgeInsets.all(5),
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 boxShadow: [
//                   BoxShadow(color: Colors.grey, blurRadius: 1, spreadRadius: 1)
//                 ],
//                 shape: BoxShape.circle,
//               ),
//               child: Icon(
//                 Icons.search,
//                 size: 25,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
