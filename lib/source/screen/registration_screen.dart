import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:plant_signal/source/controllers/auth_controller.dart';
import 'package:plant_signal/source/screen/login_screen.dart';
import 'package:plant_signal/source/utils/WAColors.dart';
import 'package:plant_signal/source/utils/WAWidgets.dart';

class RegistrationScreen extends StatefulWidget {
  static String tag = '/RegistrationScreen';

  @override
  RegistrationScreenState createState() => RegistrationScreenState();
}

class RegistrationScreenState extends State<RegistrationScreen> {
  var fullNameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmPasswordController = TextEditingController();
  AuthController controller = Get.find<AuthController>();

  FocusNode fullNameFocusNode = FocusNode();
  FocusNode emailFocusNode = FocusNode();
  FocusNode passWordFocusNode = FocusNode();
  FocusNode confirmPassWordFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    //
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('images/walletApp/wa_bg.jpg'),
              fit: BoxFit.cover),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              50.height,
              Text("Register New Account", style: boldTextStyle(size: 24)),
              Container(
                margin: EdgeInsets.all(16),
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.only(left: 16, right: 16, bottom: 16),
                      margin: EdgeInsets.only(top: 55.0),
                      decoration: boxDecorationWithShadow(
                          borderRadius: BorderRadius.circular(30)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                50.height,
                                Text("Full Name",
                                    style: boldTextStyle(size: 14)),
                                8.height,
                                AppTextField(
                                  decoration: waInputDecoration(
                                      hint: 'Enter your full name here',
                                      prefixIcon:
                                          Icons.person_outline_outlined),
                                  textFieldType: TextFieldType.NAME,
                                  keyboardType: TextInputType.name,
                                  controller: fullNameController,
                                  focus: fullNameFocusNode,
                                  nextFocus: emailFocusNode,
                                ),
                                16.height,
                                Text("Email", style: boldTextStyle(size: 14)),
                                8.height,
                                AppTextField(
                                  decoration: waInputDecoration(
                                      hint: 'Enter your email here',
                                      prefixIcon: Icons.email_outlined),
                                  textFieldType: TextFieldType.EMAIL,
                                  keyboardType: TextInputType.emailAddress,
                                  controller: emailController,
                                  focus: emailFocusNode,
                                  nextFocus: passWordFocusNode,
                                ),
                                16.height,
                                Text("Password",
                                    style: boldTextStyle(size: 14)),
                                8.height,
                                AppTextField(
                                  decoration: waInputDecoration(
                                      hint: 'Enter your password here',
                                      prefixIcon: Icons.lock_outline),
                                  suffixIconColor: WAPrimaryColor,
                                  textFieldType: TextFieldType.PASSWORD,
                                  isPassword: true,
                                  keyboardType: TextInputType.visiblePassword,
                                  controller: passwordController,
                                  focus: passWordFocusNode,
                                  nextFocus: confirmPassWordFocusNode,
                                ),
                                16.height,
                                Text("Confirm Password",
                                    style: boldTextStyle(size: 14)),
                                8.height,
                                AppTextField(
                                  decoration: waInputDecoration(
                                      hint: 'Re-type password',
                                      prefixIcon: Icons.lock_outline),
                                  suffixIconColor: WAPrimaryColor,
                                  textFieldType: TextFieldType.PASSWORD,
                                  isPassword: true,
                                  keyboardType: TextInputType.visiblePassword,
                                  controller: confirmPasswordController,
                                  focus: confirmPassWordFocusNode,
                                ),
                                30.height,
                                AppButton(
                                        text: "Register Account",
                                        color: WAPrimaryColor,
                                        textColor: Colors.white,
                                        shapeBorder: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(30)),
                                        width: MediaQuery.of(context).size.width,
                                        onTap: () {
                                          if (passwordController.text ==
                                              confirmPasswordController.text) {
                                            if (fullNameController
                                                    .text.isNotEmpty &&
                                                emailController
                                                    .text.isNotEmpty) {
                                              if (emailController
                                                  .text.isEmail) {
                                                controller.createUser(
                                                    fullNameController.text,
                                                    emailController.text,
                                                    passwordController.text);
                                                LoginScreen().launch(context);
                                              } else {
                                                Get.snackbar("Error",
                                                    "Provide a valid email");
                                              }
                                            } else {
                                              Get.snackbar("Error",
                                                  "Fill all required fields");
                                            }
                                          } else {
                                            Get.snackbar("Error",
                                                "Passwords do not match");
                                          }
                                        })
                                    .paddingOnly(
                                        left:
                                            MediaQuery.of(context).size.width *
                                                0.1,
                                        right:
                                            MediaQuery.of(context).size.width *
                                                0.1),
                                30.height,
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text('Already have an account?',
                                        style: primaryTextStyle(
                                            color: Colors.grey)),
                                    4.width,
                                    Text('Log In here',
                                        style:
                                            boldTextStyle(color: Colors.black)),
                                  ],
                                ).onTap(() {
                                  finish(context);
                                }).center(),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      height: 100,
                      width: 100,
                      decoration: boxDecorationRoundedWithShadow(30),
                      child: Image.asset(
                        'images/plantlogo.png',
                        height: 60,
                        width: 60,
                        fit: BoxFit.cover,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
