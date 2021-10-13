import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:plant_signal/source/controllers/db_controller.dart';
import 'package:plant_signal/source/controllers/user_controller.dart';
import 'package:plant_signal/source/model/session.dart';
import 'package:plant_signal/source/screen/home_screen.dart';
import 'package:plant_signal/source/screen/plant_community/SocialFullApp.dart';
import 'package:plant_signal/source/screen/profile_screen.dart';
import 'package:plant_signal/source/screen/statistics_screen.dart';
import 'package:plant_signal/source/screen/community_screen.dart';
import 'package:plant_signal/source/utils/WAColors.dart';
import 'package:tflite/tflite.dart';

class DashboardScreen extends StatefulWidget {
  static String tag = '/DashboardScreen';

  @override
  DashboardScreenState createState() => DashboardScreenState();
}

class DashboardScreenState extends State<DashboardScreen> {
  int _selectedIndex = 0;
  late Image image;
  late String imagePath;

  var _pages = <Widget>[
    HomeScreen(),
    StatisticScreen(),
    SocialFullApp(),
    ProfileScreen(),
  ];

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

  Future<bool> _onWillPop() async {
    return (await showDialog(
          context: context,
          builder: (context) => new AlertDialog(
            title: new Text('Confirm'),
            content: new Text('Do you want to exit the app?'),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: new Text('No'),
              ),
              TextButton(
                onPressed: () => Navigator.of(context).pop(true),
                child: new Text('Yes'),
              ),
            ],
          ),
        )) ??
        false;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        body: _pages.elementAt(_selectedIndex),
        floatingActionButtonLocation:
            FloatingActionButtonLocation.miniCenterDocked,
        floatingActionButton: Padding(
          padding: EdgeInsets.all(6.0),
          child: FloatingActionButton(
            backgroundColor: WAPrimaryColor,
            child: Icon(Icons.camera_alt, color: Colors.white),
            onPressed: () {
              _dialogCall(context);
            },
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          shape: CircularNotchedRectangle(),
          clipBehavior: Clip.antiAlias,
          child: BottomNavigationBar(
            backgroundColor: Colors.white,
            currentIndex: _selectedIndex,
            onTap: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            type: BottomNavigationBarType.fixed,
            selectedItemColor: WAPrimaryColor,
            unselectedItemColor: Colors.grey,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.date_range), label: 'Statistics'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.assessment), label: 'Global'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person), label: 'Profile'),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _dialogCall(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return MyDialog();
        });
  }
}

class MyDialog extends StatefulWidget {
  @override
  _MyDialogState createState() => _MyDialogState();
}

class _MyDialogState extends State<MyDialog> {
  late String imagePath;
  Image? image;
  bool _busy = false;
  List<dynamic>? _recognitions;
  late DateTime dateTime;
  late double acc;
  UserController controller = Get.find<UserController>();

  String get label => _recognitions!.map((e) => {'${e['label']}'}).toString();

