import 'dart:async';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
import 'package:aygazhcm/sales/module/view/dashboard_screen.dart';
import '../model/login_model.dart';
import '../model/tsolist_model.dart';

class LoginController extends GetxController {
  RxBool isLoading1 = false.obs;
  Box? box1;
  RxString zauserid = ''.obs;
  RxString xidsup = ''.obs;
  RxString xpreparer = ''.obs;

  LoginModel? data;
  Future<void> loginMethod(String tsoId) async {
    isLoading1(true);
    var response = await http.get(Uri.parse('http://172.20.20.69/salesforce/tsoInfo.php?user=$tsoId'));
    if (response.statusCode == 404) {
      isLoading1(false);
      Get.snackbar(
          'Error',
          'Wrong username or password',
          backgroundColor: Colors.red,
          duration: const Duration(seconds: 1)
      );
    } else if (response.statusCode == 200) {
      data = loginModelFromJson(response.body);
      print('Tso information : ${response.body}');
      isLoading1(false);
      Get.to(() => DashboardScreen());
    }
  }
  
  // tsoList_fetch in loginScreen
  RxBool isFetched = false.obs;
  List<TsoListModel?>? tsoListModel;
  Future<void> fetchTsoList() async{
    try{
      isFetched(true);
      var responseTsoList = await http.get(Uri.parse('http://172.20.20.69/salesforce/tso_ID.php?staff=EID-02688'));
      if(responseTsoList.statusCode == 200){
        tsoListModel = tsoListModelFromJson(responseTsoList.body);
        print(tsoListModel);
        isFetched(false);
      }else{
        print('Error occurred: ${responseTsoList.statusCode}');
        isFetched(false);
      }
    }catch(error){
      print('There is an error occurred: $error');
      isFetched(false);
    }
  }

  //For obscure text
  var obscureText = true.obs;
  void toggle() {
    obscureText.value = !obscureText.value;
  }

  RxDouble curntLong = 0.0.obs;
  RxDouble curntLat = 0.0.obs;
  double? distance;
  Position? position;
  Future<void> periodicallyLocationTracking() async{
    await getGeoLocationPosition();
    await getAddressFromLatLong();
  }

  Future<Position> getGeoLocationPosition() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      await Geolocator.openLocationSettings();
      return Future.error('Location services are disabled.');
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    curntLat.value = position!.latitude;
    curntLong.value = position!.longitude;
    print('Actual position is : $position');
    print('Actual Current Latitude is : ${curntLat.value}');
    print('Actual Current Longitude is : ${curntLong.value}');
    return position!;
  }

  RxString addressInOut = ''.obs;
  Future<void> getAddressFromLatLong() async {
    List<Placemark> placeMarks =
    await placemarkFromCoordinates(position!.latitude, position!.longitude);
/*    curntLat.value = position!.latitude;
    curntLong.value = position!.longitude;*/
    Placemark place = placeMarks[1];
    addressInOut.value = '${place.name}, ${place.locality}, ${place.country}';
    print('My exact location is : $addressInOut');
  }
}