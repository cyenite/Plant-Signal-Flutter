import 'package:flutter/material.dart';
import 'package:plant_signal/source/model/WalletAppModel.dart';
import 'package:plant_signal/source/screen/WABillPayScreen.dart';
import 'package:plant_signal/source/screen/WACreditCardScreen.dart';
import 'package:plant_signal/source/screen/WASendMoneyViaLoopScreen.dart';
import 'package:plant_signal/source/screen/WAVoucherScreen.dart';

List<String?> waMonthList = <String?>[
  "Jan",
  "Feb",
  "Mar",
  "April",
  "May",
  "June",
  "July",
  "Aug",
  "Sep",
  "Oct",
  "Nov",
  "Dec"
];
List<String?> waYearList = <String?>[
  "1991",
  "1992",
  "1993",
  "1994",
  "1995",
  "1996",
  "1997",
  "1998",
  "1999",
  "2020",
  "2021"
];
List<String?> waOrgList = <String?>[
  "All",
  "Water",
  "Gas",
  "Electricity",
  "Internet",
  "Education",
  "Landline"
];
List<String?> amountList = ["500", "1000", "800"];
List<String?> overViewList = ["All", "Weekly", "Yearly", "Daily", "Monthly"];

List<WAWalkThroughModel> waWalkThroughList() {
  List<WAWalkThroughModel> list = [];
  list.add(WAWalkThroughModel(
      title: "Easily Accessible",
      description:
          "Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs.",
      image: 'images/walletApp/wa_walkthorugh.png'));
  list.add(WAWalkThroughModel(
      title: "Mange Anytime",
      description:
          "Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs.",
      image: 'images/walletApp/wa_walkthorugh.png'));
  list.add(WAWalkThroughModel(
      title: "Safe Transaction",
      description:
          "Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs.",
      image: 'images/walletApp/wa_walkthorugh.png'));

  return list;
}

List<WACardModel> waCardList() {
  List<WACardModel> cardList = [];
  cardList.add(WACardModel(
      title: 'Supported Crops',
      balance: '38',
      cardNumber: 'Last Update: ',
      date: '09/10/2021',
      color: Color(0xFF6C56F9)));
  cardList.add(WACardModel(
      title: 'Detection Status',
      balance: 'Active',
      cardNumber: 'Last Update: ',
      date: DateTime.now().day.toString(),
      color: Color(0xFF26C884)));
  cardList.add(WACardModel(
      title: 'App Version',
      balance: '4.0 Beta',
      cardNumber: 'Last Update: ',
      date: '01/10/2021',
      color: Color(0xFFFF7426)));
  return cardList;
}

List<WAOperationsModel> waOperationList() {
  List<WAOperationsModel> operationModel = [];
  operationModel.add(WAOperationsModel(
    color: Color(0xFF6C56F9),
    title: 'Apples',
    image: 'images/plantlogo.png',
    widget: WASendMoneyViaLoopScreen(),
  ));
  operationModel.add(WAOperationsModel(
    color: Color(0xFFFF7426),
    title: 'Cherries',
    image: 'images/plantlogo.png',
    widget: WAVoucherScreen(),
  ));
  operationModel.add(WAOperationsModel(
    color: Color(0xFF6C56F9),
    title: 'Grapes',
    image: 'images/plantlogo.png',
    widget: WACreditCardScreen(),
  ));
  operationModel.add(WAOperationsModel(
    color: Color(0xFF26C884),
    title: 'Maize',
    image: 'images/plantlogo.png',
    widget: WABillPayScreen(),
  ));
  operationModel.add(WAOperationsModel(
    color: Color(0xFF6C56F9),
    title: 'Tomatoes',
    image: 'images/plantlogo.png',
  ));
  operationModel.add(WAOperationsModel(
    color: Color(0xFF26C884),
    title: 'Potatoes',
    image: 'images/plantlogo.png',
  ));
  operationModel.add(WAOperationsModel(
    color: Color(0xFFFF7426),
    title: 'Peach',
    image: 'images/plantlogo.png',
  ));
  operationModel.add(WAOperationsModel(
    color: Color(0xFF6C56F9),
    title: 'Strawberries',
    image: 'images/plantlogo.png',
  ));
  operationModel.add(WAOperationsModel(
    color: Color(0xFFFF7426),
    title: 'Maize',
    image: 'images/plantlogo.png',
  ));
  operationModel.add(WAOperationsModel(
    color: Color(0xFFF13452),
    title: 'Pepper',
    image: 'images/plantlogo.png',
  ));
  return operationModel;
}

