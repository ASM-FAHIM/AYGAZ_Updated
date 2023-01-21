import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:aygazhcm/sales/widget/big_text.dart';
import '../../constant/colors.dart';
import '../../constant/dimensions.dart';
import '../../widget/small_text.dart';
import '../controller/login_controller.dart';

class TsoSelectionScreen extends StatefulWidget {
  TsoSelectionScreen({Key? key}) : super(key: key);

  @override
  State<TsoSelectionScreen> createState() => _TsoSelectionScreenState();
}

class _TsoSelectionScreenState extends State<TsoSelectionScreen> {
  final GlobalKey<FormState> loginKey = GlobalKey();
  LoginController loginController = Get.put(LoginController());

  @override
  void initState() {
    // TODO: implement initState
    loginController.fetchTsoList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColor.appBarColor,
          leading: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: const Icon(
              Icons.arrow_back_outlined,
              size: 25,
            ),
          ),
          title: BigText(
            text: 'Tso List',
            color: AppColor.defWhite,
            size: 25,
          ),
        ),
        body: SingleChildScrollView(
          child: loginController.isLoading1.value
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.all(10.0),
                        child: CircularProgressIndicator(
                          color: AppColor.appBarColor,
                        ),
                      ),
                      Text('Loading...'),
                    ],
                  ),
                )
              : Container(
                  height: MediaQuery.of(context).size.height,
                  margin: EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Obx(
                        () => Expanded(
                          child: loginController.isFetched.value
                              ? Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.all(10.0),
                                        child: CircularProgressIndicator(
                                          color: AppColor.appBarColor,
                                        ),
                                      ),
                                      Text('Loading...'),
                                    ],
                                  ),
                                )
                              : ListView.builder(
                                  itemCount:
                                      loginController.tsoListModel!.length,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: const EdgeInsets.only(
                                          top: 5, bottom: 5),
                                      child: Obx(
                                        () => SizedBox(
                                          height: Dimensions.height50 +
                                              Dimensions.height20,
                                          child: loginController
                                                  .isLoading1.value
                                              ? const Center(
                                                  child:
                                                      CircularProgressIndicator(
                                                    color: Colors.white,
                                                  ),
                                                )
                                              : ListTile(
                                                  onTap: () {
                                                    loginController.loginMethod(loginController.tsoListModel![index]!.xsp.toString());
                                                  },
                                                  tileColor:
                                                      AppColor.appBarColor,
                                                  title: Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      BigText(
                                                        text: loginController
                                                            .tsoListModel![
                                                                index]!
                                                            .xsp
                                                            .toString(),
                                                        size: 20,
                                                        color:
                                                            AppColor.defWhite,
                                                      )
                                                    ],
                                                  ),
                                                  subtitle: Column(
                                                    children: [
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          SmallText(
                                                            text: loginController
                                                                .tsoListModel![
                                                                    index]!
                                                                .xstaff
                                                                .toString(),
                                                            size: 18,
                                                          ),
                                                          SmallText(
                                                            text: loginController
                                                                .tsoListModel![
                                                                    index]!
                                                                .xterritory
                                                                .toString(),
                                                            size: 16,
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                              ),
                                        ),
                                      ),
                                    );
                              }),
                        ),
                      ),
                    ],
                  ),
              ),
        ),
      ),
    );
  }
}
