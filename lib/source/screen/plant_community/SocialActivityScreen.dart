import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:plant_signal/main/utils/shimmer/shimmer.dart';
import 'package:plant_signal/source/utils/Generator.dart';
import 'package:plant_signal/source/utils/SizeConfig.dart';
import 'package:provider/provider.dart';

import '../../AppTheme.dart';
import '../../AppThemeNotifier.dart';

class SocialActivityScreen extends StatefulWidget {
  @override
  _SocialActivityScreenState createState() => _SocialActivityScreenState();
}

class _SocialActivityScreenState extends State<SocialActivityScreen> {
  late ThemeData themeData;
  late CustomAppTheme customAppTheme;

  late List<bool> _list;

  @override
  void initState() {
    super.initState();
    _list = List.generate(6, (index) => false);
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
                    Container(
                      margin: Spacing.left(24),
                      child: Row(
                        children: [
                          Container(
                            padding: Spacing.all(8),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                    color: themeData.colorScheme.onBackground
                                        .withAlpha(140),
                                    width: 1.5)),
                            child: Icon(
                              MdiIcons.accountPlusOutline,
                              size: MySize.size24,
                              color: themeData.colorScheme.onBackground,
                            ),
                          ),
                          Container(
                            margin: Spacing.left(16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Follow Requests",
                                  style: AppTheme.getTextStyle(
                                      themeData.textTheme.subtitle2,
                                      color: themeData.colorScheme.onBackground,
                                      fontWeight: 500,
                                      letterSpacing: 0),
                                ),
                                Text(
                                  "Approve or ignore request",
                                  style: AppTheme.getTextStyle(
                                      themeData.textTheme.caption,
                                      color: themeData.colorScheme.onBackground,
                                      fontWeight: 500,
                                      muted: true),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin: Spacing.fromLTRB(24, 16, 24, 0),
                      child: Text(
                        "Today",
                        style: AppTheme.getTextStyle(
                            themeData.textTheme.bodyText1,
                            color: themeData.colorScheme.onBackground,
                            fontWeight: 600),
                      ),
                    ),
                    Container(
                      margin: Spacing.fromLTRB(24, 16, 24, 0),
                      child: Row(
                        children: [
                          Generator.buildOverlaysProfile(
                              images: [
                                'assets/avatar-4.jpg',
                                'assets/avatar-5.jpg',
                              ],
                              size: MySize.size40!,
                              leftFraction: 0.25,
                              topFraction: 0.25,
                              enabledOverlayBorder: true,
                              overlayBorderThickness: 1.5,
                              overlayBorderColor: customAppTheme.bgLayer1),
                          Expanded(
                            child: Container(
                              margin: Spacing.left(8),
                              child: RichText(
                                text: TextSpan(
                                    style: AppTheme.getTextStyle(
                                        themeData.textTheme.bodyText1,
                                        color:
                                            themeData.colorScheme.onBackground,
                                        fontWeight: 500),
                                    children: <TextSpan>[
                                      TextSpan(
                                          text: "plant_signal, admin",
                                          style: AppTheme.getTextStyle(
                                              themeData.textTheme.bodyText2,
                                              color: themeData
                                                  .colorScheme.onBackground,
                                              letterSpacing: 0,
                                              fontWeight: 600)),
                                      TextSpan(
                                          text: "and ",
                                          style: AppTheme.getTextStyle(
                                              themeData.textTheme.caption,
                                              color: themeData
                                                  .colorScheme.onBackground,
                                              letterSpacing: 0,
                                              fontWeight: 500)),
                                      TextSpan(
                                          text: "5 others ",
                                          style: AppTheme.getTextStyle(
                                              themeData.textTheme.bodyText2,
                                              color: themeData
                                                  .colorScheme.onBackground,
                                              letterSpacing: 0,
                                              fontWeight: 600)),
                                      TextSpan(
                                          text: "started following you. ",
                                          style: AppTheme.getTextStyle(
                                              themeData.textTheme.caption,
                                              color: themeData
                                                  .colorScheme.onBackground,
                                              letterSpacing: 0,
                                              fontWeight: 500)),
                                      TextSpan(
                                          text: " 2d",
                                          style: AppTheme.getTextStyle(
                                              themeData.textTheme.caption,
                                              color: themeData
                                                  .colorScheme.onBackground,
                                              muted: true,
                                              letterSpacing: 0,
                                              fontWeight: 500)),
                                    ]),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin: Spacing.fromLTRB(24, 16, 24, 0),
                      child: Text(
                        "Recent",
                        style: AppTheme.getTextStyle(
                            themeData.textTheme.bodyText1,
                            color: themeData.colorScheme.onBackground,
                            fontWeight: 600),
                      ),
                    ),
                    Container(
                      margin: Spacing.fromLTRB(24, 0, 24, 0),
                      child: Column(
                        children: [
                          singleRecentWidget(
                              text: RichText(
                                text: TextSpan(children: <TextSpan>[
                                  TextSpan(
                                      text: "Follow ",
                                      style: AppTheme.getTextStyle(
                                          themeData.textTheme.bodyText2,
                                          color: themeData
                                              .colorScheme.onBackground,
                                          fontWeight: 500)),
                                  TextSpan(
                                      text: "Kenova Agrifarm ",
                                      style: AppTheme.getTextStyle(
                                          themeData.textTheme.bodyText2,
                                          color: themeData
                                              .colorScheme.onBackground,
                                          fontWeight: 600)),
                                  TextSpan(
                                      text:
                                          "and others you know to see their crop treatment recomendation posts. ",
                                      style: AppTheme.getTextStyle(
                                          themeData.textTheme.bodyText2,
                                          color: themeData
                                              .colorScheme.onBackground,
                                          fontWeight: 500)),
                                  TextSpan(
                                      text: "5w",
                                      style: AppTheme.getTextStyle(
                                          themeData.textTheme.bodyText2,
                                          color: themeData
                                              .colorScheme.onBackground,
                                          xMuted: true,
                                          fontWeight: 500)),
                                ]),
                              ),
                              image: 'assets/avatar-1.jpg'),
                        ],
                      ),
                    ),
                    Container(
                      margin: Spacing.fromLTRB(24, 16, 24, 0),
                      child: Text(
                        "Suggestions",
                        style: AppTheme.getTextStyle(
                            themeData.textTheme.bodyText1,
                            color: themeData.colorScheme.onBackground,
                            fontWeight: 600),
                      ),
                    ),
                    Container(
                      margin: Spacing.fromLTRB(24, 0, 24, 0),
                      child: Column(
                        children: [
                          singleSuggestionWidget(
                              image: 'assets/avatar-2.jpg',
                              name: "Kenova",
                              username: "agrifarm",
                              status: "Suggested for you",
                              index: 0),
                          singleSuggestionWidget(
                              image: 'assets/avatar-4.jpg',
                              name: "Bugen",
                              username: "admin",
                              status: "Suggested for you",
                              index: 1),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )));
      },
    );
  }

  Widget singleRecentWidget({required String image, RichText? text}) {
    return Container(
      margin: Spacing.top(16),
      child: Row(
        children: [
          Container(
            child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(MySize.size24!)),
                child: Image(
                  image: AssetImage(image),
                  height: MySize.size48,
                  width: MySize.size48,
                  fit: BoxFit.cover,
                )),
          ),
          Expanded(
            child: Container(
              margin: Spacing.left(16),
              child: text,
            ),
          )
        ],
      ),
    );
  }

  Widget singleSuggestionWidget(
      {required String image,
      required String name,
      required String username,
      required String status,
      required int index}) {
    return Container(
      margin: Spacing.top(16),
      child: InkWell(
        onTap: () {
          //_showBottomSheet(context);
        },
        child: Row(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(MySize.size24!)),
              child: Image(
                image: AssetImage(image),
                height: MySize.size48,
                width: MySize.size48,
                fit: BoxFit.cover,
              ),
            ),
            Expanded(
              child: Container(
                margin: Spacing.left(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      username,
                      style: AppTheme.getTextStyle(
                          themeData.textTheme.bodyText2,
                          letterSpacing: 0,
                          color: themeData.colorScheme.onBackground,
                          fontWeight: 600),
                    ),
                    Text(
                      name,
                      style: AppTheme.getTextStyle(themeData.textTheme.caption,
                          fontSize: 12,
                          color: themeData.colorScheme.onBackground,
                          letterSpacing: 0,
                          xMuted: true,
                          fontWeight: 600),
                    ),
                    Text(
                      status,
                      style: AppTheme.getTextStyle(themeData.textTheme.caption,
                          fontSize: 12,
                          color: themeData.colorScheme.onBackground,
                          muted: true,
                          letterSpacing: 0,
                          fontWeight: 500),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                setState(() {
                  _list[index] = !_list[index];
                });
              },
              child: Container(
                padding: Spacing.fromLTRB(16, 8, 16, 8),
                decoration: _list[index]
                    ? BoxDecoration(
                        borderRadius:
                            BorderRadius.all(Radius.circular(MySize.size6!)),
                        border: Border.all(
                            color: customAppTheme.bgLayer4, width: 1))
                    : BoxDecoration(
                        borderRadius:
                            BorderRadius.all(Radius.circular(MySize.size6!)),
                        color: themeData.colorScheme.primary),
                child: Text(
                  _list[index] ? "Following" : "Follow",
                  style: AppTheme.getTextStyle(themeData.textTheme.caption,
                      color: _list[index]
                          ? themeData.colorScheme.onBackground
                          : themeData.colorScheme.onPrimary,
                      fontWeight: 600,
                      letterSpacing: 0.3),
                ),
              ),
            ),
            Container(
              margin: Spacing.left(16),
              child: Icon(
                MdiIcons.close,
                size: MySize.size14,
                color: themeData.colorScheme.onBackground.withAlpha(200),
              ),
            )
          ],
        ),
      ),
    );
  }
}