List<WATransactionModel> waTransactionList() {
  List<WATransactionModel> transactionList = [];
  transactionList.add(WATransactionModel(
    color: Color(0xFFFF7426),
    title: 'Scanned an image from',
    image: 'images/walletApp/wa_voucher.png',
    balance: 'Failed',
    name: 'Gallery',
    time: 'Today 5:30 PM',
  ));
  transactionList.add(WATransactionModel(
    color: Color(0xFF26C884),
    title: 'Scanned an image from',
    image: 'images/walletApp/wa_voucher.png',
    balance: 'Successful',
    name: 'Cam',
    time: 'Today 6:30 PM',
  ));
  return transactionList;
}

List<WARecentPayeesModel> waRecentPayeesList() {
  List<WARecentPayeesModel> list = [];
  list.add(WARecentPayeesModel(
      image:
          'https://www.vrsiddhartha.ac.in/me/wp-content/uploads/learn-press-profile/4/172522ec1028ab781d9dfd17eaca4427.jpg',
      name: 'John',
      number: '123456789'));
  list.add(WARecentPayeesModel(
      image:
          'https://royalrajtravels.com/image/1613583503main-qimg-6291c3a117fc230c82785148baef7eed.jpg',
      name: 'Rose',
      number: '78571237'));
  list.add(WARecentPayeesModel(
      image:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT5yt4pfdz3-lacajgUY5xuRuciElEaMZa9luc29Vgx2oVLDQceaFmxgcUXRzU-IfTZcWA&usqp=CAU',
      name: 'Willam',
      number: '456123522'));
  list.add(WARecentPayeesModel(
      image:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT5yt4pfdz3-lacajgUY5xuRuciElEaMZa9luc29Vgx2oVLDQceaFmxgcUXRzU-IfTZcWA&usqp=CAU',
      name: 'Willam',
      number: '5568553522'));
  list.add(WARecentPayeesModel(
      image:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT5yt4pfdz3-lacajgUY5xuRuciElEaMZa9luc29Vgx2oVLDQceaFmxgcUXRzU-IfTZcWA&usqp=CAU',
      name: 'Willam',
      number: '852123522'));
  list.add(WARecentPayeesModel(
      image:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQIuNPlLLXKdjlBivtZzQxsq-hW9E6YbooFXqDqST7AfuSHGcN45DIDTi5qeLOQHNrNR9g&usqp=CAU',
      name: 'Rose',
      number: '4561222222'));
  list.add(WARecentPayeesModel(
      image:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSw9jzCKDNeX4QbAQOAABXMML3djP3ZVEv1-rpbKgfyNCshsC-zhB3Ta2JXdMxvvSOFszg&usqp=CAU',
      name: 'Bella',
      number: '98561233'));
  return list;
}

List<WABillPayModel> waBillPayList() {
  List<WABillPayModel> list = [];
  list.add(WABillPayModel(
      title: 'Water',
      color: Colors.blue,
      image: 'images/walletApp/wa_water.png'));
  list.add(WABillPayModel(
      title: 'Gas',
      color: Color(0xFFFF7426),
      image: 'images/walletApp/wa_gas.png'));
  list.add(WABillPayModel(
      title: 'Electricity',
      color: Colors.yellow,
      image: 'images/walletApp/wa_electricity.png'));
  list.add(WABillPayModel(
      title: 'Internet',
      color: Colors.pink,
      image: 'images/walletApp/wa_internet.png'));
  list.add(WABillPayModel(
      title: 'Education',
      color: Colors.green,
      image: 'images/walletApp/wa_education.png'));
  list.add(WABillPayModel(
      title: 'Landline',
      color: Colors.lightBlueAccent,
      image: 'images/walletApp/wa_landline.png'));
  return list;
}

List<WAOrganizationModel> waOrganizationList() {
  List<WAOrganizationModel> list = [];
  list.add(WAOrganizationModel(
      color: Colors.blue,
      image: 'images/walletApp/wa_water.png',
      title: 'Eco Water',
      subTitle: 'Water Supplier'));
  list.add(WAOrganizationModel(
      color: Colors.yellow,
      image: 'images/walletApp/wa_electricity.png',
      title: 'bolt Powergrid',
      subTitle: 'Electricity Supplier'));
  list.add(WAOrganizationModel(
      color: Colors.pink,
      image: 'images/walletApp/wa_internet.png',
      title: 'Nina Network',
      subTitle: 'Internet Supplier'));
  list.add(WAOrganizationModel(
      color: Colors.yellow,
      image: 'images/walletApp/wa_electricity.png',
      title: 'Green Energy ',
      subTitle: 'Electricity Supplier'));
  list.add(WAOrganizationModel(
      color: Colors.pink,
      image: 'images/walletApp/wa_internet.png',
      title: 'Express Internet',
      subTitle: 'Internet Supplier'));
  return list;
}

