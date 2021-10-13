import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:plant_signal/source/utils/SizeConfig.dart';
import 'package:provider/provider.dart';
import '../../AppTheme.dart';
import '../../AppThemeNotifier.dart';
import 'SocialRelationshipScreen.dart';

class SocialProfileDetailScreen extends StatefulWidget {
  @override
  _SocialProfileDetailScreenState createState() => _SocialProfileDetailScreenState();
}

class _SocialProfileDetailScreenState extends State<SocialProfileDetailScreen> {
  late ThemeData themeData;
  late CustomAppTheme customAppTheme;

  List<String> _imageList = [
    'assets/all/all-1.jpg',
    'assets/all/all-2.jpg',
    'assets/all/all-3.jpg',
    'assets/all/all-4.jpg',
    'assets/all/all-5.jpg',
    'assets/all/all-6.jpg',
    'assets/all/all-7.jpg',
    'assets/all/all-8.jpg',
    'assets/all/all-9.jpg',
    'assets/all/all-10.jpg',
    'assets/all/all-11.jpg',
    'assets/all/all-12.jpg',
    'assets/all/all-13.jpg',
    'assets/all/all-14.jpg',
  ];

  _generateGridItems() {
    List<Widget> list = [];
    int size = 12;
    for (int i = 0; i < size; i++) {
      if (i < size-1) {
        list.add(Container(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(MySize.size8!))
          ),
          child: Image(image: AssetImage(_imageList[i % 14]), fit: BoxFit.fill),
        ));
      } else {
        list.add(InkWell(
          splashColor: themeData.colorScheme.primary.withAlpha(100),
          highlightColor:  themeData.colorScheme.primary.withAlpha(28),
          onTap: (){

          },
          child: Container(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            decoration: BoxDecoration(
                color: themeData.colorScheme.primary.withAlpha(28),
                borderRadius: BorderRadius.all(Radius.circular(MySize.size8!))
            ),

            child: Center(
              child: Text(
                "View All",
                style: AppTheme.getTextStyle(themeData.textTheme.subtitle2,
                    color: themeData.colorScheme.primary,
                    fontWeight: 600),
              ),
            ),
          ),
        ));
      }
    }
    return list;
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

                appBar: AppBar(
                  backgroundColor: customAppTheme.bgLayer1,
                  elevation: 0,
                  leading: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      MdiIcons.chevronLeft,
                      size: MySize.size24,
                      color: themeData.colorScheme.onBackground,
                    ),
                  ),
                ),
                body: Container(
                  color: customAppTheme.bgLayer1,
                  child: ListView(
                    padding: Spacing.zero,
                    children: [
                      Container(
                        margin: Spacing.fromLTRB(24, 0, 24, 0),
                        child: Row(
                          children: [
                            Container(
                              child: ClipRRect(
                                borderRadius: BorderRadius.all(
                                    Radius.circular(MySize.size30!)),
                                child: Image(
                                  image: AssetImage(
                                      'assets/avatar-3.jpg'),
                                  width: MySize.size60,
                                  height: MySize.size60,
                                ),
                              ),
                            ),
                            Container(
                              margin: Spacing.left(16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    child: Text(
                                      "Jedd Kouma",
                                      style: AppTheme.getTextStyle(
                                          themeData.textTheme.bodyText1,
                                          color: themeData
                                              .colorScheme.onBackground,
                                          letterSpacing: 0,
                                          fontWeight: 600),
                                    ),
                                  ),
                                  Container(
                                    child: Text(
                                      "April 12th",
                                      style: AppTheme.getTextStyle(
                                          themeData.textTheme.bodyText2,
                                          color: themeData
                                              .colorScheme.onBackground,
                                          letterSpacing: 0,
                                          muted: true),
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        margin: Spacing.fromLTRB(24, 16, 24, 0),
                        child: Row(
                          children: [
                            Container(
                              child: ElevatedButton(

                                onPressed: () {
                                  Navigator.push(
                                      context, MaterialPageRoute(builder: (context) => SocialRelationshipScreen()));
                                },
                                child: Text("Connect",
                                    style: AppTheme.getTextStyle(
                                        themeData.textTheme.bodyText2,
                                        fontWeight: 500,
                                        color:
                                            themeData.colorScheme.onPrimary)),
                                style: ButtonStyle(
                                    padding: MaterialStateProperty.all(Spacing.xy(16, 0))
                                ),
                              ),
                            ),
                            Container(
                              margin: Spacing.left(24),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "105k",
                                    style: AppTheme.getTextStyle(
                                        themeData.textTheme.subtitle2,
                                        color:
                                            themeData.colorScheme.onBackground,
                                        fontWeight: 600),
                                  ),
                                  Text(
                                    "Followers",
                                    style: AppTheme.getTextStyle(
                                        themeData.textTheme.caption,
                                        color:
                                            themeData.colorScheme.onBackground,
                                        muted: true),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: Spacing.left(24),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "45",
                                    style: AppTheme.getTextStyle(
                                        themeData.textTheme.subtitle2,
                                        color:
                                            themeData.colorScheme.onBackground,
                                        letterSpacing: 0,
                                        fontWeight: 600),
                                  ),
                                  Text(
                                    "Following",
                                    style: AppTheme.getTextStyle(
                                        themeData.textTheme.caption,
                                        color:
                                            themeData.colorScheme.onBackground,
                                        muted: true,
                                        letterSpacing: 0),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: Spacing.fromLTRB(24, 24, 0, 0),
                        child: Text(
                          "Posts",
                          style: AppTheme.getTextStyle(
                              themeData.textTheme.subtitle1,
                              color: themeData.colorScheme.onBackground,
                              fontWeight: 700),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: MySize.size8!),
                        child: GridView.count(
                            physics: ClampingScrollPhysics(),
                            shrinkWrap: true,
                            padding: Spacing.fromLTRB(24, 12, 24, 24),
                            crossAxisCount: 2,
                            mainAxisSpacing: MySize.size16!,
                            crossAxisSpacing: MySize.size16!,
                            children: _generateGridItems()),
                      )
                    ],
                  ),
                )));
      },
    );
  }
}
