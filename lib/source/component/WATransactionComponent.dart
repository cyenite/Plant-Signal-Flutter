import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:plant_signal/source/model/session.dart';

class WATransactionComponent extends StatefulWidget {
  static String tag = '/WATransactionComponent';

  final Session? session;

  WATransactionComponent({this.session});

  @override
  WATransactionComponentState createState() => WATransactionComponentState();
}

class WATransactionComponentState extends State<WATransactionComponent> {
  Color bgColors = Color(0xFF26C884);
  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    if (widget.session!.status == "Failed") {
      bgColors = Color(0xFFFF7426);
    }
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      margin: EdgeInsets.only(bottom: 16, left: 16, right: 16),
      decoration:
          boxDecorationRoundedWithShadow(16, backgroundColor: Colors.white),
      child: ListTile(
        tileColor: Colors.red,
        enabled: true,
        contentPadding: EdgeInsets.zero,
        leading: Container(
          height: 50,
          width: 50,
          alignment: Alignment.center,
          decoration: boxDecorationWithRoundedCorners(
            boxShape: BoxShape.circle,
            backgroundColor: bgColors.withOpacity(0.1),
          ),
          child: ImageIcon(
            AssetImage('images/walletApp/wa_voucher.png'),
            size: 24,
            color: bgColors,
          ),
        ),
        title: RichTextWidget(
          list: [
            TextSpan(
              text: 'Scanned an image from',
              style: primaryTextStyle(color: Colors.black54, size: 14),
            ),
            TextSpan(
              text: '\t${widget.session!.mode}',
              style: boldTextStyle(size: 14),
            ),
          ],
          maxLines: 1,
        ),
        subtitle: Text('${widget.session!.time}',
            style: primaryTextStyle(color: Colors.black54, size: 14)),
        trailing: Container(
          width: 80,
          height: 35,
          alignment: Alignment.center,
          decoration: boxDecorationWithRoundedCorners(
            borderRadius: BorderRadius.circular(30),
            backgroundColor: bgColors.withOpacity(0.1),
          ),
          child: Text(
            '${widget.session!.status}',
            maxLines: 1,
            style: boldTextStyle(size: 12, color: bgColors),
          ),
        ),
      ),
    );
  }
}
