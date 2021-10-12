import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/style.dart';
import 'package:plant_signal/source/controllers/auth_controller.dart';
import 'package:plant_signal/source/controllers/user_controller.dart';
import 'package:plant_signal/source/utils/WAColors.dart';

class WAVerificationScreen extends StatefulWidget {
  static String tag = '/WAVerificationScreen';
  final String verificationID;

  WAVerificationScreen({required this.verificationID});

  @override
  WAVerificationScreenState createState() => WAVerificationScreenState();
}

class WAVerificationScreenState extends State<WAVerificationScreen> {
  UserController controller = Get.find<UserController>();
  AuthController authController = Get.find<AuthController>();
  @override
  void initState() {
    super.initState();
    //authController.verifyPhoneNumber();
    init();
  }

  Future<void> init() async {
    //
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Container(
          margin: EdgeInsets.all(8),
          decoration: boxDecorationWithRoundedCorners(
            backgroundColor: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.grey.withOpacity(0.2)),
          ),
          child: Icon(Icons.arrow_back),
        ).onTap(() {
          finish(context);
        }),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('images/walletApp/wa_bg.jpg'),
              fit: BoxFit.cover),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              30.height,
              Image.asset(
                'images/walletApp/wa_verification.png',
              ),
              8.height,
              Text(
                'Verification',
                style: boldTextStyle(size: 20),
                textAlign: TextAlign.center,
              ),
              16.height,
              Text(
                'We have sent a 4 digit verification code to ${controller.user.phoneNumber}. Please enter the code below to verify it\'s you',
                style: secondaryTextStyle(),
                textAlign: TextAlign.center,
              ),
              30.height,
              Wrap(
                children: [
                  SizedBox(
                    height: 60,
                    //width: MediaQuery.of(context).size.width,
                    child: OTPTextField(
                      length: 6,
                      width: MediaQuery.of(context).size.width,
                      fieldWidth: 40,
                      style: boldTextStyle(size: 20),
                      textFieldAlignment: MainAxisAlignment.spaceBetween,
                      fieldStyle: FieldStyle.box,
                      otpFieldStyle: OtpFieldStyle(
                        focusBorderColor: WAPrimaryColor,
                        backgroundColor: Colors.grey.withOpacity(0.1),
                        enabledBorderColor: Colors.transparent,
                      ),
                      onChanged: (value) {
                        controller.otpCode = value.obs;
                      },
                      onCompleted: (value) {
                        controller.otpCode = value.obs;
                      },
                    ),
                  ),
                ],
              ),
              16.height,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('I didn\'t get the Code.', style: secondaryTextStyle()),
                  4.width,
                  Text('Resend Code',
                      style: boldTextStyle(color: WAPrimaryColor)),
                ],
              ),
              16.height,
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.5,
                child: AppButton(
                    text: "Verify Me",
                    color: WAPrimaryColor,
                    textColor: Colors.white,
                    shapeBorder: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    width: MediaQuery.of(context).size.width,
                    onTap: () {authController.completePhoneRegistration(widget.verificationID);}),
              ),
            ],
          ).paddingAll(30),
        ),
      ),
    );
  }
}
