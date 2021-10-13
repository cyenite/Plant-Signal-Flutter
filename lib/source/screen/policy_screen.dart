import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:plant_signal/source/screen/verification_screen.dart';
import 'package:plant_signal/source/utils/WAColors.dart';

class PolicyScreen extends StatefulWidget {
  static String tag = '/PolicyScreen';
  final String verificationId;

  PolicyScreen({required this.verificationId});

  @override
  PolicyScreenState createState() => PolicyScreenState();
}

class PolicyScreenState extends State<PolicyScreen> {
  @override
  void initState() {
    super.initState();
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
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        actions: [
          Text('SKIP', style: boldTextStyle())
              .paddingOnly(right: 8)
              .center()
              .onTap(() {
            Get.to(VerificationScreen(
              verificationID: widget.verificationId,
            ));
          }),
        ],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('images/walletApp/wa_bg.jpg'),
              fit: BoxFit.cover),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'images/policy_illustration.png',
              width: MediaQuery.of(context).size.width * 0.80,
              height: MediaQuery.of(context).size.width * 0.80,
              fit: BoxFit.cover,
            ),
            8.height,
            Text(
              'Plant Signal Privacy Statement',
              style: boldTextStyle(size: 20),
              textAlign: TextAlign.center,
            ),
            16.height,
            Text(
              'Plant Signal Limited is committed to maintaining robust privacy protection for its users. We safeguard the information you provide to us  and use it to assist you in making informed decisions when using our service.',
              style: secondaryTextStyle(),
              textAlign: TextAlign.center,
            ),
            30.height,
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.5,
              child: AppButton(
                  text: "Next",
                  color: WAPrimaryColor,
                  textColor: Colors.white,
                  shapeBorder: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  width: MediaQuery.of(context).size.width,
                  onTap: () {
                    Get.off(() => VerificationScreen(
                          verificationID: widget.verificationId,
                        ));
                  }),
            ),
          ],
        ).paddingOnly(left: 30, right: 30).paddingTop(40),
      ),
    );
  }
}