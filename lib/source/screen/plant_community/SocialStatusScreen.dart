import 'dart:async';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:plant_signal/source/utils/SizeConfig.dart';
import 'package:provider/provider.dart';

import '../../AppTheme.dart';
import '../../AppThemeNotifier.dart';

class SocialStatusScreen extends StatefulWidget {
  @override
  _SocialStatusScreenState createState() => _SocialStatusScreenState();
}

class _SocialStatusScreenState extends State<SocialStatusScreen> {
  late ThemeData themeData;
  late CustomAppTheme customAppTheme;

  Timer? _timer;
  int count = 0;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  void dispose() {
    super.dispose();
    if (_timer != null) _timer!.cancel();
  }

  void startTimer() {
    _timer = Timer.periodic(
        Duration(milliseconds: 50),
        (Timer timer) => {
              setState(() {
                if (count < 200) {
                  count++;
                } else {
                  count = 200;
                  timer.cancel();
                }
              })
            });
  }

  List<String> _simpleChoice = ["Add new", "Find me", "Contact", "Setting"];

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
              color: customAppTheme.bgLayer1,
              child: Column(
                children: [
                  Container(
                    margin: Spacing.fromLTRB(16, 0, 16, 0),
                    child: LinearProgressIndicator(
                      backgroundColor: customAppTheme.bgLayer4,
                      value: count / 200,
                      valueColor: new AlwaysStoppedAnimation<Color>(
                          themeData.colorScheme.onBackground.withAlpha(120)),
                      minHeight: 2.2,
                    ),
                  ),
                  Container(
                    margin: Spacing.fromLTRB(16, 12, 16, 0),
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.all(
                              Radius.circular(MySize.size20!)),
                          child: Image(
                            image: AssetImage('assets/avatar-2.jpg'),
                            width: MySize.size38,
                            height: MySize.size38,
                          ),
                        ),
                        Expanded(
                          child: Container(
                            margin: Spacing.left(16),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      child: Text(
                                        "marcia_hayde",
                                        style: AppTheme.getTextStyle(
                                            themeData.textTheme.bodyText2,
                                            fontWeight: 600,
                                            letterSpacing: 0,
                                            color: themeData
                                                .colorScheme.onBackground),
                                      ),
                                    ),
                                    Container(
                                      margin: Spacing.left(8),
                                      child: Text(
                                        "10 min",
                                        style: AppTheme.getTextStyle(
                                            themeData.textTheme.caption,
                                            fontWeight: 600,
                                            color: themeData
                                                .colorScheme.onBackground,
                                            xMuted: true),
                                      ),
                                    ),
                                  ],
                                ),
                                Container(
                                  margin: Spacing.top(2),
                                  child: Text(
                                    "106 views",
                                    style: AppTheme.getTextStyle(
                                        themeData.textTheme.caption,fontSize: 12,
                                        xMuted: true,
                                        fontWeight: 600),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        PopupMenuButton(
                          itemBuilder: (BuildContext context) {
                            return _simpleChoice.map((String choice) {
                              return PopupMenuItem(
                                value: choice,
                                child: Text(choice,
                                    style: TextStyle(letterSpacing: 0.15)
                                        .merge(themeData.textTheme.bodyText2!
                                            .merge(TextStyle(
                                                color: themeData.colorScheme
                                                    .onBackground,
                                                letterSpacing: 0.2)))),
                              );
                            }).toList();
                          },
                          color: themeData.backgroundColor,
                          icon: Icon(
                            MdiIcons.dotsVertical,
                            color: themeData.colorScheme.onBackground,
                          ),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: Spacing.vertical(16),
                      child: Image(
                        image:
                            AssetImage('assets/social/profile-p1.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    margin: Spacing.fromLTRB(16, 0, 16, 16),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            style: AppTheme.getTextStyle(
                                themeData.textTheme.bodyText2,
                                color: themeData.colorScheme.onBackground,
                                fontWeight: 500),
                            decoration: InputDecoration(
                                hintText: "Send message",
                                hintStyle: AppTheme.getTextStyle(
                                    themeData.textTheme.bodyText2,
                                    color: themeData.colorScheme.onBackground,
                                    fontWeight: 500),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(MySize.size8!),
                                    ),
                                    borderSide: BorderSide(
                                        color: customAppTheme.bgLayer3,
                                        width: 1)),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(MySize.size8!),
                                    ),
                                    borderSide: BorderSide(
                                        color: customAppTheme.bgLayer3,
                                        width: 1)),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(MySize.size8!),
                                    ),
                                    borderSide: BorderSide(
                                        color: customAppTheme.bgLayer3,
                                        width: 1)),
                                fillColor: customAppTheme.bgLayer2,
                                filled: true,
                                isDense: true,
                                contentPadding:
                                    Spacing.fromLTRB(16, 12, 16, 12)),
                            textInputAction: TextInputAction.search,
                            textCapitalization: TextCapitalization.sentences,
                          ),
                        ),
                        Container(
                          margin: Spacing.left(16),
                          child: Transform.rotate(
                              angle: -pi / 8,
                              child: Icon(
                                MdiIcons.sendOutline,
                                color: themeData.colorScheme.onBackground,
                                size: MySize.size22,
                              )),
                        )
                      ],
                    ),
                  )
                ],
              ),
            )));
      },
    );
  }
}
