// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:geocoding/geocoding.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:get/get.dart';
// import 'package:hive/hive.dart';
// import 'package:http/http.dart' as http;
// import 'package:sales_app/module/view/dashboard_screen.dart';
// import '../model/login_model.dart';
//
// class LoginController extends GetxController {
//   RxBool isLoading1 = false.obs;
//   Box? box1;
//   TextEditingController user = TextEditingController();
//   TextEditingController pass = TextEditingController();
//
//   LoginModel? data;
//   Future<void> loginMethod() async {
//     isLoading1(true);
//     await getGeoLocationPosition();
//     if (user.text.isEmpty || pass.text.isEmpty) {
//       isLoading1(false);
//       // checkValidation();
//     } else {
//       var response = await http.get(Uri.parse('http://172.20.20.69/salesforce/login.php?user=${user.text}&password=${pass.text}'));
//       if (response.statusCode == 404) {
//         isLoading1(false);
//         Get.snackbar(
//             'Error',
//             'Wrong username or password',
//             backgroundColor: Colors.red,
//             duration: const Duration(seconds: 1)
//
//         );
//       } else if (response.statusCode == 200) {
//         data = loginModelFromJson(response.body);
//         print(response.body);
//         isLoading1(false);
//         rememberLogin();
//         Get.snackbar('Success', 'login Successful',
//             backgroundColor: Colors.white,
//             duration: const Duration(seconds: 1));
//         Get.to(() => DashboardScreen());
//       }
//     }
//   }
//
//   //For obscure text
//   var obscureText = true.obs;
//   void toggle() {
//     obscureText.value = !obscureText.value;
//   }
//
//   //implement Hive database for Remember me function
//   RxBool isChecked = false.obs;
//   @override
//   void onInit() async {
//     // TODO: implement onInit
//     user = TextEditingController();
//     pass = TextEditingController();
//     createOpenBox();
//     super.onInit();
//   }
//
//   //Hive database for remember me
//   void createOpenBox() async {
//     box1 = await Hive.openBox('logindata');
//     getData();
//   }
//
//   // get the data
//   void getData() async {
//     if (box1!.get('email') != null) {
//       user.text = box1?.get('email');
//       isChecked(true);
//     }
//     if (box1!.get('pass') != null) {
//       pass.text = box1?.get('pass');
//       isChecked(true);
//     }
//   }
//
//   //saving the data
//   void rememberLogin() {
//     // perform your login authentication
//     // is login success then save the credential if remember me is on
//     if (isChecked.value == true) {
//       box1!.put('email', user.value.text);
//       box1!.put('pass', pass.value.text);
//     }
//   }
//
//   //validation of textField
//   String userName = '';
//   String password = '';
//   String? validateUserName(String value) {
//     if (!GetUtils.isUsername(value)) {
//       return "Provide valid user name";
//     }
//     return null;
//   }
//
//   String? validatePassword(String value) {
//     if (value.length < 4) {
//       return "Password must be of 4 characters";
//     }
//     return null;
//   }
//
// /*  //validation checking
//   void checkValidation() {
//     final isValid = loginKey.currentState!.validate();
//     if (!isValid) {
//       return;
//     }
//     loginKey.currentState!.save();
//   }*/
//
//   RxDouble curntLong = 0.0.obs;
//   RxDouble curntLat = 0.0.obs;
//   double? distance;
//   Position? position;
//   Future<void> periodicallyLocationTracking() async{
//     await getGeoLocationPosition();
//     await getAddressFromLatLong();
//   }
//
//   Future<Position> getGeoLocationPosition() async {
//     bool serviceEnabled;
//     LocationPermission permission;
//     serviceEnabled = await Geolocator.isLocationServiceEnabled();
//     if (!serviceEnabled) {
//       await Geolocator.openLocationSettings();
//       return Future.error('Location services are disabled.');
//     }
//     permission = await Geolocator.checkPermission();
//     if (permission == LocationPermission.denied) {
//       permission = await Geolocator.requestPermission();
//       if (permission == LocationPermission.denied) {
//         return Future.error('Location permissions are denied');
//       }
//     }
//     if (permission == LocationPermission.deniedForever) {
//       // Permissions are denied forever, handle appropriately.
//       return Future.error(
//           'Location permissions are permanently denied, we cannot request permissions.');
//     }
//     position = await Geolocator.getCurrentPosition(
//         desiredAccuracy: LocationAccuracy.high);
//     curntLat.value = position!.latitude;
//     curntLong.value = position!.longitude;
//     print('Actual position is : $position');
//     print('Actual Current Latitude is : ${curntLat.value}');
//     print('Actual Current Longitude is : ${curntLong.value}');
//     return position!;
//   }
//
//   RxString addressInOut = ''.obs;
//   Future<void> getAddressFromLatLong() async {
//     List<Placemark> placeMarks =
//     await placemarkFromCoordinates(position!.latitude, position!.longitude);
// /*    curntLat.value = position!.latitude;
//     curntLong.value = position!.longitude;*/
//     Placemark place = placeMarks[1];
//     addressInOut.value = '${place.name}, ${place.locality}, ${place.country}';
//     print('My exact location is : $addressInOut');
//   }
// }