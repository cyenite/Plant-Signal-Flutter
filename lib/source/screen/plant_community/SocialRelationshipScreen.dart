import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:plant_signal/source/utils/SizeConfig.dart';
import 'package:provider/provider.dart';
import '../../AppTheme.dart';
import '../../AppThemeNotifier.dart';

class SocialRelationshipScreen extends StatefulWidget {
  @override
  _SocialRelationshipScreenState createState() =>
      _SocialRelationshipScreenState();
}

class _SocialRelationshipScreenState extends State<SocialRelationshipScreen> {
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
              padding: Spacing.top(48),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: Center(
                      child: Text(
                        "Choose Relationship",
                        style: AppTheme.getTextStyle(
                            themeData.textTheme.headline5,
                            color: themeData.colorScheme.onBackground,
                            fontWeight: 600),
                      ),
                    ),
                  ),
                  Container(
                    margin: Spacing.top(40),
                    height: MySize.getScaledSizeHeight(476),
                    child: Stack(
                      children: [
                        Positioned(
                            top: MySize.getScaledSizeHeight(0),
                            left: MySize.getScaledSizeWidth(42),
                            child: singleRelation(
                                background: Colors.pinkAccent,
                                text: "Family",
                                onBG: Colors.white)),
                        Positioned(
                            top: MySize.getScaledSizeHeight(172),
                            left: MySize.getScaledSizeWidth(42),
                            child: singleRelation(
                                background: Colors.blue,
                                text: "Friend",
                                onBG: Colors.white)),
                        Positioned(
                            top: MySize.getScaledSizeHeight(344),
                            left: MySize.getScaledSizeWidth(42),
                            child: singleRelation(
                                background: Colors.purpleAccent,
                                text: "Other",
                                onBG: Colors.white)),
                        Positioned(
                            top: MySize.getScaledSizeHeight(86),
                            right: MySize.getScaledSizeWidth(42),
                            child: singleRelation(
                                background: Colors.teal,
                                text: "Close Friend",
                                onBG: Colors.white)),
                        Positioned(
                            top: MySize.getScaledSizeHeight(264),
                            right: MySize.getScaledSizeWidth(42),
                            child: singleRelation(
                                background: Colors.orangeAccent,
                                text: "Best",
                                onBG: Colors.white)),
                      ],
                    ),
                  )
                ],
              ),
            )));
      },
    );
  }

  Widget singleRelation(
      {Color background = Colors.black,
      Color onBG = Colors.white,
      String text = "Text"}) {
    return InkWell(
      onTap: (){
        Navigator.pop(context);
      },
      child: Container(
        width: MySize.getScaledSizeHeight(132),
        height: MySize.getScaledSizeHeight(132),
        decoration: BoxDecoration(
            color: background, shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
                color: background.withAlpha(50),
                blurRadius: MySize.size5!,
                spreadRadius: MySize.size2,
                offset: Offset(0,MySize.size5!)
            ),
            BoxShadow(
              color: background.withAlpha(60),
              blurRadius: MySize.size16!,
              spreadRadius: MySize.size2,
              offset: Offset(0,MySize.size5!)
            )
          ]
        ),
        child: Center(
          child: Text(
            text,
            style: AppTheme.getTextStyle(themeData.textTheme.subtitle1,
                color: onBG, fontWeight: 600),
          ),
        ),
      ),
    );
  }
}
