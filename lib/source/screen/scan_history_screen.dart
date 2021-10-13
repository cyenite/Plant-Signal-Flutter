import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:plant_signal/source/component/WATransactionComponent.dart';
import 'package:plant_signal/source/controllers/user_controller.dart';
import 'package:plant_signal/source/model/WalletAppModel.dart';
import 'package:plant_signal/source/model/session.dart';
import 'package:plant_signal/source/utils/WAColors.dart';
import 'package:plant_signal/source/utils/WADataGenerator.dart';
import 'package:plant_signal/source/utils/WAWidgets.dart';

class ScanHistoryScreen extends StatefulWidget {
  static String tag = '/ScanHistoryScreen';

  @override
  ScanHistoryScreenState createState() => ScanHistoryScreenState();
}

class ScanHistoryScreenState extends State<ScanHistoryScreen> {
  List<WABillPayModel> billPayList = waBillPayList();
  List<WAOrganizationModel> organizationList = waOrganizationList();
  String selectedCategory = "Successful";

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    //
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Text(
            'Scan History',
            style: boldTextStyle(color: Colors.black, size: 20),
          ),
          leading: Container(
            margin: EdgeInsets.all(8),
            decoration: boxDecorationWithRoundedCorners(
              backgroundColor: Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.grey.withOpacity(0.2)),
            ),
            child: Icon(Icons.arrow_back),
          ).onTap(() {
            finish(context);
          }),
          centerTitle: true,
          elevation: 0.0,
          brightness: Brightness.dark,
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.only(top: 40),
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('images/walletApp/wa_bg.jpg'),
                  fit: BoxFit.cover)),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('', style: boldTextStyle(size: 20)),
                    Container(
                      width: 150,
                      height: 50,
                      child: DropdownButtonFormField(
                        value: scanStatusList[0],
                        isExpanded: true,
                        decoration: waInputDecoration(
                            bgColor: Colors.white,
                            padding: EdgeInsets.symmetric(horizontal: 8)),
                        items: scanStatusList.map((String? value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value!, style: boldTextStyle(size: 14)),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            selectedCategory = value.toString();
                          });
                        },
                      ),
                    ),
                  ],
                ),
                16.height,
                SingleChildScrollView(
                  child: Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child: StreamBuilder(
                      stream: FirebaseFirestore.instance
                          .collection("users")
                          .doc(Get.find<UserController>().user.id)
                          .collection("sessions")
                          .where("status", isEqualTo: selectedCategory)
                          .orderBy("time", descending: true)
                          .snapshots(),
                      builder: (BuildContext context,
                          AsyncSnapshot<QuerySnapshot> snapshot) {
                        if (snapshot.hasData && snapshot.data != null) {
                          final sessions = snapshot.data!.docs;
                          return ListView.builder(
                            itemCount: sessions.length,
                            itemBuilder: (BuildContext context, int index) {
                              final session = sessions[index].data();
                              print("$session");
                              return WATransactionComponent(
                                session: Session(
                                    mode: session['mode'],
                                    status: session['status'],
                                    time: session['time'].toString()),
                              );
                            },
                          );
                        } else {
                          return Center(
                            child: CircularProgressIndicator(
                              backgroundColor: WAPrimaryColor,
                            ),
                          );
                        }
                      },
                    ),
                  ),
                ),
              ],
            ).paddingAll(16),
          ),
        ),
      ),
    );
  }
}
