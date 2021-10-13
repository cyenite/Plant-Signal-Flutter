import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:plant_signal/source/controllers/user_controller.dart';
import 'package:plant_signal/source/screen/edit_profile_screen.dart';
import 'package:plant_signal/source/screen/scan_history_screen.dart';
import 'package:plant_signal/source/utils/WAWidgets.dart';

class ProfileScreen extends StatefulWidget {
  static String tag = '/ProfileScreen';

  @override
  ProfileScreenState createState() => ProfileScreenState();
}

class ProfileScreenState extends State<ProfileScreen> {
  UserController userController = Get.find<UserController>();
  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
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
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Text(
            'My Profile',
            style: boldTextStyle(color: Colors.black, size: 20),
          ),
          centerTitle: true,
          automaticallyImplyLeading: false,
          elevation: 0.0,
          brightness: Brightness.dark,
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.only(top: 60),
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('images/walletApp/wa_bg.jpg'),
                  fit: BoxFit.cover)),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                waCommonCachedNetworkImage(
                  'https://www.pngwing.com/en/free-png-zpsuv',
                  fit: BoxFit.cover,
                  height: 120,
                  width: 120,
                ).cornerRadiusWithClipRRect(60),
                16.height,
                Obx(() {
                  return Text('${userController.user.name}',
                      style: boldTextStyle());
                }),
                Obx(() {
                  return Text('${userController.user.email}',
                      style: secondaryTextStyle());
                }),
                16.height,
                SettingItemWidget(
                    title: 'Edit Profile',
                    decoration: boxDecorationRoundedWithShadow(12),
                    trailing:
                        Icon(Icons.arrow_right, color: grey.withOpacity(0.5)),
                    onTap: () {
                      EditProfileScreen(isEditProfile: true).launch(context);
                    }),
                16.height,
                /*SettingItemWidget(
                    title: 'Manage Detections',
                    decoration: boxDecorationRoundedWithShadow(12),
                    trailing:
                        Icon(Icons.arrow_right, color: grey.withOpacity(0.5)),
                    onTap: () {
                      //
                    }),
                16.height,*/
                SettingItemWidget(
                    title: 'Scan History',
                    decoration: boxDecorationRoundedWithShadow(12),
                    trailing:
                        Icon(Icons.arrow_right, color: grey.withOpacity(0.5)),
                    onTap: () {
                      Get.to(ScanHistoryScreen());
                    }),
                16.height,
                /* SettingItemWidget(
                    title: 'Settings',
                    decoration: boxDecorationRoundedWithShadow(12),
                    trailing:
                        Icon(Icons.arrow_right, color: grey.withOpacity(0.5)),
                    onTap: () {
                      //
                    }),*/
              ],
            ).paddingAll(16),
          ),
        ),
      ),
    );
  }
}
