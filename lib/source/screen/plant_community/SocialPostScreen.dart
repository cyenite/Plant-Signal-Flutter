import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:plant_signal/source/utils/Generator.dart';
import 'package:plant_signal/source/utils/SizeConfig.dart';
import 'package:provider/provider.dart';

import '../../AppTheme.dart';
import '../../AppThemeNotifier.dart';

class SocialPostScreen extends StatefulWidget {
  @override
  _SocialPostScreenState createState() => _SocialPostScreenState();
}

class _SocialPostScreenState extends State<SocialPostScreen> {
  late ThemeData themeData;
  late CustomAppTheme customAppTheme;

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
              child: ListView(
                padding: Spacing.top(44),
                children: [
                  Container(
                    margin: Spacing.fromLTRB(16, 0, 16, 0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          child: ClipRRect(
                              borderRadius: BorderRadius.all(
                                  Radius.circular(MySize.size16!)),
                              child: Image(
                                image: AssetImage('assets/avatar-2.jpg'),
                                width: MySize.size32,
                                height: MySize.size32,
                              )),
                        ),
                        Container(
                          margin: Spacing.left(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Charlize Avila",
                                style: AppTheme.getTextStyle(
                                    themeData.textTheme.caption,
                                    color: themeData.colorScheme.onBackground,
                                    fontWeight: 600),
                              ),
                              Text(
                                "Surat, Gujarat",
                                style: AppTheme.getTextStyle(
                                    themeData.textTheme.caption,
                                    fontSize: 12,
                                    color: themeData.colorScheme.onBackground,
                                    muted: true,
                                    fontWeight: 500),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Container(
                            alignment: Alignment.bottomRight,
                            child: Text(
                              "12 min",
                              style: AppTheme.getTextStyle(
                                themeData.textTheme.caption,
                                color: themeData.colorScheme.onBackground,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: Spacing.top(12),
                    child: Image(
                      image: AssetImage(
                        'assets/social/post-1.jpg',
                      ),
                      height: MySize.safeHeight * 0.45,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    margin: Spacing.fromLTRB(24, 12, 24, 0),
                    child: Row(
                      children: [
                        Container(
                          child: Icon(
                            MdiIcons.heartOutline,
                            size: MySize.size20,
                            color: themeData.colorScheme.onBackground
                                .withAlpha(200),
                          ),
                        ),
                        Container(
                          margin: Spacing.left(16),
                          child: Icon(MdiIcons.commentOutline,
                              size: MySize.size20,
                              color: themeData.colorScheme.onBackground
                                  .withAlpha(200)),
                        ),
                        Container(
                          margin: Spacing.left(16),
                          child: Icon(
                            MdiIcons.shareOutline,
                            size: MySize.size20,
                            color: themeData.colorScheme.onBackground
                                .withAlpha(200),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            alignment: Alignment.bottomRight,
                            child: Text(
                              "7,327 views",
                              style: AppTheme.getTextStyle(
                                  themeData.textTheme.caption,
                                  color: themeData.colorScheme.onBackground,
                                  fontWeight: 600),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: Spacing.fromLTRB(24, 12, 24, 0),
                    child: Text(
                      Generator.getParagraphsText(
                          withEmoji: true,
                          paragraph: 2,
                          words: 18,
                          noOfNewLine: 1,
                          withHyphen: true),
                      style: AppTheme.getTextStyle(themeData.textTheme.caption,
                          color: themeData.colorScheme.onBackground),
                    ),
                  ),
                  Container(
                    margin: Spacing.fromLTRB(24, 8, 24, 0),
                    child: Text(
                      "View all 28 comments",
                      style: AppTheme.getTextStyle(themeData.textTheme.caption,
                          color: themeData.colorScheme.onBackground,
                          xMuted: true,
                          letterSpacing: -0.2),
                    ),
                  ),
                  Container(
                    margin: Spacing.fromLTRB(24, 16, 24, 0),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            style: AppTheme.getTextStyle(
                                themeData.textTheme.bodyText2,
                                color: themeData.colorScheme.onBackground,
                                fontWeight: 500,
                                fontSize: 12),
                            decoration: InputDecoration(
                                fillColor: customAppTheme.bgLayer2,
                                hintStyle: AppTheme.getTextStyle(
                                    themeData.textTheme.caption,
                                    color: themeData.colorScheme.onBackground,
                                    fontWeight: 500,
                                    muted: true,
                                    letterSpacing: 0,
                                    fontSize: 12),
                                filled: true,
                                hintText: "Comment me",
                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8)),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8)),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8)),
                                ),
                                isDense: true,
                                contentPadding: Spacing.fromLTRB(12, 8, 12, 8)),
                            textCapitalization: TextCapitalization.sentences,
                          ),
                        ),
                        Container(
                          margin: Spacing.left(16),
                          child: Text(
                            "Post",
                            style: AppTheme.getTextStyle(
                                themeData.textTheme.caption,
                                color: themeData.colorScheme.primary
                                    .withAlpha(200),
                                fontWeight: 500),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            )));
      },
    );
  }
}
