import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:inway/utils/app_colors.dart';
import 'package:nb_utils/nb_utils.dart';
import '../models/BankingModel.dart';
import '../utils/BankingColors.dart';
import '../utils/BankingContants.dart';
import '../utils/BankingDataGenerator.dart';
import '../utils/BankingImages.dart';
import '../utils/BankingWidget.dart';
import 'package:get/get.dart';
import 'package:inway/controller/auth_controller.dart';



class BankingHome1 extends StatefulWidget {
  static String tag = '/BankingHome1';

  @override
  BankingHome1State createState() => BankingHome1State();
}

class BankingHome1State extends State<BankingHome1> {
  int currentIndexPage = 0;
  int? pageLength;

  AuthController authController = Get.find<AuthController>();

  late List<BankingHomeModel> mList1;
  late List<BankingHomeModel2> mList2;

  @override
  void initState() {
    super.initState();

    currentIndexPage = 0;

    pageLength = 3;

    authController.getUserInfo();

    mList1 = bankingHomeList1();

    mList2 = bankingHomeList2();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            SliverAppBar(
              expandedHeight: 330,
              floating: false,
              pinned: true,
              titleSpacing: 0,
              automaticallyImplyLeading: false,
              backgroundColor:
                  innerBoxIsScrolled ? AppColors.greenColor : Banking_app_Background,
              actionsIconTheme: IconThemeData(opacity: 0.0),
              title: Container(
                padding: EdgeInsets.fromLTRB(16, 42, 16, 32),
                margin: EdgeInsets.only(bottom: 8, top: 8),
                child: Row(
                  children: [

                    Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: authController.myUser.value.image == null
                              ? DecorationImage(
                              image: AssetImage('assets/person.png'),
                              fit: BoxFit.fill)
                              : DecorationImage(
                              image: NetworkImage(
                                  authController.myUser.value.image!),
                              fit: BoxFit.fill)),
                    ),

                    const SizedBox(
                      width: 15,
                    ),

                    10.width,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [

                        RichText(
                          text: TextSpan(children: [
                            TextSpan(
                                text: 'Hello, ',
                                style:
                                TextStyle(color: Colors.black, fontSize: 14)),
                            TextSpan(
                                text: authController.myUser.value.name,
                                style: TextStyle(
                                    color: AppColors.greenColor,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold)),
                          ]),
                        ),
                      ],
                    ).expand(),
                    Icon(Icons.notifications,
                        size: 30, color: Banking_whitePureColor)
                  ],
                ),
              ),
              flexibleSpace: FlexibleSpaceBar(
                background: Stack(
                  children: [
                    Container(
                      height: 250,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.bottomLeft,
                            end: Alignment.topLeft,
                            colors: <Color>[Banking_Primary, Banking_palColor]),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(16, 80, 16, 8),
                      padding: EdgeInsets.fromLTRB(4, 0, 4, 0),
                      decoration: boxDecorationWithRoundedCorners(
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: defaultBoxShadow()),
                      child: Column(
                        children: [
                          Container(
                            height: 130,
                            child: PageView(
                              children: [
                                TopCard(
                                    name: "Default Account",
                                    acno: "1234567899",
                                    bal: "\100000 FCFA"),
                                TopCard(
                                    name: "Kadji",
                                    acno: "9874563210",
                                    bal: "\18,000 FCFA"),
                                TopCard(
                                    name: "Ndundat Yaya",
                                    acno: "5821479630",
                                    bal: "\80,500 FCFA"),
                              ],
                              onPageChanged: (value) {
                                setState(() => currentIndexPage = value);
                              },
                            ),
                          ),
                          8.height,
                          Align(
                            alignment: Alignment.center,
                            child: DotsIndicator(
                              dotsCount: 3,
                              decorator: DotsDecorator(
                                size: Size.square(8.0),
                                activeSize: Size.square(8.0),
                                color: Banking_view_color,
                                activeColor: AppColors.greenColor,
                              ),
                            ),
                          ),
                          10.height,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                padding: EdgeInsets.only(top: 8, bottom: 8),
                                decoration: boxDecorationWithRoundedCorners(
                                    backgroundColor: AppColors.greenColor,
                                    borderRadius: BorderRadius.circular(8)),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.payment,
                                        color: Banking_TextColorWhite,
                                        size: 24),
                                    10.width,
                                    Text('Payment',
                                        style: primaryTextStyle(
                                            size: 16,
                                            color: Banking_TextColorWhite)),
                                  ],
                                ),
                              ).expand(),
                              10.width,
                              Container(
                                padding: EdgeInsets.only(top: 8, bottom: 8),
                                decoration: boxDecorationWithRoundedCorners(
                                    backgroundColor: AppColors.greenColor,
                                    borderRadius: BorderRadius.circular(8)),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset(Banking_ic_Transfer,
                                        color: Banking_TextColorWhite),
                                    10.width,
                                    Text('Transfer',
                                        style: primaryTextStyle(
                                            size: 16,
                                            color: Banking_TextColorWhite)),
                                  ],
                                ),
                              ).expand(),
                            ],
                          ).paddingAll(16)
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          ];
        },
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(16),
            color: Banking_app_Background,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Recent Transaction",
                        style: primaryTextStyle(
                            size: 16,
                            color: Banking_TextColorPrimary,
                            fontFamily: fontRegular)),
                    Text("22 June 2023",
                        style: primaryTextStyle(
                            size: 16,
                            color: Banking_TextColorSecondary,
                            fontFamily: fontRegular)),
                  ],
                ),
                ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: mList1.length,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      padding: EdgeInsets.all(8),
                      margin: EdgeInsets.only(top: 8, bottom: 8),
                      decoration: boxDecorationRoundedWithShadow(8,
                          backgroundColor: Banking_whitePureColor,
                          spreadRadius: 0,
                          blurRadius: 0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(Icons.account_balance_wallet,
                              size: 30, color: mList1[index].color),
                          10.width,
                          Text('${mList1[index].title}',
                                  style: primaryTextStyle(
                                      size: 16,
                                      color: mList1[index].color,
                                      fontFamily: fontMedium))
                              .expand(),
                          Text(mList1[index].bal!,
                              style: primaryTextStyle(
                                  color: mList1[index].color, size: 16)),
                        ],
                      ),
                    );
                  },
                ),
                16.height,
                Text("22 Feb 2023",
                    style: primaryTextStyle(
                        size: 16,
                        color: Banking_TextColorSecondary,
                        fontFamily: fontRegular)),
                Divider(),
                ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: 15,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    BankingHomeModel2 data = mList2[index % mList2.length];
                    return Container(
                      padding: EdgeInsets.all(8),
                      margin: EdgeInsets.only(top: 8, bottom: 8),
                      decoration: boxDecorationRoundedWithShadow(8,
                          backgroundColor: Banking_whitePureColor,
                          spreadRadius: 0,
                          blurRadius: 0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(data.icon!,
                              height: 30,
                              width: 30,
                              color: index == 2
                                  ? Banking_Primary
                                  : Banking_Primary),
                          10.width,
                          Text(data.title!,
                                  style: primaryTextStyle(
                                      size: 16,
                                      color: AppColors.greenColor,
                                      fontFamily: fontRegular))
                              .expand(),
                          Align(
                              alignment: Alignment.centerRight,
                              child: Text(data.charge!,
                                  style: primaryTextStyle(
                                      color: data.color, size: 16)))
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
