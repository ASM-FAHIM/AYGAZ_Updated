import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:aygazhcm/sales/constant/colors.dart';
import 'package:aygazhcm/sales/widget/big_text.dart';

class AroundMeScreen extends StatefulWidget {
  const AroundMeScreen({Key? key}) : super(key: key);

  @override
  State<AroundMeScreen> createState() => AroundMeScreenState();
}

class AroundMeScreenState extends State<AroundMeScreen> {
  final Completer<GoogleMapController> _controller = Completer();

  static const LatLng vataraThana = LatLng(23.797462, 90.424059);
  static const LatLng labAidHospital = LatLng(23.794072, 90.412832);
  static const LatLng unitedHospital = LatLng(23.804821, 90.415609);
  static const LatLng bracBank = LatLng(23.796742, 90.413697);
  static const LatLng jamunaAmusementPark = LatLng(23.813037, 90.422067);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColor.appBarColor,
          title: BigText(text: "Around Me", color: AppColor.defWhite, size: 25,),
        ),
        body: GoogleMap(
          initialCameraPosition: const CameraPosition(
              target: vataraThana,
            zoom: 14,
          ),
          markers: {
            Marker(
                markerId: MarkerId("Lab-Aid-Hospital"),
              position: vataraThana,
              infoWindow: InfoWindow(title: 'Monyeem is here'),
              icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueCyan),
            ),
            Marker(
              markerId: MarkerId("Destination"),
              position: labAidHospital,
              infoWindow: InfoWindow(title: 'Niloy is here'),
              icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
            ),
            Marker(
                markerId: MarkerId("United-Hospital"),
              position: unitedHospital,
              infoWindow: InfoWindow(title: 'Raad is here'),
              icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure),
            ),
            Marker(
              markerId: MarkerId("Brac-Bank"),
              position: bracBank,
              infoWindow: InfoWindow(title: 'Sina is here'),
              icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
            ),
          },
        )
    );
  }
}