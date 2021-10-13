import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:plant_signal/source/utils/SizeConfig.dart';
import 'package:provider/provider.dart';
import '../../AppTheme.dart';
import '../../AppThemeNotifier.dart';
import 'SocialProfileDetailScreen.dart';

class SocialProfileScreen extends StatefulWidget {
  @override
  _SocialProfileScreenState createState() => _SocialProfileScreenState();
}

class _SocialProfileScreenState extends State<SocialProfileScreen> {
  late ThemeData themeData;
  CustomAppTheme? customAppTheme;

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
              child: Stack(
                children: [
                  Image(
                    image: AssetImage('assets/social/profile-p1.jpg'),
                    fit: BoxFit.cover,
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                  ),
                  Positioned(
                    top: 48,
                    left: 0,
                    right: 0,
                    child: Container(
                      margin: Spacing.horizontal(24),
                      child: Row(
                        children: [
                          InkWell(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Icon(
                                MdiIcons.chevronLeft,
                                size: MySize.size24,
                                color: Colors.black,
                              ))
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              colors: [
                            Colors.black.withAlpha(220),
                            Colors.black.withAlpha(160),
                            Colors.black.withAlpha(100),
                            Colors.black.withAlpha(0)
                          ],
                              stops: [
                            0.25,
                            0.5,
                            0.75,
                            1
                          ],
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter)),
                      padding: Spacing.fromLTRB(24, 56, 24, 24),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Zayn Molloy",
                            style: AppTheme.getTextStyle(
                                themeData.textTheme.headline5,
                                color: Colors.white,
                                fontWeight: 700),
                          ),
                          Text(
                            "Fashion Model",
                            style: AppTheme.getTextStyle(
                                themeData.textTheme.bodyText2,
                                color: Colors.white,
                                muted: true,
                                fontWeight: 500),
                          ),
                          Container(
                            margin: Spacing.top(24),
                            child: IntrinsicHeight(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Column(
                                    children: [
                                      Text(
                                        "125",
                                        style: AppTheme.getTextStyle(
                                            themeData.textTheme.subtitle1,
                                            color: Colors.white,
                                            fontWeight: 600),
                                      ),
                                      Container(
                                        margin: Spacing.top(4),
                                        child: Text(
                                          "Posts",
                                          style: AppTheme.getTextStyle(
                                              themeData.textTheme.bodyText2,
                                              color: Colors.white,
                                              muted: true,
                                              fontWeight: 400),
                                        ),
                                      ),
                                    ],
                                  ),
                                  VerticalDivider(),
                                  Column(
                                    children: [
                                      Text(
                                        "250",
                                        style: AppTheme.getTextStyle(
                                            themeData.textTheme.subtitle1,
                                            color: Colors.white,
                                            fontWeight: 600),
                                      ),
                                      Container(
                                        margin: Spacing.top(4),
                                        child: Text(
                                          "Following",
                                          style: AppTheme.getTextStyle(
                                              themeData.textTheme.bodyText2,
                                              color: Colors.white,
                                              muted: true,
                                              fontWeight: 400),
                                        ),
                                      ),
                                    ],
                                  ),
                                  VerticalDivider(),
                                  Column(
                                    children: [
                                      Text(
                                        "1.2M",
                                        style: AppTheme.getTextStyle(
                                            themeData.textTheme.subtitle1,
                                            color: Colors.white,
                                            fontWeight: 600),
                                      ),
                                      Container(
                                        margin: Spacing.top(4),
                                        child: Text(
                                          "Followers",
                                          style: AppTheme.getTextStyle(
                                              themeData.textTheme.bodyText2,
                                              color: Colors.white,
                                              muted: true,
                                              fontWeight: 400),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            margin: Spacing.top(16),
                            child: Row(
                              children: [
                                Expanded(
                                  child: ElevatedButton(
                                    style: ButtonStyle(
                                        padding: MaterialStateProperty.all(Spacing.xy(16, 0))
                                    ),
                                    onPressed: () {},
                                    child: Text("Follow",
                                        style: AppTheme.getTextStyle(
                                            themeData.textTheme.bodyText2,
                                            fontWeight: 600,
                                            color: themeData
                                                .colorScheme.onPrimary)),
                                  ),
                                ),
                                InkWell(
                                  onTap: (){
                                    Navigator.push(
                                        context, MaterialPageRoute(builder: (context) => SocialProfileDetailScreen()));
                                  },
                                  child: Container(
                                    margin: Spacing.left(16),
                                    decoration: BoxDecoration(
                                      color: Colors.white.withAlpha(120),
                                      shape: BoxShape.circle,
                                    ),
                                    padding: Spacing.all(4),
                                    child:Icon(MdiIcons.arrowRight,size: MySize.size20,color: Colors.white,)
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )));
      },
    );
  }
}
