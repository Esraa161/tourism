import 'package:flutter/material.dart';
import 'dart:io';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:image_picker/image_picker.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:resturantapp/core/IconBroken.dart';
import '../../core/constants.dart';
import '../../core/widgets/botton_widget.dart';



class EditProfileScreen extends StatefulWidget {


  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
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
  final formKey = GlobalKey<FormState>();
  final _firstNameController = TextEditingController(text: "Ahmed");
  var _lastNameController = TextEditingController(text: "Mahmoud");
  var _locationController = TextEditingController(text: "الدقي - ميدان المساعة _ عمارة 12");
  final _phoneController = TextEditingController(text: "01234567895");
  var _emailController = TextEditingController(text: "Ahmed11@gmia.com");
  bool? check1 = false;
  bool _passwordVisible = true;
  String token = 'your_token_value_here';
  // bool isConnected = await InternetConnectionChecker().hasConnection;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkInternetConnection();
    // ConnectivityCubit();
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
      ImageFileProfile = imageFileProfile ;
    });

  }

  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        body: Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                children: [

                  Container(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height/4,
                    margin: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomRight,
                        colors: [
                          KSecondryColor,
                          KSecondryColor,
                          //KPrimaryColor.withOpacity(.7),
                        ],
                      ),
                      color: KPrimaryColor,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.7),
                          blurRadius: 5,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Center(
                          child: Stack(
                            children: [
                              Container(
                                width: 150,
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                height: 150,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(80),
                                    border: Border.all(
                                        color: Colors.white,
                                        width: 2),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.2),
                                        spreadRadius: 4,
                                        blurRadius: 5,
                                        offset: const Offset(0,
                                            2), // changes position of shadow
                                      ),
                                    ],
                                    image: DecorationImage(
                                        image:profileimage==null?AssetImage("assets/images/-frame-vector-ilustration.png"):FileImage(profileimage!) as ImageProvider,
                                        fit: BoxFit.cover)
                                ),
                              ),
                              // Container(
                              //   alignment: Alignment.topLeft,
                              //   child: Text("Edit",
                              //     style: TextStyle(color:Colors.white,fontSize: 20,),),
                              // ),

                              Positioned(
                                bottom: 0,
                                right: 3,
                                child: InkWell(
                                  onTap: () {
                                    showModalBottomSheet<void>(
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(20.0),
                                            topRight: Radius.circular(20.0),
                                          ),),
                                        backgroundColor:Colors.white,
                                        context: context,
                                        builder: (BuildContext context)
                                        {
                                          return SizedBox(
                                            height: 200,
                                            child: Center(
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                mainAxisSize: MainAxisSize.min,
                                                children: <Widget>[
                                                  Text(
                                                    "Select Photo",
                                                    style: TextStyle(
                                                        fontSize: 20
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 30,
                                                  ),
                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                    children: [
                                                      Column(
                                                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                        children: [
                                                          InkWell(
                                                            onTap:()async{
                                                              await getProfileImageByGallery();
                                                              _isConnected =
                                                              await checkInternetConnection();
                                                              if (_isConnected == false) {
                                                                Fluttertoast.showToast(
                                                                  //  msg: "",
                                                                    msg: "No internet",
                                                                    backgroundColor: Colors.red.shade400);
                                                              }
                                                              await ImageFileProfile == null ? null : Image.asset("assets/images/profileImage.png");
                                                              Navigator.pop(context);
                                                            },
                                                            child: CircleAvatar(
                                                              radius: 30,
                                                              backgroundColor:
                                                              Colors.white,
                                                              child: Icon(IconBroken.Image,
                                                                color:KPrimaryColor,),
                                                            ),
                                                          ),
                                                          Text(
                                                            "Gallery",
                                                            style: TextStyle(
                                                                fontSize: 18
                                                            ),
                                                          ),
                                                        ],
                                                      ),

                                                      Column(
                                                        children: [
                                                          InkWell(
                                                            onTap: ()async{
                                                              await getProfileImageByCam();
                                                              _isConnected =
                                                              await checkInternetConnection();
                                                              if (_isConnected == false) {
                                                                Fluttertoast.showToast(
                                                                  //  msg: "",
                                                                    msg: "noInternet",
                                                                    backgroundColor: Colors.red.shade400);
                                                              }
                                                              await ImageFileProfile == null ? null :Image.asset("assets/images/profileImage.png");
                                                              Navigator.pop(context);
                                                            },
                                                            child: CircleAvatar(
                                                              radius: 30,
                                                              backgroundColor:
                                                              Colors.white,
                                                              child: Icon(IconBroken.Camera,
                                                                color:KPrimaryColor,),
                                                            ),
                                                          ),
                                                          Text(
                                                            "Camira",
                                                            style: TextStyle(
                                                                fontSize: 18
                                                            ),
                                                          ),
                                                        ],
                                                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                      ),

                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          );
                                        }
                                    );
                                  },
                                  child: Container(
                                    padding:
                                    EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color:  KPrimaryColor, width: 1),
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(
                                          50),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.2),
                                          spreadRadius: 4,
                                          blurRadius: 5,
                                          offset: const Offset(0,
                                              2), // changes position of shadow
                                        ),
                                      ],
                                    ),
                                    child: Icon(
                                      IconBroken.Edit,
                                      color:KPrimaryColor,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Text("Ahmed Mahmoud",
                          style: TextStyle(color:Colors.white,fontSize: 20,fontFamily: "pacifico"),),

                      ],
                    ),

                  ),
                  Divider(),
                  Container(
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
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child:Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: TextFormField(
                                  controller: _firstNameController,
                                  decoration: InputDecoration(
                                    contentPadding:
                                    EdgeInsets.fromLTRB(30.0, 15.0, 30.0, 15.0),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(10),
                                      ),
                                      borderSide: BorderSide(
                                        color: Color(0x67966702),
                                        width: 1.0,
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                        color: KPrimaryColor,
                                        width: 2.0,
                                      ),
                                    ),
                                    fillColor: Color(0xFFF2F5F7),
                                    hintText: 'First name',

                                    hintStyle: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 17,
                                    ),

                                  ),
                                  validator: (String? value) {
                                    if (value!.isEmpty) {
                                      return "Enter First name";
                                    }
                                    if (value.length < 8) {
                                      return "This Passward is short";
                                    } else {
                                      return null;
                                    }
                                  },
                                ),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Expanded(
                                child: TextFormField(
                                  controller: _lastNameController,
                                  decoration: InputDecoration(
                                    contentPadding:
                                    EdgeInsets.fromLTRB(30.0, 15.0, 30.0, 15.0),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(10),
                                      ),
                                      borderSide: BorderSide(
                                        color: Color(0x67966702),
                                        width: 1.0,
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                        color: KPrimaryColor,
                                        width: 2.0,
                                      ),
                                    ),
                                    fillColor: Color(0xFFF2F5F7),

                                    hintText: 'Last name',
                                    hintStyle: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 17,
                                    ),
                                  ),
                                  validator: (String? value) {
                                    if (value!.isEmpty) {
                                      return "Enter last name";
                                    }
                                    else {
                                      return null;
                                    }
                                  },
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            controller: _emailController,
                            decoration: InputDecoration(
                                contentPadding:
                                EdgeInsets.fromLTRB(
                                    30.0, 15.0, 30.0, 15.0),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                  borderSide: BorderSide(
                                    color: Color(0x67966702),
                                    width: 1.0,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(
                                      10),
                                  borderSide: BorderSide(
                                    color: KPrimaryColor,
                                    width: 2.0,
                                  ),
                                ),
                                fillColor: Color(0xFFF2F5F7),
                                prefixIcon: Icon(
                                  IconBroken.Message,
                                  color: KPrimaryColor,
                                  size: 25,
                                ),
                                hintText: 'Email',
                                hintStyle: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 17,
                                )),
                            validator: (String? value) {
                              if (value!
                                  .isEmpty ) {
                                return "Enter Correct email";
                              } else {
                                return null;
                              }
                            },
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            controller: _phoneController,
                            decoration: InputDecoration(
                                contentPadding:
                                EdgeInsets.fromLTRB(30.0, 15.0, 30.0, 15.0),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                  borderSide: BorderSide(
                                    color: Color(0x67966702),
                                    width: 1.0,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                    color: KPrimaryColor,
                                    width: 2.0,
                                  ),
                                ),
                                fillColor: Color(0xFFF2F5F7),
                                prefixIcon: Icon(
                                  IconBroken.Call,
                                  color: KPrimaryColor,
                                  size: 25,
                                ),
                                hintText: 'Phone number',
                                hintStyle: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 17,
                                )),
                            keyboardType: TextInputType.phone,
                            validator: (String? value) {
                              if (value!
                                  .isEmpty || /*RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)||*/
                                  !RegExp(r'^[\w-\.]+@gmail.com').hasMatch(value)) {
                                return "Enter Correct phone number";
                              } else {
                                return null;
                              }
                            },
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            controller: _locationController,
                            decoration: InputDecoration(
                                contentPadding:
                                EdgeInsets.fromLTRB(30.0, 15.0, 30.0, 15.0),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                  borderSide: BorderSide(
                                    color: Color(0x67966702),
                                    width: 1.0,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                    color: KPrimaryColor,
                                    width: 2.0,
                                  ),
                                ),
                                fillColor: Color(0xFFF2F5F7),
                                prefixIcon: Icon(
                                  IconBroken.Location,
                                  color: KPrimaryColor,
                                  size: 25,
                                ),
                                hintText: 'Location',
                                hintStyle: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 17,
                                )),
                            keyboardType: TextInputType.phone,
                            validator: (String? value) {
                              if (value!.isEmpty ) {
                                return "Enter Correct phone number";
                              } else {
                                return null;
                              }
                            },
                          ),
                          SizedBox(
                            height: 10,
                          ),



                        ],
                      ),
                    ),

                  ),
                  SizedBox(height:100),
                  InkWell(
                      onTap: () async {
                        _isConnected = await checkInternetConnection();
                        if (_isConnected == false) {
                          Fluttertoast.showToast(
                              msg: "No Internet ",
                              backgroundColor: Colors.red);
                        }else{
                          Get.back();
                        }
                        // if (formKey.currentState!.validate()) {
                        //   _isConnected =
                        //   await checkInternetConnection();
                        //
                        // }
                      },
                      child: ButtonWidget.buttonWidget(
                          "Save", KPrimaryColor, 60)),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}