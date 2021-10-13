import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:plant_signal/source/utils/WAColors.dart';
import 'package:plant_signal/source/utils/WAWidgets.dart';

class StatisticsComponent extends StatefulWidget {
  static String tag = '/StatisticsComponent';

  @override
  StatisticsComponentState createState() => StatisticsComponentState();
}

class StatisticsComponentState extends State<StatisticsComponent> {
  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    //
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection("scans")
              .where("status", isEqualTo: "Successful")
              .snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasData && snapshot.data != null) {
              final sessions = snapshot.data!.docs;
              return waStatisticsWidget(
                      title: "Successful",
                      amount: sessions.length.toString(),
                      image: 'images/walletApp/wa_up_right.png',
                      color: Color(0xFF6C56F9))
                  .expand();
            } else {
              return Center(
                child: CircularProgressIndicator(
                  backgroundColor: WAPrimaryColor,
                ),
              );
            }
          },
        ),
        16.width,
        StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection("scans")
              .where("status", isEqualTo: "Failed")
              .snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasData && snapshot.data != null) {
              final sessions = snapshot.data!.docs;
              return waStatisticsWidget(
                      title: "Unsuccessful",
                      amount: sessions.length.toString(),
                      image: 'images/walletApp/wa_down_left.png',
                      color: Color(0xFFFF7426))
                  .expand();
            } else {
              return Center(
                child: CircularProgressIndicator(
                  backgroundColor: WAPrimaryColor,
                ),
              );
            }
          },
        ),
      ],
    ).paddingOnly(left: 16, right: 16);
  }
}
