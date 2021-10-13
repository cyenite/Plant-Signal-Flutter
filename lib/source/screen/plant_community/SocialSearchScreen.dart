import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:plant_signal/main/utils/shimmer/shimmer.dart';
import 'package:plant_signal/source/utils/SizeConfig.dart';
import 'package:provider/provider.dart';

import '../../AppTheme.dart';
import '../../AppThemeNotifier.dart';
import 'SocialProfileScreen.dart';

class SocialSearchScreen extends StatefulWidget {
  @override
  _SocialSearchScreenState createState() => _SocialSearchScreenState();
}

class _SocialSearchScreenState extends State<SocialSearchScreen> {
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
                      margin: Spacing.fromLTRB(24, 0, 24, 0),
                      child: TextFormField(
                        style: AppTheme.getTextStyle(
                            themeData.textTheme.bodyText2,
                            letterSpacing: 0,
                            color: themeData.colorScheme.onBackground,
                            fontWeight: 500),
                        decoration: InputDecoration(
                            hintText: "Search messages",
                            hintStyle: AppTheme.getTextStyle(
                                themeData.textTheme.bodyText2,
                                letterSpacing: 0,
                                color: themeData.colorScheme.onBackground,
                                fontWeight: 500),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(MySize.size8!),
                                ),
                                borderSide: BorderSide.none),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(MySize.size8!),
                                ),
                                borderSide: BorderSide.none),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(MySize.size8!),
                                ),
                                borderSide: BorderSide.none),
                            fillColor: customAppTheme.bgLayer2,
                            filled: true,
                            isDense: true,
                            prefixIcon: Icon(
                              MdiIcons.magnify,
                              size: MySize.size16,
                              color: themeData.colorScheme.onBackground
                                  .withAlpha(220),
                            )),
                        textInputAction: TextInputAction.search,
                        textCapitalization: TextCapitalization.sentences,
                      ),
                    ),
                    Container(
                      margin: Spacing.fromLTRB(24, 16, 24, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Recent",
                            style: AppTheme.getTextStyle(
                                themeData.textTheme.bodyText2,
                                color: themeData.colorScheme.onBackground,
                                fontWeight: 700),
                          ),
                          Text(
                            "Clear",
                            style: AppTheme.getTextStyle(
                                themeData.textTheme.bodyText2,
                                color: themeData.colorScheme.primary,
                                fontWeight: 600),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: Spacing.fromLTRB(0, 12, 0, 0),
                      /*child: Row(
                            children: [
                              Container(
                                margin: Spacing.left(24),
                                child: searchRecentItem(
                                  image: 'assets/avatar-1.jpg',
                                  name: 'Andrei',
                                  isActive: true,
                                ),
                              ),
                              Container(
                                margin: Spacing.left(16),
                                child: searchRecentItem(
                                  image: 'assets/avatar-2.jpg',
                                  name: 'Ratcliffe',
                                  isActive: true,
                                ),
                              ),
                              Container(
                                margin: Spacing.left(16),
                                child: searchRecentItem(
                                  image: 'assets/avatar-3.jpg',
                                  name: 'Cade',
                                ),
                              ),
                              Container(
                                margin: Spacing.fromLTRB(16, 0, 24, 0),
                                child: searchRecentItem(
                                  image: 'assets/avatar-4.jpg',
                                  name: 'Hussein',
                                ),
                              ),
                            ],
                          ),*/
                    ),
                    Container(
                      margin: Spacing.fromLTRB(24, 16, 24, 0),
                      child: Text(
                        "Result",
                        style: AppTheme.getTextStyle(
                            themeData.textTheme.bodyText2,
                            color: themeData.colorScheme.onBackground,
                            fontWeight: 700),
                      ),
                    ),
                    Container(
                      margin: Spacing.fromLTRB(24, 0, 24, 0),
                      child: Column(
                        children: [
                          searchResultItem(
                              index: 4,
                              image: 'assets/avatar-5.jpg',
                              name: 'Plant Signal',
                              status: "@admin"),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )));
      },
    );
  }

  Widget searchResultItem(
      {required String image,
      required int index,
      required String name,
      required String status,
      bool isActive = false}) {
    return Container(
      margin: Spacing.top(16),
      child: InkWell(
        /*onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => SocialProfileScreen()));
        },*/
        child: Row(
          children: <Widget>[
            Stack(
              children: [
                ClipRRect(
                  borderRadius:
                      BorderRadius.all(Radius.circular(MySize.size24!)),
                  child: Image(
                    image: AssetImage(image),
                    height: MySize.size44,
                    width: MySize.size44,
                    fit: BoxFit.cover,
                  ),
                ),
                isActive
                    ? Positioned(
                        bottom: 1,
                        right: 1,
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: customAppTheme.bgLayer1, width: 2),
                              shape: BoxShape.circle),
                          child: Container(
                            width: MySize.size8,
                            height: MySize.size8,
                            decoration: BoxDecoration(
                                color: customAppTheme.colorSuccess,
                                shape: BoxShape.circle),
                          ),
                        ),
                      )
                    : Container()
              ],
            ),
            Expanded(
              child: Container(
                margin: Spacing.left(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      name,
                      style: AppTheme.getTextStyle(
                          themeData.textTheme.bodyText1,
                          color: themeData.colorScheme.onBackground,
                          fontWeight: 600),
                    ),
                    Text(
                      status,
                      style: AppTheme.getTextStyle(themeData.textTheme.caption,
                          fontSize: 12,
                          color:
                              themeData.colorScheme.onBackground.withAlpha(160),
                          fontWeight: 600),
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
            )
          ],
        ),
      ),
    );
  }

  Widget searchRecentItem(
      {required String image, required String name, bool isActive = false}) {
    return Container(
      child: InkWell(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => SocialProfileScreen()));
        },
        child: Column(
          children: <Widget>[
            Stack(
              children: [
                ClipRRect(
                  borderRadius:
                      BorderRadius.all(Radius.circular(MySize.size24!)),
                  child: Image(
                    image: AssetImage(image),
                    height: MySize.size44,
                    width: MySize.size44,
                    fit: BoxFit.cover,
                  ),
                ),
                isActive
                    ? Positioned(
                        bottom: 1,
                        right: 1,
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: customAppTheme.bgLayer1, width: 2),
                              shape: BoxShape.circle),
                          child: Container(
                            width: MySize.size8,
                            height: MySize.size8,
                            decoration: BoxDecoration(
                                color: customAppTheme.colorSuccess,
                                shape: BoxShape.circle),
                          ),
                        ),
                      )
                    : Container()
              ],
            ),
            Container(
              margin: Spacing.top(8),
              child: Text(
                name,
                style: AppTheme.getTextStyle(themeData.textTheme.caption,
                    letterSpacing: 0,
                    color: themeData.colorScheme.onBackground,
                    muted: true,
                    fontWeight: 500),
              ),
            )
          ],
        ),
      ),
    );
  }
}