  String get accuracy => _recognitions!
      .map((e) =>
          {(double.parse('${e['confidence']}') * 100).toStringAsFixed(4)})
      .toString();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Text('PLANT SIGNAL', style: boldTextStyle(size: 20)),
        ),
      ),
      content: SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            Container(
              child: image != null ? image : null,
              height: image == null ? 0 : 200,
              width: 300,
            ),
            Container(
              child: image == null
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text(
                            "Chose an action: ",
                            style: primaryTextStyle(
                                color: Colors.black54, size: 16),
                          ),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Align(
                                alignment: Alignment.bottomLeft,
                                child: Text(
                                  'CANCEL',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.red,
                                  ),
                                ),
                              ),
                            ),
                            TextButton(
                              onPressed: () async {
                                controller.captureMode = "Cam".obs;
                                await getImageFromCamera(ImageSource.camera);
                                setState(() {});
                              },
                              child: Text(
                                'CAMERA',
                                style: TextStyle(
                                  color: WAPrimaryColor,
                                ),
                              ),
                            ),
                            TextButton(
                              onPressed: () async {
                                controller.captureMode = "Gallery".obs;
                                await getImageFromCamera(ImageSource.gallery);
                                setState(() {});
                              },
                              child: Text(
                                'GALLERY',
                                style: TextStyle(
                                  color: WAPrimaryColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    )
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 6,
                            ),
                            Text("Captured", style: boldTextStyle(size: 20)),
                            SizedBox(
                              height: 6,
                            ),
                            Text(
                              "Image has been captured! \nConfirm submission or "
                              "Quit to capture or pick another picture.",
                              style: TextStyle(
                                color: WAPrimaryColor,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton(
                                onPressed: () async {
                                  Navigator.pop(context);
                                  await _dialogCall(context);
                                },
                                child: Text(
                                  'RETAKE',
                                  style: TextStyle(
                                    color: Colors.red,
                                  ),
                                )),
                            TextButton(
                                onPressed: () async {
                                  await recognizeImage(File(imagePath));
                                  print(imagePath);
                                  print(_recognitions!.length);
                                  print(_recognitions![0]);
                                  //print(_recognitions[1]);
                                  _recognitions!.isNotEmpty
                                      ? showBottomSheet()
                                      : showBottomError();
                                },
                                child: Text(
                                  'CONTINUE',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: WAPrimaryColor,
                                  ),
                                )),
                          ],
                        ),
                      ],
                    ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _dialogCall(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return MyDialog();
        });
  }

  Future getImageFromCamera(ImageSource source) async {
    ImagePicker pk = ImagePicker();
    var x = await pk.getImage(source: source);
    if (x == null) return;
    setState(() {
      _busy = true;
      imagePath = x.path;
    });
    var file = File(imagePath);
    image = Image(
      image: FileImage(file),
      fit: BoxFit.cover,
    );
  }

  Future loadModel() async {
    Tflite.close();
    try {
      await Tflite.loadModel(
        model: "images/model.tflite",
        labels: "images/labels.txt",
      );
    } on PlatformException {
      print('Failed to load model.');
    }
  }

  @override
  void initState() {
    super.initState();
    _busy = true;
    loadModel().then((value) {
      setState(() {
        _busy = false;
      });
    });
  }

  Future recognizeImage(File image) async {
    int startTime = new DateTime.now().millisecondsSinceEpoch;
    List<dynamic>? recognitions = await Tflite.runModelOnImage(
      path: image.path,
      numResults: 7,
      threshold: 0.05,
      imageMean: 127.5,
      imageStd: 127.5,
    );
    setState(() {
      _recognitions = recognitions;
      dateTime = DateTime.now();
    });
    int endTime = DateTime.now().millisecondsSinceEpoch;
    print("Inference took ${endTime - startTime}ms");
    print("${dateTime.year}");
  }

  onSelect() async {
    setState(() {
      _busy = true;
      //_recognitions = null;
    });
    await loadModel();

    if (imagePath != null)
      setState(() {
        _busy = false;
      });
  }

  void showBottomSheet() {
    Database().addUserSession(Session(
        mode: controller.captureMode.value,
        status: "Successful",
        time: DateFormat('dd-MM-yyyy – kk:mm').format(DateTime.now())));
    showBarModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            child: ListView(
              shrinkWrap: true,
              padding: EdgeInsets.only(left: 16.0, right: 16.0),
              children: [
                SizedBox(
                  height: 8.0,
                ),
                Text(
                  'Success',
                  style: TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 8.0,
                ),
                Text(
                  'Disease detection was successful!',
                  style: primaryTextStyle(color: Colors.black54, size: 18),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 18.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('DATE', style: boldTextStyle(size: 17)),
                        Text(
                          '${dateTime.day}, ${dateTime.month}, ${dateTime.year}',
                          style: boldTextStyle(size: 15),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          'TIME',
                          style: boldTextStyle(size: 17),
                        ),
                        Text(
                          '${dateTime.hour}:${dateTime.minute}:${dateTime.second}',
                          style: boldTextStyle(size: 15),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 18.0,
                ),
                Text(
                  'Recognized Infections:',
                  style: boldTextStyle(size: 19, color: WAPrimaryColor),
                ),
                Expanded(
                  child: Wrap(children: [
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${label.substring(2, label.length - 2)}',
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18.0,
                                ),
                              ),
                              /*Text(
                                'Accuracy: ${accuracy.substring(2, accuracy.length - 2)}%',
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                                style: Theme.of(context)
                                    .textTheme
                                    .caption!
                                    .copyWith(
                                      fontSize: 18.0,
                                    ),
                              )*/
                            ],
                          ),
                        ],
                      ),
                    ),
                  ]),
                ),
                SizedBox(
                  height: 25.0,
                ),
                Text(
                  'Dominant Infection:',
                  style: boldTextStyle(size: 19, color: WAPrimaryColor),
                ),
                Expanded(
                  child: Wrap(children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${_recognitions![0]['label']}',
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.bold,
                                fontSize: 18.0,
                              ),
                            ),
                            Text(
                              'Accuracy: ${_recognitions![0]['confidence'] * 100}%',
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                              style:
                                  Theme.of(context).textTheme.caption!.copyWith(
                                        fontSize: 18.0,
                                      ),
                            )
                          ],
                        ),
                        Icon(
                          Icons.check_circle_outline_outlined,
                          color: Colors.green,
                          size: 50,
                        ),
                      ],
                    ),
                  ]),
                ),
                SizedBox(
                  height: 40.0,
                ),
                InkWell(
                  onTap: () {
                    showBarModalBottomSheet(
                      context: context,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(15.0),
                          topLeft: Radius.circular(15.0),
                        ),
                      ),
                      builder: (context) {
                        return Stack(
                          alignment: Alignment.bottomCenter,
                          children: [
                            Container(
                              child: ListView(
                                shrinkWrap: true,
                                padding: EdgeInsets.all(16.0),
                                children: [
                                  Text(
                                    'REMEDIES',
                                    style: boldTextStyle(size: 20),
                                  ),
                                  SizedBox(
                                    height: 12.0,
                                  ),
                                  Text(
                                      "Plant: ${label.substring(2, label.length - 2)}",
                                      style: boldTextStyle(
                                          size: 18, color: Colors.redAccent)),
                                  SizedBox(
                                    height: 12.0,
                                  ),

                                  ///TODO: Replace the next line with remedies...
                                  Center(
                                      child: CircularProgressIndicator(
                                    backgroundColor: WAPrimaryColor,
                                    semanticsLabel: 'Loading remedies...',
                                  )),
                                  SizedBox(
                                    height: 42.0,
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  ElevatedButton(
                                    onPressed: () => Navigator.pop(context),
                                    child: Text(
                                      'CLOSE',
                                      style: TextStyle(
                                        fontSize: 18,
                                      ),
                                    ),
                                    style: ElevatedButton.styleFrom(
                                      primary: Colors.red,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(
                                            30,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  ElevatedButton(
                                    onPressed: () async {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                              content: Text(
                                        "Coming Soon",
                                        style: TextStyle(fontSize: 24),
                                      )));
                                      Navigator.pop(context);
                                    },
                                    child: Text(
                                      'SHARE',
                                      style: TextStyle(fontSize: 18),
                                    ),
                                    style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(
                                            30,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(12.0)),
                    child: Container(
                      height: 80,
                      color: Colors.grey[200],
                      child: Row(
                        children: [
                          Container(
                            child: image != null ? image : null,
                            height: image == null ? 0 : 80,
                            width: 80,
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  bottom: 4.0, left: 4.0, right: 4.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'View Remedies',
                                    style: boldTextStyle(size: 20),
                                  ),
                                  /* Text(
                                    'A wonderful serenity has taken possession of my entire soul, '
                                    'like these sweet mornings of spring which I enjoy with'
                                    ' my whole heart. I am alone, and feel the charm of '
                                    'existence in this spot, which was created for the bliss ',
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: Theme.of(context)
                                        .textTheme
                                        .caption!
                                        .copyWith(
                                          fontSize: 17,
                                        ),
                                  ),*/
                                  Center(
                                    child: LinearProgressIndicator(
                                      backgroundColor: WAPrimaryColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 18,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: Text(
                        'CLOSE',
                        style: TextStyle(fontSize: 18, color: Colors.red),
                      ),
                    ),
                    TextButton(
                      onPressed: () async {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text(
                          "Coming Soon",
                          style: TextStyle(fontSize: 24),
                        )));
                        Navigator.pop(context);
                      },
                      child: Text(
                        'SHARE',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        });
  }

  void showBottomError() {
    Database().addUserSession(Session(
        mode: controller.captureMode.value,
        status: "Failed",
        time: DateFormat('dd-MM-yyyy – kk:mm').format(DateTime.now())));
    showBarModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            child: ListView(
              shrinkWrap: true,
              padding: EdgeInsets.all(16.0),
              children: [
                Text(
                  'Failed to load recognitions!',
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 20,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          );
        });
  }
}
