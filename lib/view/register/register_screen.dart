import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:resturantapp/view/login.dart';
import '../../core/IconBroken.dart';
import '../../core/constants.dart';
import '../../core/widgets/botton_widget.dart';


class RegisterScreen extends StatefulWidget {
  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final formKey = GlobalKey<FormState>();
  final _firstNameController = TextEditingController();
  var _lastNameController = TextEditingController();
  var _locationController = TextEditingController();
  final _phoneController = TextEditingController();
  var _emailController = TextEditingController();
  var _passwordController = TextEditingController();
  bool? check1 = false;
  bool _passwordVisible = true;
  String token = 'your_token_value_here';
  bool? _isConnected = false;
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

  @override
  Widget build(BuildContext context) {
    /* return BlocConsumer<loginCubit, loginState>(
        listener: (context, state) async {
          if(state is loginSuccessState){
            if(state.loginModel.success==true){
              DioHelper.saveToken(token);
              Future<String> retrievedToken = DioHelper.getToken();
              print(state.loginModel.data!.token);
              final snackBar = SnackBar(
                  content: Text('Submitting form'));
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) =>
                      allOrders_screen()));
            }else{

           Fluttertoast.showToast(msg:state.loginModel.message! ,backgroundColor: Colors.red);

            }
          }
        },
        builder: (context, state) {*/
    return SafeArea(
      child: GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
          }
        },
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Center(
            child: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    children: [
                      Text(
                        "Create your account",
                        style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: KPrimaryColor,
                        fontFamily:"pacifico"),
                      ),

                      SizedBox(
                        height: 50,
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height/2,
                        child:Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: TextFormField(
                                    controller: _firstNameController,
                                    obscureText: _passwordVisible,
                                    decoration: InputDecoration(
                                      contentPadding:
                                      EdgeInsets.fromLTRB(30.0, 15.0, 30.0, 15.0),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: const BorderRadius.all(
                                          Radius.circular(10),
                                        ),
                                        borderSide: BorderSide(
                                          color: KSecondryColor,
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
                                    obscureText: _passwordVisible,
                                    decoration: InputDecoration(
                                      contentPadding:
                                      EdgeInsets.fromLTRB(30.0, 15.0, 30.0, 15.0),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: const BorderRadius.all(
                                          Radius.circular(10),
                                        ),
                                        borderSide: BorderSide(
                                          color:KSecondryColor,
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
                                      color: KSecondryColor,
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
                                      color: KSecondryColor,
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
                                      color: KSecondryColor,
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
                                  hintText: 'Address',
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
                            TextFormField(
                              controller: _passwordController,
                              obscureText: _passwordVisible,
                              decoration: InputDecoration(
                                contentPadding:
                                EdgeInsets.fromLTRB(
                                    30.0, 15.0, 30.0, 15.0),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                  borderSide: BorderSide(
                                    color:KSecondryColor,
                                    width: 1.0,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                    color: KPrimaryColor,
                                    width: 1.0,
                                  ),
                                ),
                                fillColor: Color(0xFFF2F5F7),
                                prefixIcon: Icon(
                                  IconBroken.Lock,
                                  color: KPrimaryColor,
                                  size: 25,
                                ),
                                hintText: 'Password',
                                hintStyle: TextStyle(
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
                            SizedBox(height: 20),
                            InkWell(
                                onTap: () async {
                                  if (formKey.currentState!.validate()) {
                                    _isConnected =
                                        await checkInternetConnection();
                                    if (_isConnected == false) {
                                      Fluttertoast.showToast(
                                          msg: "No Internet ",
                                          backgroundColor: Colors.red);
                                    }
                                  }
                                },
                                child: ButtonWidget.buttonWidget(
                                    "SIGN UP", KPrimaryColor, 60)),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Already have an account",
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 18,
                              ),
                            ),
                            InkWell(
                              onTap: (){
                                Get.offAll(LoginView());
                              },
                              child: Text(
                                " Sign in",
                                style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  decorationColor: KPrimaryColor,
                                  color: KPrimaryColor,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          /*  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) =>
                          reset_password()));*/
                        },
                        child: Text(
                          "Forget Password?",
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 18,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 10,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
    // }
    // );
  }
}
