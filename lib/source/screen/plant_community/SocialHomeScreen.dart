import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:plant_signal/main/utils/shimmer/shimmer.dart';
import 'package:plant_signal/source/utils/Generator.dart';
import 'package:plant_signal/source/utils/SizeConfig.dart';
import 'package:provider/provider.dart';

import '../../AppTheme.dart';
import '../../AppThemeNotifier.dart';
import 'SocialStatusScreen.dart';

class SocialHomeScreen extends StatefulWidget {
  @override
  _SocialHomeScreenState createState() => _SocialHomeScreenState();
}

class _SocialHomeScreenState extends State<SocialHomeScreen> {
  late ThemeData themeData;
  late CustomAppTheme customAppTheme;

  List<String> _simpleChoice = [
    "Report",
    "Turn on notification",
    "Copy Link",
    "Share to ...",
    "Unfollow",
    "Mute"
  ];

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
                  title: Text(
                    'Plant Signal Community (Coming Soon)',
                    style: boldTextStyle(color: Colors.black, size: 20),
                  ),
                  centerTitle: true,
                  automaticallyImplyLeading: false,
                  elevation: 0.0,
                ),
                body: Container(
                  color: customAppTheme.bgLayer1,
                  child: ListView(
                    padding: Spacing.fromLTRB(0, 0, 0, 16),
                    children: [
                      /* Container(
                    child: SingleChildScrollView(
                      physics: ClampingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          Container(
                            margin: Spacing.fromLTRB(16, 0, 6, 0),
                            child: Stack(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(MySize.size26!)),
                                  child: Image(
                                    image: AssetImage('assets/avatar-4.jpg'),
                                    height: MySize.size52,
                                    width: MySize.size52,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Positioned(
                                  bottom: -1,
                                  right: -1,
                                  child: Container(
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: customAppTheme.bgLayer1,
                                            width: 1.4),
                                        shape: BoxShape.circle),
                                    child: Container(
                                      padding: Spacing.all(2),
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: themeData.colorScheme.primary,
                                      ),
                                      child: Icon(
                                        MdiIcons.plus,
                                        size: MySize.size12,
                                        color: themeData.colorScheme.onPrimary,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          statusWidget(
                              image: 'assets/avatar-3.jpg',
                              type: 2,
                              isLive: true),
                          statusWidget(image: 'assets/avatar-1.jpg', type: 1),
                          statusWidget(image: 'assets/avatar-2.jpg', type: 1),
                          statusWidget(image: 'assets/avatar-5.jpg', type: 2),
                          statusWidget(
                              image: 'assets/avatar.jpg',
                              type: 2,
                              isMuted: true),
                          statusWidget(
                              image: 'assets/avatar-3.jpg',
                              type: 2,
                              isMuted: true),
                        ],
                      ),
                    ),
                  ),*/

                      Container(
                        margin: Spacing.top(8),
                        child: Divider(
                          height: 0,
                        ),
                      ),
                      Container(
                        child: Column(
                          children: [
                            Shimmer.fromColors(
                              highlightColor: Colors.white,
                              baseColor: Colors.grey,
                              child: postWidget(
                                  profileImage: 'assets/avatar-2.jpg',
                                  name: "Community",
                                  status: "Coming soon",
                                  postImage: 'assets/profile-banner.jpg',
                                  likes: "0 Likes",
                                  time: 'now'),
                            ),
                            Divider(
                              height: 0,
                            ),
                            Shimmer.fromColors(
                              highlightColor: Colors.white,
                              baseColor: Colors.grey,
                              child: postWidget(
                                  profileImage: 'assets/avatar-2.jpg',
                                  name: "Community",
                                  status: "Coming soon",
                                  postImage: 'assets/profile-banner.jpg',
                                  likes: "0 Likes",
                                  time: '1hr ago'),
                            ),
                            Divider(
                              height: 0,
                            ),
                            Shimmer.fromColors(
                              highlightColor: Colors.white,
                              baseColor: Colors.grey,
                              child: Shimmer.fromColors(
                                highlightColor: Colors.white,
                                baseColor: Colors.grey,
                                child: postWidget(
                                    profileImage: 'assets/avatar-2.jpg',
                                    name: "Community",
                                    status: "Coming soon",
                                    postImage: 'assets/profile-banner.jpg',
                                    likes: "0 Likes",
                                    time: 'Yesterday'),
                              ),
                            ),
                            Divider(
                              height: 0,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(
                          top: MySize.size16!,
                        ),
                        child: Center(
                          child: Container(
                            width: MySize.size16,
                            height: MySize.size16,
                            child: CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation<Color>(
                                    themeData.colorScheme.primary),
                                strokeWidth: 1.4),
                          ),
                        ),
                      )
                    ],
                  ),
                )));
      },
    );
  }

  Widget statusWidget(
      {required String image,
      int type = 1,
      bool isLive = false,
      bool isMuted = false}) {
    return Opacity(
      opacity: isMuted ? 0.4 : 1,
      child: InkWell(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => SocialStatusScreen()));
        },
        child: Container(
          padding: Spacing.horizontal(6),
          child: Stack(
            children: [
              Container(
                padding: Spacing.all(2),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                        color: type == 2 ? customAppTheme.bgLayer4 : Colors.red,
                        width: 1.6)),
                child: ClipRRect(
                  borderRadius:
                      BorderRadius.all(Radius.circular(MySize.size26!)),
                  child: Image(
                    image: AssetImage(image),
                    height: MySize.size50,
                    width: MySize.size50,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              isLive
                  ? Positioned(
                      right: 0,
                      child: Container(
                        padding: Spacing.fromLTRB(4, 2, 4, 2),
                        decoration: BoxDecoration(
                            color: Colors.redAccent,
                            borderRadius: BorderRadius.all(
                                Radius.circular(MySize.size8!))),
                        child: Text(
                          "Live",
                          style: AppTheme.getTextStyle(
                              themeData.textTheme.caption,
                              color: Colors.white,
                              fontSize: 9),
                        ),
                      ),
                    )
                  : Container()
            ],
          ),
        ),
      ),
    );
  }

  Widget postWidget(
      {required String profileImage,
      required String name,
      required String status,
      required String postImage,
      required String likes,
      String? comments,
      required String time}) {
    return InkWell(
      /*onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => SocialPostScreen()));
      },*/
      child: Container(
        margin: Spacing.fromLTRB(0, 12, 0, 16),
        child: Column(
          children: [
            Container(
              margin: Spacing.fromLTRB(16, 0, 16, 0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  InkWell(
                    /*onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SocialProfileScreen()));
                    },*/
                    child: Container(
                      child: ClipRRect(
                          borderRadius:
                              BorderRadius.all(Radius.circular(MySize.size16!)),
                          child: Image(
                            image: AssetImage(profileImage),
                            width: MySize.size32,
                            height: MySize.size32,
                          )),
                    ),
                  ),
                  Container(
                    margin: Spacing.left(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          name,
                          style: AppTheme.getTextStyle(
                              themeData.textTheme.caption,
                              color: themeData.colorScheme.onBackground,
                              fontWeight: 600),
                        ),
                        Text(
                          status,
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
                        time,
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
                  postImage,
                ),
                height: MySize.getScaledSizeHeight(240),
                width: MySize.safeWidth,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              margin: Spacing.fromLTRB(16, 0, 16, 0),
              child: Row(
                children: [
                  Generator.buildOverlaysProfile(
                      images: [
                        'assets/avatar-3.jpg',
                        'assets/avatar-5.jpg',
                        'assets/avatar-2.jpg',
                      ],
                      enabledOverlayBorder: true,
                      overlayBorderColor: customAppTheme.bgLayer1,
                      overlayBorderThickness: 1.7,
                      leftFraction: 0.72,
                      size: MySize.size24!),
                  Container(
                    margin: Spacing.left(4),
                    child: Text(
                      likes,
                      style: AppTheme.getTextStyle(themeData.textTheme.caption,
                          letterSpacing: 0,
                          color: themeData.colorScheme.onBackground),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      alignment: Alignment.centerRight,
                      child: PopupMenuButton(
                        itemBuilder: (BuildContext context) {
                          return _simpleChoice.map((String choice) {
                            return PopupMenuItem(
                              value: choice,
                              height: MySize.size36,
                              child: Text(choice,
                                  style: AppTheme.getTextStyle(
                                      themeData.textTheme.bodyText2,
                                      color:
                                          themeData.colorScheme.onBackground)),
                            );
                          }).toList();
                        },
                        icon: Icon(
                          MdiIcons.dotsVertical,
                          color: themeData.colorScheme.onBackground,
                          size: MySize.size20,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: Spacing.fromLTRB(16, 0, 16, 0),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "User 1",
                        style: AppTheme.getTextStyle(
                            themeData.textTheme.bodyText2,
                            color: themeData.colorScheme.onBackground,
                            fontWeight: 700),
                      ),
                      Expanded(
                        child: Container(
                          margin: Spacing.left(8),
                          child: Text(
                            Generator.getDummyText(5, withEmoji: true),
                            style: AppTheme.getTextStyle(
                                themeData.textTheme.caption,
                                color: themeData.colorScheme.onBackground),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      )
                    ],
                  ),
                  Container(
                    margin: Spacing.top(4),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          "User 2",
                          style: AppTheme.getTextStyle(
                              themeData.textTheme.bodyText2,
                              color: themeData.colorScheme.onBackground,
                              fontWeight: 700),
                        ),
                        Expanded(
                          child: Container(
                            margin: Spacing.left(8),
                            child: Text(
                              Generator.getDummyText(5, withEmoji: true),
                              style: AppTheme.getTextStyle(
                                  themeData.textTheme.caption,
                                  color: themeData.colorScheme.onBackground),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
