import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:resturantapp/core/constants.dart';
import 'package:resturantapp/core/widgets/animated_loading.dart';
import 'package:resturantapp/view/Home/home_view.dart';
import 'package:resturantapp/view/register/register_screen.dart';
import 'package:resturantapp/view_model/Login_Controller.dart';
import '../../core/widgets/botton_widget.dart';
import '../core/IconBroken.dart';
import 'Home/layout_view.dart';

class LoginView extends StatefulWidget {
  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final formKey = GlobalKey<FormState>();

  final textController = TextEditingController();

  var emailController = TextEditingController();

  var passwordController = TextEditingController();

  bool? check1 = false;

  bool _passwordVisible = true;

  String token = 'your_token_value_here';

  bool _isConnected = false;

  bool is1Restaurant = false;

  Widget? homeScreen;

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

  // LoginController controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
        init: Get.put(LoginController()),
        builder: (controller) => Obx(
              () => ModalProgressHUD(
                inAsyncCall: controller.isLoading.value,
                progressIndicator: const AnimatedLoading(),
                child: GestureDetector(
                  onTap: () {
                    FocusScopeNode currentFocus = FocusScope.of(context);
                    if (!currentFocus.hasPrimaryFocus) {
                      currentFocus.unfocus();
                    }
                  },
                  child: SafeArea(
                    child: Scaffold(
                      body: Center(
                        child: SingleChildScrollView(
                          child: Form(
                            key: formKey,
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    // margin: EdgeInsets.all(8),

                                    // width: MediaQuery.of(context).size.width / 4.69,
                                    child: Image.asset(
                                      "assets/images/tourism.jpg",
                                      fit: BoxFit.fill,
                                      width: double.infinity,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 50,
                                  ),
                                  TextFormField(
                                    onChanged: controller.updateEmail,
                                    decoration: InputDecoration(
                                        contentPadding:
                                            const EdgeInsets.fromLTRB(
                                                30.0, 15.0, 30.0, 15.0),
                                        enabledBorder:
                                            const OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(10),
                                          ),
                                          borderSide: BorderSide(
                                            color: Color(0xB32C6686),
                                            width: 1.0,
                                          ),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide: const BorderSide(
                                            color: KPrimaryColor,
                                            width: 2.0,
                                          ),
                                        ),
                                        fillColor: const Color(0xB32C6686),
                                        prefixIcon: const Icon(
                                          IconBroken.Message,
                                          color: KPrimaryColor,
                                          size: 25,
                                        ),
                                        hintText: 'Email',
                                        hintStyle: const TextStyle(
                                          color: Colors.grey,
                                          fontSize: 17,
                                        )),
                                    validator: (String? value) {
                                      if (value!.isEmpty) {
                                        return "Enter Correct email";
                                      } else {
                                        return null;
                                      }
                                    },
                                  ),
                                  SizedBox(
                                    height:
                                        MediaQuery.of(context).size.height /
                                            40,
                                  ),
                                  TextFormField(
                                    //controller: passwordController,
                                    onChanged: controller.updatePassword,
                                    obscureText: _passwordVisible,
                                    decoration: InputDecoration(
                                      contentPadding:
                                          const EdgeInsets.fromLTRB(
                                              30.0, 15.0, 30.0, 15.0),
                                      enabledBorder:
                                          const OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(10),
                                        ),
                                        borderSide: BorderSide(
                                          color:  Color(0xB32C6686),
                                          width: 1.0,
                                        ),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10),
                                        borderSide: const BorderSide(
                                          color: KPrimaryColor,
                                          width: 1.0,
                                        ),
                                      ),
                                      fillColor: const Color(0xB32C6686),
                                      prefixIcon: const Icon(
                                        IconBroken.Lock,
                                        color: KPrimaryColor,
                                        size: 25,
                                      ),
                                      hintText: 'Password',
                                      hintStyle: const TextStyle(
                                        color: Colors.grey,
                                        fontSize: 17,
                                      ),
                                      suffixIcon: IconButton(
                                        icon: Icon(
                                          _passwordVisible
                                              ? IconBroken.Show
                                              : IconBroken.Hide,
                                          color: KPrimaryColor,
                                        ),
                                        onPressed: () {
                                          setState(() {
                                            _passwordVisible =
                                                !_passwordVisible;
                                          });
                                        },
                                      ),
                                    ),
                                    validator: (String? value) {
                                      if (value!.isEmpty) {
                                        return "Enter Correct Password";
                                      }
                                      // if (value.length < 8) {
                                      //   return "This Passward is short";
                                      // }
                                      else {
                                        return null;
                                      }
                                    },
                                  ),
                                  const SizedBox(height: 50),
                                  InkWell(
                                      onTap: () async {
                                        if (formKey.currentState!
                                            .validate()) {
                                          _isConnected =
                                              await checkInternetConnection();
                                          if (_isConnected == false) {
                                            Fluttertoast.showToast(
                                                msg: "No Internet ",
                                                backgroundColor:
                                                    Colors.red);
                                          } else {
                                            controller.login();
                                          }
                                        }
                                      },
                                      child:
                                          const ButtonWidget.buttonWidget(
                                              "SIGN IN",
                                              KPrimaryColor,
                                              60)),
                                  Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const Text(
                                          "Dont have an account?",
                                          style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 18,
                                          ),
                                        ),
                                        InkWell(
                                          onTap: () {
                                            Get.offAll(RegisterScreen());
                                          },
                                          child: const Text(
                                            " Create",
                                            style: TextStyle(
                                              decoration:
                                                  TextDecoration.underline,
                                              decorationColor:
                                                  KPrimaryColor,
                                              color: KPrimaryColor,
                                              fontSize: 20,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      /*Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (context) =>
                              RegisterScreen()));*/
                                    },
                                    child: const Text(
                                      "Forget Password?",
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 18,
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
                  ),
                ),
              ),
            ));
  }
}
