part of 'LocationWidgetsImports.dart';

class BuildMainMarker extends StatelessWidget {
  const BuildMainMarker({
    Key? key,
    required this.locationAddressData,
  }) : super(key: key);

  final LocationAddressData locationAddressData;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GenericCubit<bool>, GenericState<bool>>(
      bloc: locationAddressData.showMainMarker,
      builder: (context, state) {
        return Visibility(
          visible: state.data,
          child: SvgPicture.asset(AssetsManager.location, height: 25),
        );
      },
    );
  }
}