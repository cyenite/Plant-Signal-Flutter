import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:plant_signal/source/component/WACardComponent.dart';
import 'package:plant_signal/source/component/WAOperationComponent.dart';
import 'package:plant_signal/source/component/WATransactionComponent.dart';
import 'package:plant_signal/source/controllers/user_controller.dart';
import 'package:plant_signal/source/model/WalletAppModel.dart';
import 'package:plant_signal/source/model/session.dart';
import 'package:plant_signal/source/screen/scan_history_screen.dart';
import 'package:plant_signal/source/screen/supported_crops_screen.dart';
import 'package:plant_signal/source/utils/WADataGenerator.dart';

class HomeScreen extends StatefulWidget {
  static String tag = '/HomeScreen';

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  List<WACardModel> cardList = waCardList();
  List<WAOperationsModel> operationsList = waOperationList();
  List<WATransactionModel> transactionList = waTransactionList();

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
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('images/walletApp/wa_bg.jpg'),
              fit: BoxFit.cover),
        ),
        child: Container(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                50.height,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      decoration: boxDecorationWithRoundedCorners(
                        backgroundColor: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.grey.withOpacity(0.2)),
                      ),
                      child: Icon(Icons.person),
                    ),
                    Container(
                      width: 40,
                      height: 40,
                      decoration: boxDecorationWithRoundedCorners(
                        backgroundColor: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.grey.withOpacity(0.2)),
                      ),
                      alignment: Alignment.center,
                      child: Stack(
                        alignment: AlignmentDirectional.topEnd,
                        children: [
                          Icon(Icons.add_alert, color: Colors.grey),
                          Positioned(
                            top: 3,
                            right: 3,
                            child: Container(
                              width: 8,
                              height: 8,
                              decoration: BoxDecoration(
                                color: Color(0xFFFF7426),
                                shape: BoxShape.circle,
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ).paddingOnly(left: 16, right: 16, bottom: 16),
                Text('Hello ${Get.find<UserController>().user.name}',
                        style: secondaryTextStyle())
                    .paddingOnly(left: 16, right: 16),
                Text('Welcome Back', style: boldTextStyle(size: 20))
                    .paddingOnly(left: 16, right: 16),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Wrap(
                    direction: Axis.horizontal,
                    spacing: 16,
                    children: cardList.map((cardItem) {
                      return WACardComponent(cardModel: cardItem);
                    }).toList(),
                  ).paddingAll(16),
                ),
                16.height,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Supported Plants', style: boldTextStyle(size: 20)),
                    Icon(Icons.play_arrow, color: Colors.grey).onTap(() {
                      SupportedCropsScreen().launch(context);
                    }),
                  ],
                ).paddingOnly(left: 16, right: 16),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Wrap(
                    direction: Axis.horizontal,
                    spacing: 16,
                    children: operationsList.map((operationModel) {
                      return WAOperationComponent(itemModel: operationModel)
                          .onTap(() {
                        operationModel.widget != null
                            ? operationModel.widget.launch(context)
                            : toast(operationModel.title);
                      });
                    }).toList(),
                  ).paddingAll(16),
                ),
                16.height,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Your Activity', style: boldTextStyle(size: 20)),
                    GestureDetector(
                        onTap: () {
                          Get.to(ScanHistoryScreen());
                        },
                        child: Icon(Icons.play_arrow, color: Colors.grey)),
                  ],
                ).paddingOnly(left: 16, right: 16),
                16.height,
                /* Column(
                  children: transactionList.map((transactionItem) {
                    return WATransactionComponent(
                        transactionModel: transactionItem);
                  }).toList(),
                ),*/
                SingleChildScrollView(
                  child: Container(
                    height: 500,
                    width: MediaQuery.of(context).size.width,
                    child: StreamBuilder(
                      stream: FirebaseFirestore.instance
                          .collection("users")
                          .doc(Get.find<UserController>().user.id)
                          .collection("sessions")
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
                            child: CircularProgressIndicator(),
                          );
                        }
                      },
                    ),
                  ),
                ),
                /*GetX<UserController>(
                  init: Get.put<UserController>(UserController()),
                  builder: (UserController userController) {
                    return Expanded(
                      child: ListView.builder(
                        itemCount: userController.sessions.length,
                        itemBuilder: (_, index) {
                          return WATransactionComponent(
                            session: userController.sessions[index],
                          );
                        },
                      ),
                    );
                  },
                )*/
              ],
            ),
          ),
        ),
      ),
    );
  }
}
