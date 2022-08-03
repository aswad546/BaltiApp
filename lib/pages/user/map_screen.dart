import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

import '../../providers/location_provider.dart';
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
    bool submitActive = true;
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
              height: 550,
              child: Stack(
                children: [
                  GoogleMap(
                    initialCameraPosition: CameraPosition(
                      target: LatLng(lat, lng),
                      zoom: 20,
                    ),
                    onCameraMove: (CameraPosition position) {
                      submitActive = false;
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
                      submitActive = true;
                    },
                    mapType: MapType.normal,
                    mapToolbarEnabled: false,
                    myLocationEnabled: true,
                    zoomGesturesEnabled: true,
                    zoomControlsEnabled: false,
                  ),
                  Center(
                    child: Container(
                      height: 200,
                      margin: const EdgeInsets.only(bottom: 80),
                      child: Image.asset("assets/images/map_pin_alt.png",
                          height: 70, width: 70),
                    ),
                  ),
                  Positioned(
                    top: 20,
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
              height: 150,
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
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
                              ? location.currentAddress
                              : location.currentPickedAddress,
                          style: const TextStyle(
                            fontSize: 23,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      );
                    }),
                    CustomIconButton(
                      color: submitActive == true
                          ? const Color.fromARGB(193, 27, 209, 161)
                          : Colors.grey.withOpacity(0.5),
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
