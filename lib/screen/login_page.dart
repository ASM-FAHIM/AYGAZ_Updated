import 'dart:async';
import 'dart:convert';
import 'package:aygazhcm/conts_api_link.dart';
import 'package:aygazhcm/data_model/loginModel.dart';
import 'package:aygazhcm/home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart' as http;

class Login_page extends StatefulWidget {
  const Login_page({Key? key}) : super(key: key);

  @override
  _Login_pageState createState() => _Login_pageState();
}

class _Login_pageState extends State<Login_page> {
  GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  late String zemail;
  String xpassword = "";
  bool _obsecureText = true;
  bool isLoading = false;
  void toggle() {
    setState(() {
      _obsecureText = !_obsecureText;
    });
  }

  //Hive Database for remember me.
  bool isChecked = false;
  TextEditingController userController = TextEditingController();
  TextEditingController passController = TextEditingController();
  late Box _box;
  late LoginModel data;
  submitData(String zemail, String xpassword) async {
    print(zemail);
    print(xpassword);
    var response = await http.post(
      Uri.parse(ConstApiLink().loginApi),
      body: jsonEncode(
        <String, String>{
          "zemail": zemail,
          "xpassword": xpassword,
        },
      ),
    );
    print(ConstApiLink().loginApi);
    data = loginModelFromJson(response.body);
    print(response.body);
    if (response.statusCode == 404) {
      setState(() {
        isLoading = false;
      });
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text(
                "Warning",
                style: TextStyle(
                    fontSize: 20,
                    color: Color(0xffC85E2D),
                    fontWeight: FontWeight.bold),
              ),
              content: Text(
                "Wrong Username or Password",
                style: TextStyle(
                    // color:Color(0xffE75A29)
                    ),
              ),
              scrollable: true,
            );
          });
    }

    data = loginModelFromJson(response.body);
    print(response.body);
    if (response.statusCode == 200 && data.xpassword != xpassword) {
      setState(() {
        isLoading = false;
      });
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text(
                "Warning",
                style: TextStyle(
                    fontSize: 20,
                    color: Color(0xffC85E2D),
                    fontWeight: FontWeight.bold),
              ),
              content: Text(
                "Wrong Password",
                style: TextStyle(
                  // color:Color(0xffE75A29)
                ),
              ),
              scrollable: true,
            );
          });
    }
    if (response.statusCode == 200 && data.xpassword == xpassword) {
      setState(() {
        isLoading = false;
      });
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => Homepage(loginModel: data)));
    }
  }

  Future<List<LoginModel>>? futurePost;
  @override
  void initState() {
    super.initState();
    //hiveopen
    createBox();
    //internetCheck();
  }

  //hive createBox function
  void createBox() async {
    _box = await Hive.openBox("RememberMe");
    getData();
  }

  //save hive data
  getData() {
    if (_box.get('user') != null) {
      userController.text = _box.get('user');
    }
    if (_box.get('password') != null) {
      passController.text = _box.get('password');
    }
  }

  //Login button e press korle userID and password ta niye nibe
  void login() {
    if (isChecked) {
      _box.put('user', userController.text);
      _box.put('password', passController.text);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Scaffold(
          body: Container(
            child: SingleChildScrollView(
              child: Form(
                key: _formkey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 5,
                    ),
                    Container(
                      height: 100,
                      width: 200,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image(
                          image: AssetImage('images/orange.png'),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Container(
                        // decoration: BoxDecoration(
                        //   color: Colors.white,
                        //   border: Border.all(color: Colors.grey),
                        // ),
                        child: TextFormField(
                          controller: userController,
                          style: GoogleFonts.bakbakOne(
                            //fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.black,
                          ),
                          onChanged: (input) {
                            zemail = input;
                          },
                          validator: (input) {
                            if (input!.isEmpty) {
                              return "Empty";
                            }
                          },
                          scrollPadding: EdgeInsets.all(20),
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.only(
                                left: 20), // add padding to adjust text
                            isDense: false,
                            labelText: "User Name",
                            labelStyle: GoogleFonts.bakbakOne(
                              //fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.black,
                            ),
                            border: const OutlineInputBorder(),
                            suffixIcon: const Padding(
                              padding: EdgeInsets.only(
                                  top: 8), // add padding to adjust icon
                              child: Icon(Icons.person),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Container(
                        child: TextFormField(
                          controller: passController,
                          style: GoogleFonts.bakbakOne(
                            //fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.black,
                          ),
                          obscureText: _obsecureText,
                          onChanged: (input) {
                            xpassword = input;
                          },
                          scrollPadding: EdgeInsets.all(20),
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.only(
                              left: 20,
                            ), // add padding to adjust text
                            isDense: true,
                            labelText: "Password",
                            labelStyle: GoogleFonts.bakbakOne(
                              //fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.black,
                            ),
                            border: const OutlineInputBorder(),
                            suffixIcon: Padding(
                              padding: const EdgeInsets.only(
                                  top: 8), // add padding to adjust icon
                              child: IconButton(
                                icon: Icon(
                                  _obsecureText
                                      ? FontAwesomeIcons.solidEye
                                      : FontAwesomeIcons.solidEyeSlash,
                                ),
                                onPressed: () {
                                  toggle();
                                },
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Row(
                        children: [
                          Checkbox(
                            value: isChecked,
                            onChanged: (value) {
                              setState(
                                () {
                                  isChecked = value!;
                                },
                              );
                            },
                          ),
                          Text(
                            "Remember Me",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.bakbakOne(
                              fontSize: 20,
                              color: Colors.black,
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    GestureDetector(
                      //elevation: 5,
                      // style: ElevatedButton.styleFrom(
                      //   primary: Colors.white,
                      //   shape: RoundedRectangleBorder(
                      //     borderRadius: BorderRadius.circular(80.0),
                      //   ),
                      // ),

                      onTap: () {
                        setState(
                          () {
                            isLoading = true;
                          },
                        );
                        if (userController.text == '') {
                          print("User Invalid");
                          Get.snackbar('Error', 'User Invalid',
                              backgroundColor: Color(0XFF8CA6DB),
                              colorText: Colors.white,
                              snackPosition: SnackPosition.BOTTOM);
                          setState(() {
                            isLoading = false;
                          });
                        } else {
                          submitData(userController.text, passController.text);
                        }
                        login();
                      },
                      //shape: RoundedRectangleBorder(
                        //borderRadius: BorderRadius.circular(80.0),
                      //),
                      //textColor: Colors.white,
                      //padding: const EdgeInsets.all(0),
                      child: Container(
                        alignment: Alignment.center,
                        height: 50.0,
                        width: MediaQuery.of(context).size.width * 0.5,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(80.0),
                          gradient: const LinearGradient(
                            colors: [
                              Color.fromARGB(255, 255, 136, 34),
                              Color.fromARGB(255, 255, 177, 41)
                            ],
                          ),
                        ),
                        padding: const EdgeInsets.all(0),
                        child: isLoading
                            ? const SizedBox(
                                height: 25,
                                width: 25,
                                child: CircularProgressIndicator(
                                  color: Colors.white,
                                ),
                              )
                            : Text(
                                "Login",
                                textAlign: TextAlign.center,
                                style: GoogleFonts.bakbakOne(
                                  fontSize: 20,
                                  color: Colors.white,
                                ),
                              ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
