import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:tflite/tflite.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Image image;
  late String imagePath;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white70,
        leading: IconButton(
          icon: Icon(
            Icons.menu,
            color: Colors.black87,
          ),
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(
              "Coming Soon",
              style: TextStyle(fontSize: 24),
            )));
          },
        ),
        title: Text(
          'PLANT SIGNAL',
          style: TextStyle(
            color: Colors.black87,
          ),
        ),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: Icon(
              Icons.search,
              color: Colors.black87,
            ),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text(
                "Coming Soon",
                style: TextStyle(fontSize: 24),
              )));
            },
          ),
          IconButton(
            icon: Icon(
              Icons.more_vert_rounded,
              color: Colors.black87,
            ),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text(
                "Coming Soon",
                style: TextStyle(fontSize: 24),
              )));
            },
          ),
        ],
      ),
      body: Container(
        color: Colors.grey[300],
        child: Center(
          child: ListView(
            padding: EdgeInsets.all(16.0),
            shrinkWrap: true,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Card(
                        child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 25,
                            child: Icon(
                              Icons.person,
                              color: Colors.white,
                              size: 30,
                            ),
                            backgroundColor: Colors.orange,
                          ),
                          SizedBox(
                            width: 12,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "80+",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                              Text(
                                "Testers",
                                style: Theme.of(context)
                                    .textTheme
                                    .caption!
                                    .copyWith(),
                              ),
                            ],
                          )
                        ],
                      ),
                    )),
                  ),
                  Expanded(
                    child: Card(
                        child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 25,
                            child: Icon(
                              Icons.info_outline,
                              color: Colors.white,
                              size: 30,
                            ),
                            backgroundColor: Colors.blueAccent,
                          ),
                          SizedBox(
                            width: 12,
                          ),
                          Text(
                            "About",
                            style:
                                Theme.of(context).textTheme.caption!.copyWith(),
                          )
                        ],
                      ),
                    )),
                  ),
                ],
              ),
              Card(
                child: Column(
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 16.0, right: 16, top: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "SUPPORTED PLANTS",
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'i',
                            style: TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                                color: Colors.green),
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      thickness: 2,
                    ),
                    Column(
                      children: [
                        ListTile(
                          title: Text(
                            'Tomatoes',
                          ),
                          trailing: Text(
                            '16 Sep 20',
                            style:
                                Theme.of(context).textTheme.caption!.copyWith(),
                          ),
                        ),
                        ListTile(
                          title: Text(
                            'Coffee',
                          ),
                          trailing: Text(
                            '28 Sep 20',
                            style:
                                Theme.of(context).textTheme.caption!.copyWith(),
                          ),
                        ),
                        ListTile(
                          title: Text(
                            'Potatoes',
                          ),
                          trailing: Text(
                            '29 Sep 20',
                            style:
                                Theme.of(context).textTheme.caption!.copyWith(),
                          ),
                        ),
                        ListTile(
                          title: Text(
                            'Pepper',
                          ),
                          trailing: Text(
                            '10 Oct 20',
                            style:
                                Theme.of(context).textTheme.caption!.copyWith(),
                          ),
                        ),
                      ],
                    ),
                    Divider(
                      thickness: 2,
                    ),
                    TextButton(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Coming Soon')));
                      },
                      child: Text(
                        "About Supported Plants",
                        style: TextStyle(
                            color: Colors.green,
                            fontSize: 18,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 4.0, right: 4),
                child: Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.topRight,
                      colors: <Color>[
                        Colors.white,
                        Colors.green,
                      ],
                      tileMode: TileMode.repeated,
                    ),
                  ),
                  child: TextButton(
                    onPressed: () async {
                      await _dialogCall(context);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'SCAN IMAGE',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 25,
                        backgroundColor: Color(0xFF1A91DA),
                        child: FaIcon(
                          FontAwesomeIcons.twitter,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        width: 12,
                      ),
                      CircleAvatar(
                        radius: 25,
                        backgroundColor: Color(0xFFFF0000),
                        child: FaIcon(
                          FontAwesomeIcons.youtube,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        width: 12,
                      ),
                      CircleAvatar(
                        radius: 25,
                        backgroundColor: Color(0xFF3b5998),
                        child: FaIcon(
                          FontAwesomeIcons.facebookF,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        width: 12,
                      ),
                      CircleAvatar(
                        radius: 25,
                        backgroundColor: Colors.grey,
                        child: FaIcon(FontAwesomeIcons.instagram,
                            color: Colors.white),
                      ),
                      SizedBox(
                        width: 12,
                      ),
                    ],
                  ),
                ),
              ),
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
  late Image image;
  bool _busy = false;
  late List _recognitions;
  late DateTime dateTime;
  late double acc;

  String get label => _recognitions.map((e) => {'${e['label']}'}).toString();

  String get accuracy => _recognitions
      .map((e) =>
          {(double.parse('${e['confidence']}') * 100).toStringAsFixed(4)})
      .toString();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: image == null
          ? Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(
                'PLANT SIGNAL',
              ),
            )
          : Container(),
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
                            "Chose Action",
                          ),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
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
                                await getImageFromCamera(ImageSource.camera);
                                setState(() {});
                              },
                              child: Text('CAMERA'),
                            ),
                            TextButton(
                              onPressed: () async {
                                await getImageFromCamera(ImageSource.gallery);
                                setState(() {});
                              },
                              child: Text('GALLERY'),
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
                            Text(
                              "Captured!",
                              style: TextStyle(
                                fontSize: 26,
                              ),
                            ),
                            SizedBox(
                              height: 6,
                            ),
                            Text(
                              "Image has been captured! \nConfirm submission or "
                              "Quit to capture or pick another picture",
                              style: TextStyle(
                                fontSize: 18,
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
                                  print(_recognitions.length);
                                  print(_recognitions[0]);
                                  //print(_recognitions[1]);
                                  _recognitions.isNotEmpty
                                      ? showBottomSheet()
                                      : showBottomError();
                                },
                                child: Text(
                                  'CONTINUE',
                                  style: TextStyle(),
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
    var recognitions = await Tflite.runModelOnImage(
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
                  'Success!',
                  style: TextStyle(
                    color: Colors.green,
                    fontSize: 32,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 8.0,
                ),
                Text(
                  'Disease detection was successful!',
                  style: Theme.of(context).textTheme.caption!.copyWith(
                        fontSize: 20.0,
                      ),
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
                        Text(
                          'DATE',
                          style: Theme.of(context).textTheme.caption!.copyWith(
                                fontSize: 20.0,
                              ),
                        ),
                        Text(
                          '${dateTime.day}, ${dateTime.month}, ${dateTime.year}',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 20.0,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          'TIME',
                          style: Theme.of(context).textTheme.caption!.copyWith(
                                fontSize: 20.0,
                              ),
                        ),
                        Text(
                          '${dateTime.hour}:${dateTime.minute}:${dateTime.second}',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 20.0,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 18.0,
                ),
                Text(
                  'POSSIBLE INFECTIONS:',
                  style: TextStyle(
                    color: Colors.green,
                    fontSize: 20,
                  ),
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
                              Text(
                                'Accuracy: ${accuracy.substring(2, accuracy.length - 2)}%',
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                                style: Theme.of(context)
                                    .textTheme
                                    .caption!
                                    .copyWith(
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
                    ),
                  ]),
                ),
                SizedBox(
                  height: 18.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Background',
                      style: Theme.of(context).textTheme.caption!.copyWith(
                            fontSize: 18.0,
                          ),
                    ),
                    Text(
                      'COMPLETED',
                      style: Theme.of(context).textTheme.caption!.copyWith(
                            fontSize: 18.0,
                          ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 18.0,
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
                                    style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 12.0,
                                  ),
                                  Text(
                                    "Plant: ${label.substring(2, label.length - 2)}",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 12.0,
                                  ),
                                  Text(
                                    'A wonderful serenity has taken possession of my entire soul, '
                                    'like these sweet mornings of spring which I enjoy with'
                                    ' my whole heart. I am alone, and feel the charm of '
                                    'existence in this spot, which was created for the bliss '
                                    'of souls like mine. I am so happy, my dear friend, so'
                                    ' absorbed in the exquisite sense of mere tranquil existence, '
                                    'that I neglect my talents. I should be incapable of drawing a'
                                    ' single stroke at the present moment; and yet I feel that I '
                                    'never was a greater artist than now. When, while the lovely '
                                    'valley teems with vapour around me, and the meridian sun strikes'
                                    ' the upper surface of the impenetrable foliage of my trees, '
                                    'and but a few stray gleams steal into the inner sanctuary,'
                                    ' I throw myself down among the tall grass by the trickling '
                                    'stream; and, as I lie close to the earth, a thousand unknown '
                                    'plants are noticed by me: when I hear the buzz of the little '
                                    'world among the stalks, and grow familiar with the countless '
                                    'indescribable forms of the insects and flies, then I feel '
                                    'the presence of the Almighty, who formed us in his own image,'
                                    ' and the breath',
                                    style: TextStyle(
                                      height: 1.5,
                                      fontSize: 18.0,
                                    ),
                                    textAlign: TextAlign.justify,
                                  ),
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
                                    style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Text(
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
    showBarModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            child: ListView(
              shrinkWrap: true,
              padding: EdgeInsets.all(16.0),
              children: [
                Text(
                  'Failed to load the modal!',
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 32,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          );
        });
  }
}