List<WABillPayModel> waSelectBillList() {
  List<WABillPayModel> list = [];
  list.add(WABillPayModel(
      title: 'CityBank', image: 'images/walletApp/wa_city_bank_image.png'));
  list.add(WABillPayModel(
      title: 'Bank of America',
      image: 'images/walletApp/wa_bank_of_america.png'));
  list.add(WABillPayModel(
      title: 'Yes Bank', image: 'images/walletApp/wa_yes_bank.png'));
  return list;
}

List<WACardModel> waSendViaCardList() {
  List<WACardModel> list = [];
  list.add(WACardModel(
      balance: '\$12,00,000',
      cardNumber: '123 985 7654327',
      date: '03/23',
      color: Color(0xFF6C56F9),
      image: 'images/walletApp/wa_card.png'));
  list.add(WACardModel(
      balance: '\$12,23,000',
      cardNumber: '985 123 7654327',
      date: '25/23',
      color: Color(0xFFFF7426),
      image: 'images/walletApp/wa_card.png'));
  list.add(WACardModel(
      balance: '\$23,00,000',
      cardNumber: '765 123 9854327',
      date: '03/25',
      color: Color(0xFF26C884),
      image: 'images/walletApp/wa_card.png'));
  return list;
}

List<WATransactionModel> waCategoriesList() {
  List<WATransactionModel> list = [];
  list.add(WATransactionModel(
      color: Color(0xFF26C884),
      title: 'Tomatoes',
      image: 'images/walletApp/wa_food.png',
      balance: 'Most successful',
      time: 'Today 12:30 PM'));
  list.add(WATransactionModel(
      color: Color(0xFFFF7426),
      title: 'Cherry',
      image: 'images/walletApp/wa_food.png',
      balance: 'Most Failures',
      time: 'Today 1:02 PM'));
  return list;
}

List<WAVoucherModel> waVouchersList() {
  List<WAVoucherModel> list = [];
  list.add(WAVoucherModel(
      image: 'images/walletApp/wa_zara.png',
      title: 'ZARA Fashion',
      discountText: '10% Off',
      expireTime: 'Expires on 15 June',
      pointsText: 'For 1500 points'));
  list.add(WAVoucherModel(
      image: 'images/walletApp/wa_macdonals.jpeg',
      title: 'Mcdonald\'s',
      discountText: '5% Off',
      expireTime: 'Expires on 20 June',
      pointsText: 'For 600 points'));
  list.add(WAVoucherModel(
      image: 'images/walletApp/wa_macdonals.jpeg',
      title: 'Mcdonald\'s',
      discountText: '5% Off',
      expireTime: 'Expires on 20 June',
      pointsText: 'For 600 points'));
  list.add(WAVoucherModel(
      image: 'images/walletApp/wa_zara.png',
      title: 'ZARA Fashion',
      discountText: '10% Off',
      expireTime: 'Expires on 15 June',
      pointsText: 'For 1500 points'));
  list.add(WAVoucherModel(
      image: 'images/walletApp/wa_zara.png',
      title: 'ZARA Fashion',
      discountText: '10% Off',
      expireTime: 'Expires on 15 June',
      pointsText: 'For 1500 points'));
  list.add(WAVoucherModel(
      image: 'images/walletApp/wa_macdonals.jpeg',
      title: 'Mcdonald\'s',
      discountText: '5% Off',
      expireTime: 'Expires on 20 June',
      pointsText: 'For 600 points'));
  list.add(WAVoucherModel(
      image: 'images/walletApp/wa_macdonals.jpeg',
      title: 'Mcdonald\'s',
      discountText: '5% Off',
      expireTime: 'Expires on 20 June',
      pointsText: 'For 600 points'));
  list.add(WAVoucherModel(
      image: 'images/walletApp/wa_zara.png',
      title: 'ZARA Fashion',
      discountText: '10% Off',
      expireTime: 'Expires on 15 June',
      pointsText: 'For 1500 points'));
  return list;
}
