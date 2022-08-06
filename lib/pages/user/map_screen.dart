import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

import '../../providers/location_provider.dart';
import '../../utils/size_config.dart';
import '../../widgets/custom_icon_button.dart';

class MapScreen extends StatefulWidget {
  static const routeName = 'home/map';

  const MapScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double lat = (ModalRoute.of(context)?.settings.arguments
        as Map<String, double>)["latitude"]!;
    double lng = (ModalRoute.of(context)?.settings.arguments
        as Map<String, double>)["longitude"]!;
    String address = "";
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: SizeConfig.screenHeight / 1.32,
              child: Stack(
                children: [
                  GoogleMap(
                    initialCameraPosition: CameraPosition(
                      target: LatLng(lat, lng),
                      zoom: 20,
                    ),
                    onCameraMove: (CameraPosition position) {
                      lat = position.target.latitude;
                      lng = position.target.longitude;
                    },
                    onCameraIdle: () async {
                      await Provider.of<Location>(context, listen: false)
                          .setPickedLocation(lat, lng);
                      if (mounted) {
                        address = Provider.of<Location>(context, listen: false)
                            .currentPickedAddress;
                      }
                    },
                    mapType: MapType.normal,
                    mapToolbarEnabled: false,
                    myLocationEnabled: true,
                    zoomGesturesEnabled: true,
                    zoomControlsEnabled: false,
                  ),
                  Center(
                    child: Container(
                      height: SizeConfig.screenHeight / 3.625,
                      margin: const EdgeInsets.only(bottom: 80),
                      child: Image.asset("assets/images/map_pin_alt.png",
                          height: SizeConfig.screenWidth / 5.143,
                          width: SizeConfig.screenWidth / 5.143),
                    ),
                  ),
                  Positioned(
                    top: SizeConfig.screenHeight / 36.25,
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: SizeConfig.screenHeight / 4.8333,
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: Padding(
                padding: EdgeInsets.all(SizeConfig.screenWidth / 18),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Consumer<Location>(builder: (
                      context,
                      location,
                      child,
                    ) {
                      return FittedBox(
                        fit: BoxFit.contain,
                        child: Text(
                          address == ""
                              ? location.currentAddress == ""
                                  ? "No address for current Location"
                                  : location.currentAddress
                              : location.currentPickedAddress,
                          style: const TextStyle(
                            fontSize: 23,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      );
                    }),
                    CustomIconButton(
                      color: const Color.fromARGB(193, 27, 209, 161),
                      icon: Icons.navigate_next_outlined,
                      buttonLabel: "Confirm",
                      onPressHandler: () async {
                        await Provider.of<Location>(context, listen: false)
                            .overwriteLocation(lat, lng);
                        if (mounted) Navigator.of(context).pop();
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
