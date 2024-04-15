import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:resturantapp/core/IconBroken.dart';
import 'package:resturantapp/view/edit%20profile/editprofile_Screen.dart';
import 'package:resturantapp/view_model/profile_view_model.dart';

import '../../core/constants.dart';
import '../../main.dart';
import '../../view_model/cart_view_model.dart';

class ProfileView extends StatefulWidget {
  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  final CartViewModel cartViewModel = Get.find();

  @override
  bool? _isConnected = false;
  bool isAsyncCall = false;
  late ScrollController scrollController;
  TextEditingController textEditingController = TextEditingController();
  String basePhoto =
      "http://148.113.1.230:2060/vansales/Emplyee/getimg?imgpath=c:\\company_data\\circle_2_test";

  File? profileimage;

  XFile? ImageFileProfile;

  final picker = ImagePicker();

  Future<void> getProfileImageByGallery() async {
    XFile? imageFileProfile =
        await picker.pickImage(source: ImageSource.gallery);
    if (imageFileProfile == null) return null;
    setState(() {
      profileimage = File(imageFileProfile.path);
      ImageFileProfile = imageFileProfile;
    });
  }

  Future<bool> checkInternetConnection() async {
    bool isConnected = await InternetConnectionChecker().hasConnection;
    return isConnected!;
  }

  Future<void> getProfileImageByCam() async {
    XFile? imageFileProfile =
        await picker.pickImage(source: ImageSource.camera);
    if (imageFileProfile == null) return;
    setState(() {
      profileimage = File(imageFileProfile.path);
      ImageFileProfile = imageFileProfile;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Container(
            width: double.infinity,

            height: MediaQuery.of(context).size.height / 4,
            margin: const EdgeInsets.all(16),
            // decoration: BoxDecoration(
            //   gradient: const LinearGradient(
            //     begin: Alignment.topRight,
            //     end: Alignment.bottomRight,
            //     colors: [
            //       KSecondryColor,
            //       KSecondryColor,
            //       //KPrimaryColor.withOpacity(.7),
            //     ],
            //   ),
            //   color: KPrimaryColor,
            //   borderRadius: BorderRadius.circular(10),
            //   boxShadow: [
            //     BoxShadow(
            //       color: Colors.grey.withOpacity(0.7),
            //       blurRadius: 5,
            //       offset: const Offset(0, 3),
            //     ),
            //   ],
            // ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Center(
                  child: Column(
                    children: [
                      // InkWell(
                      //   child: Row(
                      //     children: [
                      //       SizedBox(
                      //         width: MediaQuery.of(context).size.width / 3,
                      //         child: const Row(
                      //           children: [
                      //             Padding(
                      //               padding:
                      //                   EdgeInsets.symmetric(horizontal: 10.0),
                      //               child: Text(
                      //                 "Edit",
                      //                 style: TextStyle(
                      //                   color: KPrimaryColor,
                      //                   fontSize: 20,
                      //                 ),
                      //               ),
                      //             ),
                      //             Icon(
                      //               IconBroken.Edit_Square,
                      //               color:KPrimaryColor,
                      //             )
                      //           ],
                      //         ),
                      //       ),
                      //     ],
                      //   ),
                      //   onTap: () {
                      //     Get.to(EditProfileScreen());
                      //   },
                      // ),
                      Container(
                        width: 200,
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        height: 200,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(100),
                            border: Border.all(color: Colors.white, width: 2),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.2),
                                spreadRadius: 4,
                                blurRadius: 5,
                                offset: const Offset(
                                    0, 2), // changes position of shadow
                              ),
                            ],
                            image: DecorationImage(
                                image: profileimage == null
                                    ? const AssetImage(
                                        "assets/images/user3.jpg")
                                    : FileImage(profileimage!) as ImageProvider,
                                fit: BoxFit.cover)),
                      ),
                      // Container(
                      //   alignment: Alignment.topLeft,
                      //   child: Text("Edit",
                      //     style: TextStyle(color:Colors.white,fontSize: 20,),),
                      // ),
                    ],
                  ),
                ),
                const Text(
                  "Ahmed Mahmoud",
                  style: TextStyle(
                      color: KPrimaryColor,
                      fontSize: 20,
                      fontFamily: "pacifico"),
                ),
              ],
            ),
          ),
          Divider(),
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height / 7,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.7),
                  blurRadius: 5,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        "Email",
                        style: TextStyle(fontSize: 18),
                      ),
                      Text(
                        "Ahmed11@gmia.com",
                        style: TextStyle(fontSize: 18, color: KPrimaryColor),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Icon(
                        IconBroken.Call,
                        color: KPrimaryColor,
                      ),
                      Text(
                        "01234567895",
                        style: TextStyle(fontSize: 18, color: KSecondryColor),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Container(
              width: double.infinity,
              // height: MediaQuery.of(context).size.height/7,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.7),
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: CircleAvatar(
                            child: Icon(
                              IconBroken.Location,
                            ),
                          ),
                        ),
                        Text(
                          "Location",
                          style: TextStyle(fontSize: 20),
                        ),
                      ],
                    ),
                    Text(
                      "الدقي - ميدان المساعة _ عمارة 12",
                      style: TextStyle(color: Colors.grey),
                    )
                  ],
                ),
              ),
            ),
          ),
          const Divider(),
          GetBuilder<ProfileViewModel>(
              init: ProfileViewModel(),
              builder: (controller) => InkWell(
                    onTap: () {
                      controller.signOut();

                      sharedPref!.clear();
                    },
                    child: Container(
                      width: double.infinity,
                      // height: MediaQuery.of(context).size.height/7,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.7),
                            blurRadius: 5,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: CircleAvatar(
                                    child: Icon(
                                      IconBroken.Logout,
                                    ),
                                  ),
                                ),
                                Text(
                                  "Logout",
                                  style: TextStyle(fontSize: 20),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  )),
        ],
      ),
    );
  }
}
