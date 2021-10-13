import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:plant_signal/main/utils/shimmer/shimmer.dart';
import 'package:plant_signal/source/controllers/user_controller.dart';
import 'package:plant_signal/source/utils/Generator.dart';
import 'package:plant_signal/source/utils/SizeConfig.dart';
import 'package:provider/provider.dart';

import '../../AppTheme.dart';
import '../../AppThemeNotifier.dart';

class SocialSettingScreen extends StatefulWidget {
  @override
  _SocialSettingScreenState createState() => _SocialSettingScreenState();
}

class _SocialSettingScreenState extends State<SocialSettingScreen> {
  late ThemeData themeData;
  late CustomAppTheme customAppTheme;

  late String desc;

  @override
  void initState() {
    super.initState();
    desc = Generator.getDummyText(8);
  }

  Widget build(BuildContext context) {
    themeData = Theme.of(context);
    return Consumer<AppThemeNotifier>(
      builder: (BuildContext context, AppThemeNotifier value, Widget? child) {
        customAppTheme = AppTheme.getCustomAppTheme(value.themeMode());
        return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: AppTheme.getThemeFromThemeMode(value.themeMode()),
            home: Scaffold(
                body: Container(
              color: customAppTheme.bgLayer1,
              child: Shimmer.fromColors(
                highlightColor: Colors.white,
                baseColor: Colors.grey,
                child: ListView(
                  padding: Spacing.top(48),
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: Spacing.fromLTRB(24, 8, 24, 0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.all(
                                Radius.circular(MySize.size50!)),
                            child: Image(
                              image: AssetImage('assets/avatar-4.jpg'),
                              width: MySize.size100,
                              height: MySize.size100,
                            ),
                          ),
                        ),
                        Container()
                      ],
                    ),
                    Container(
                      padding: Spacing.fromLTRB(24, 16, 24, 0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                "${Get.find<UserController>().user.name}",
                                style: AppTheme.getTextStyle(
                                    themeData.textTheme.headline6,
                                    fontWeight: 600),
                              ),
                              Container(
                                margin: Spacing.top(4),
                                child: Text(
                                  "${Get.find<UserController>().user.email}",
                                  style: AppTheme.getTextStyle(
                                      themeData.textTheme.caption),
                                ),
                              ),
                              Text(
                                "Description",
                                style: AppTheme.getTextStyle(
                                    themeData.textTheme.caption),
                              ),
                              Text(
                                "",
                                style: AppTheme.getTextStyle(
                                    themeData.textTheme.caption),
                              ),
                              Text("See more",
                                  style: AppTheme.getTextStyle(
                                      themeData.textTheme.caption,
                                      decoration: TextDecoration.underline)),
                            ],
                          ),
                          ElevatedButton(
                              style: ButtonStyle(
                                  padding: MaterialStateProperty.all(
                                      Spacing.xy(16, 0))),
                              onPressed: () {},
                              child: Text(
                                "Edit",
                                style: AppTheme.getTextStyle(
                                    themeData.textTheme.bodyText2,
                                    fontWeight: 600,
                                    letterSpacing: 0.3,
                                    color: themeData.colorScheme.onPrimary),
                              ))
                        ],
                      ),
                    ),
                    Container(
                      padding: Spacing.fromLTRB(24, 24, 24, 0),
                      child: Container(
                        padding: EdgeInsets.all(MySize.size16!),
                        decoration: BoxDecoration(
                            color: themeData.backgroundColor,
                            borderRadius: BorderRadius.all(
                                Radius.circular(MySize.size4!)),
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: MySize.size2,
                                  color: customAppTheme.shadowColor),
                            ],
                            border: Border.all(
                                color: customAppTheme.bgLayer4, width: 0.7)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Column(
                              children: <Widget>[
                                Text(
                                  "15",
                                  style: AppTheme.getTextStyle(
                                      themeData.textTheme.subtitle1,
                                      fontWeight: 700),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: MySize.size8!),
                                  child: Text("Posts",
                                      style: AppTheme.getTextStyle(
                                          themeData.textTheme.subtitle2,
                                          fontWeight: 600,
                                          letterSpacing: 0)),
                                ),
                              ],
                            ),
                            Column(
                              children: <Widget>[
                                Text(
                                  "486",
                                  style: AppTheme.getTextStyle(
                                      themeData.textTheme.subtitle1,
                                      fontWeight: 700),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: MySize.size8!),
                                  child: Text(
                                    "Followers",
                                    style: AppTheme.getTextStyle(
                                        themeData.textTheme.subtitle2,
                                        fontWeight: 600,
                                        letterSpacing: 0),
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: <Widget>[
                                Text(
                                  "58",
                                  style: AppTheme.getTextStyle(
                                      themeData.textTheme.subtitle1,
                                      fontWeight: 700),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: MySize.size8!),
                                  child: Text(
                                    "Following",
                                    style: AppTheme.getTextStyle(
                                        themeData.textTheme.subtitle2,
                                        fontWeight: 600,
                                        letterSpacing: 0),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      margin: Spacing.fromLTRB(24, 24, 24, 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Complete your profile",
                            style: AppTheme.getTextStyle(
                                themeData.textTheme.subtitle2,
                                color: themeData.colorScheme.onBackground,
                                fontWeight: 600,
                                letterSpacing: 0),
                          ),
                          RichText(
                              text: TextSpan(children: <TextSpan>[
                            TextSpan(
                                text: "2 OF 4 ",
                                style: AppTheme.getTextStyle(
                                    themeData.textTheme.caption,
                                    fontSize: 11,
                                    fontWeight: 600,
                                    color: customAppTheme.colorSuccess)),
                            TextSpan(
                                text: " COMPLETE",
                                style: AppTheme.getTextStyle(
                                    themeData.textTheme.caption,
                                    color: themeData.colorScheme.onBackground,
                                    xMuted: true,
                                    fontSize: 11,
                                    fontWeight: 600)),
                          ]))
                        ],
                      ),
                    ),
                    Container(
                      margin: Spacing.top(16),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            Container(
                              margin: Spacing.left(24),
                              child: singleCompleteWidget(
                                  iconData: MdiIcons.accountOutline,
                                  option: "Add Photo",
                                  title: "Add Profile Photo",
                                  desc: desc),
                            ),
                            Container(
                              margin: Spacing.left(24),
                              child: singleCompleteWidget(
                                  iconData: MdiIcons.chatOutline,
                                  option: "Add Bio",
                                  title: "Add Bio",
                                  desc: desc),
                            ),
                            Container(
                              margin: Spacing.horizontal(24),
                              child: singleCompleteWidget(
                                  iconData: MdiIcons.accountMultipleOutline,
                                  option: "Find More",
                                  title: "Find people",
                                  desc: desc),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )));
      },
    );
  }

  Widget singleCompleteWidget(
      {IconData? iconData,
      required String title,
      required String desc,
      required String option}) {
    return Container(
      padding: Spacing.fromLTRB(24, 24, 24, 16),
      width: MySize.getScaledSizeWidth(220),
      decoration: BoxDecoration(
          color: customAppTheme.bgLayer2,
          borderRadius: BorderRadius.all(Radius.circular(MySize.size4!)),
          border: Border.all(color: customAppTheme.bgLayer4, width: 1)),
      child: Column(
        children: [
          Container(
            padding: Spacing.all(8),
            decoration: BoxDecoration(
                border: Border.all(
                    color: themeData.colorScheme.onBackground.withAlpha(120),
                    width: 1.5),
                shape: BoxShape.circle),
            child: Icon(
              iconData,
              color: themeData.colorScheme.onBackground.withAlpha(180),
              size: MySize.size26,
            ),
          ),
          Container(
            margin: Spacing.top(12),
            child: Text(
              title,
              style: AppTheme.getTextStyle(themeData.textTheme.bodyText2,
                  color: themeData.colorScheme.onBackground,
                  fontWeight: 600,
                  letterSpacing: 0),
            ),
          ),
          Container(
            margin: Spacing.top(4),
            child: Text(
              desc,
              style: AppTheme.getTextStyle(themeData.textTheme.caption,
                  color: themeData.colorScheme.onBackground,
                  fontWeight: 400,
                  letterSpacing: -0.2),
              textAlign: TextAlign.center,
            ),
          ),
          Container(
            margin: Spacing.top(12),
            padding: Spacing.fromLTRB(12, 8, 12, 8),
            decoration: BoxDecoration(
                color: themeData.colorScheme.primary,
                borderRadius: BorderRadius.all(Radius.circular(MySize.size4!))),
            child: Text(
              option,
              style: AppTheme.getTextStyle(themeData.textTheme.caption,
                  color: themeData.colorScheme.onPrimary, fontWeight: 600),
            ),
          ),
        ],
      ),
    );
  }
}
