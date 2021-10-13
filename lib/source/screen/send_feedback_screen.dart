import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:plant_signal/source/component/WAMoneyTransferCompeteDialog.dart';
import 'package:plant_signal/source/component/WASendViaComponent.dart';
import 'package:plant_signal/source/controllers/db_controller.dart';
import 'package:plant_signal/source/model/WalletAppModel.dart';
import 'package:plant_signal/source/utils/WAColors.dart';
import 'package:plant_signal/source/utils/WADataGenerator.dart';
import 'package:plant_signal/source/utils/WAWidgets.dart';
import 'package:plant_signal/source/utils/widgets/slider.dart';

class SendFeedbackScreen extends StatefulWidget {
  static String tag = '/SendFeedbackScreen';

  final String feedbackCrop;

  SendFeedbackScreen({required this.feedbackCrop});

  @override
  SendFeedbackScreenState createState() => SendFeedbackScreenState();
}

class SendFeedbackScreenState extends State<SendFeedbackScreen> {
  TextEditingController emailController = TextEditingController(text: '');
  TextEditingController feedbackController = TextEditingController(text: '');

  FocusNode emailFocusNode = FocusNode();
  FocusNode feedbackFocusNode = FocusNode();

  List<WACardModel> sendViaCardList = waSendViaCardList();
  WACardModel selectedCard = WACardModel();

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    setStatusBarColor(Colors.white, statusBarIconBrightness: Brightness.dark);
    selectedCard = sendViaCardList[0];
    await Future.delayed(Duration(milliseconds: 500));
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
          title: Text('Give Feedback on ${widget.feedbackCrop} Detection',
              style: boldTextStyle(color: Colors.black, size: 20)),
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
          padding: EdgeInsets.only(top: 60),
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('images/walletApp/wa_bg.jpg'),
                  fit: BoxFit.cover)),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                16.height,
                Text('Feedback type:', style: boldTextStyle(size: 18))
                    .paddingLeft(16),
                8.height,
                Container(
                  padding: EdgeInsets.all(8),
                  margin: EdgeInsets.only(left: 16, right: 16),
                  width: MediaQuery.of(context).size.width,
                  decoration: boxDecorationRoundedWithShadow(16),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton(
                      value: selectedCard,
                      items: sendViaCardList.map((item) {
                        return DropdownMenuItem<WACardModel>(
                          value: item,
                          child: WASendViaComponent(item: item),
                        );
                      }).toList(),
                      onChanged: (WACardModel? value) {
                        selectedCard = value!;
                        setState(() {});
                      },
                    ),
                  ),
                ),
                16.height,
                Text("Your email", style: boldTextStyle(size: 18))
                    .paddingLeft(16),
                16.height,
                AppTextField(
                  autoFocus: false,
                  decoration: waInputDecoration(
                      hint: "Enter your email",
                      bgColor: Colors.white,
                      borderColor: Colors.grey),
                  textFieldType: TextFieldType.EMAIL,
                  keyboardType: TextInputType.emailAddress,
                  controller: emailController,
                  focus: emailFocusNode,
                  nextFocus: feedbackFocusNode,
                ).paddingOnly(left: 16, right: 16, bottom: 16),
                Text("Feedback", style: boldTextStyle(size: 18))
                    .paddingLeft(16),
                16.height,
                AppTextField(
                  autoFocus: false,
                  decoration: waInputDecoration(
                      hint: "Enter feedback to send", bgColor: white),
                  textFieldType: TextFieldType.OTHER,
                  keyboardType: TextInputType.name,
                  controller: feedbackController,
                  focus: feedbackFocusNode,
                ).paddingOnly(left: 16, right: 16),
                16.height,
                SliderButton(
                  buttonSize: 50,
                  backgroundColor: WAPrimaryColor,
                  dismissible: false,
                  action: () {
                    showInDialog(context, builder: (context) {
                      Database().addReview(
                          crop: widget.feedbackCrop,
                          feedbackType: selectedCard.sentiment!,
                          contact: emailController.text,
                          feedback: feedbackController.text);
                      return FeedbackCompleteDialog();
                    });
                  },
                  label: Text("Swipe to send feedback", style: boldTextStyle()),
                  icon: Icon(Icons.arrow_forward, color: WAPrimaryColor),
                ).center(),
                16.height,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
