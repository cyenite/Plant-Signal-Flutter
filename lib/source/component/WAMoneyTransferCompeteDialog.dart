import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:plant_signal/source/utils/WAColors.dart';
import 'package:plant_signal/source/utils/WAWidgets.dart';

class WAMoneyTransferCompleteDialog extends StatefulWidget {
  static String tag = '/WAMoneyTransferCompleteDialog';

  @override
  WAMoneyTransferCompleteDialogState createState() =>
      WAMoneyTransferCompleteDialogState();
}

class WAMoneyTransferCompleteDialogState
    extends State<WAMoneyTransferCompleteDialog> {
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
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        waCommonCachedNetworkImage(
            'https://pluspng.com/img-png/success-png-success-icon-image-23194-400.png',
            height: 200,
            width: 200,
            fit: BoxFit.fill),
        16.height,
        Text('Done!', style: secondaryTextStyle()),
        16.height,
        Text('Feedback Sent Successfully!',
            style: boldTextStyle(size: 22), textAlign: TextAlign.center),
        8.height,
        createRichText(list: [
          TextSpan(
              text: "Your feedback will be used to improve our services",
              style: secondaryTextStyle()),
          TextSpan(text: "", style: boldTextStyle()),
        ], textAlign: TextAlign.center),
        8.height,
        Text('Thank you for using Plant Signal!', style: secondaryTextStyle()),
        30.height,
        AppButton(
          color: WAPrimaryColor,
          width: 180,
          height: 50,
          shapeBorder:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          text: "Back to Home",
          onTap: () {
            finish(context);
          },
          textStyle: boldTextStyle(color: Colors.white),
        ),
        16.height,
      ],
    );
  }
}
