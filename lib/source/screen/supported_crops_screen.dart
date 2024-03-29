import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:plant_signal/source/component/WAOperationComponent.dart';
import 'package:plant_signal/source/model/WalletAppModel.dart';
import 'package:plant_signal/source/utils/WADataGenerator.dart';

class SupportedCropsScreen extends StatefulWidget {
  static String tag = '/SupportedCropsScreen';

  @override
  SupportedCropsScreenState createState() => SupportedCropsScreenState();
}

class SupportedCropsScreenState extends State<SupportedCropsScreen> {
  List<WAOperationsModel> operationsList = waOperationList();

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
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          'Supported Crops',
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
        padding: EdgeInsets.only(top: 80),
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('images/walletApp/wa_bg.jpg'),
                fit: BoxFit.cover)),
        child: Container(
          margin: EdgeInsets.only(top: 30),
          decoration: boxDecorationRoundedWithShadow(
            16,
            backgroundColor: Colors.white,
          ),
          child: SingleChildScrollView(
            child: Wrap(
              spacing: 16,
              runSpacing: 16,
              alignment: WrapAlignment.center,
              children: operationsList.map((item) {
                return Container(
                  padding:
                      EdgeInsets.only(top: 16, bottom: 8, left: 8, right: 8),
                  decoration: boxDecorationRoundedWithShadow(16),
                  alignment: AlignmentDirectional.center,
                  width: MediaQuery.of(context).size.width * 0.27,
                  child: WAOperationComponent(
                    itemModel: item,
                  ),
                ).onTap(() {
                  item.widget.launch(context);
                });
              }).toList(),
            ).paddingAll(16),
          ),
        ),
      ),
    );
  }
}
