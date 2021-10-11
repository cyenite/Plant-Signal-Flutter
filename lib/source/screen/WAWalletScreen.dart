import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:plant_signal/source/component/WACardComponent.dart';
import 'package:plant_signal/source/component/WATransactionComponent.dart';
import 'package:plant_signal/source/model/WalletAppModel.dart';
import 'package:plant_signal/source/utils/WAColors.dart';
import 'package:plant_signal/source/utils/WADataGenerator.dart';

class WAWalletScreen extends StatefulWidget {
  static String tag = '/WAWalletScreen';

  @override
  WAWalletScreenState createState() => WAWalletScreenState();
}

class WAWalletScreenState extends State<WAWalletScreen> {
  List<WACardModel> walletList = waCardList();
  List<WATransactionModel> transactionList = waTransactionList();

  PageController? pageController;
  int currentPosition = 1;

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    pageController =
        PageController(initialPage: currentPosition, viewportFraction: 0.8);
  }

  @override
  void dispose() {
    super.dispose();
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
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Text('Global Statistics',
              style: boldTextStyle(color: Colors.black, size: 20)),
          centerTitle: true,
          automaticallyImplyLeading: false,
          elevation: 0.0,
          brightness: Brightness.dark,
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.only(top: 70),
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('images/walletApp/wa_bg.jpg'),
                  fit: BoxFit.cover)),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 200,
                  width: MediaQuery.of(context).size.width,
                  child: PageView(
                    controller: pageController,
                    children: walletList.map((WACardModel item) {
                      return WACardComponent(cardModel: item)
                          .paddingOnly(right: 16);
                    }).toList(),
                    onPageChanged: (index) {
                      setState(() {
                        currentPosition = index;
                      });
                    },
                  ),
                ),
                8.height,
                DotsIndicator(
                  dotsCount: 3,
                  position: currentPosition.toDouble(),
                  decorator: DotsDecorator(
                      size: Size.square(9.0),
                      activeSize: Size(18.0, 9.0),
                      color: grey,
                      activeColor: WAPrimaryColor,
                      activeShape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0))),
                ),
                30.height,
                Align(
                        alignment: Alignment.topLeft,
                        child: Text('Transactions',
                            style: boldTextStyle(size: 20)))
                    .paddingLeft(16),
                16.height,
                Column(
                  children: transactionList.map((transactionItem) {
                    return WATransactionComponent(
                        transactionModel: transactionItem);
                  }).toList(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
