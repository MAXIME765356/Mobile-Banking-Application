import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import '../models/BankingModel.dart';
import '../utils/BankingColors.dart';
import '../utils/BankingContants.dart';
import '../utils/BankingDataGenerator.dart';
import '../utils/BankingImages.dart';
import '../utils/BankingStrings.dart';
import 'package:get/get.dart';
import 'package:inway/controller/auth_controller.dart';


class BankingShareInformation extends StatefulWidget {
  static var tag = "/BankingShareInformation";

  @override
  _BankingShareInformationState createState() =>
      _BankingShareInformationState();
}

class _BankingShareInformationState extends State<BankingShareInformation> {

  AuthController authController = Get.find<AuthController>();

  late List<BankingShareInfoModel> mList1;

  @override
  void initState() {
    super.initState();

    authController.getUserInfo();

    mList1 = bankingInfoList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Banking_app_Background,
      body: Container(
        padding: EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              30.height,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Icon(Icons.chevron_left, size: 30, color: Banking_blackColor)
                      .onTap(
                    () {
                      finish(context);
                    },
                  ),
                  30.height,
                  Text("Share\nInformation",
                      style: boldTextStyle(
                          size: 30, color: Banking_TextColorPrimary)),
                ],
              ),
              20.height,
              Row(
                children: <Widget>[

                  10.width,

                  RichText(
                    text: TextSpan(children: [
                      TextSpan(
                          text: authController.myUser.value.name,
                          style: TextStyle(
                              color: Colors.green,
                              fontSize: 16,
                              fontWeight: FontWeight.bold)),
                    ]),
                  ),

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


                ],
              ),
              20.height,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(Banking_lbl_Account_Number,
                      style: primaryTextStyle(
                          color: Banking_TextColorPrimary,
                          size: 18,
                          fontFamily: fontSemiBold)),
                  Text("123 456 789",
                      style:
                          primaryTextStyle(size: 18, fontFamily: fontSemiBold)),
                ],
              ),
              Divider(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(Banking_lbl_Bank,
                      style: primaryTextStyle(
                          color: Banking_TextColorPrimary,
                          size: 18,
                          fontFamily: fontSemiBold)),
                  Text(Banking_lbl_app_Name,
                      style:
                          primaryTextStyle(size: 18, fontFamily: fontSemiBold)),
                ],
              ).paddingOnly(bottom: spacing_middle),
              Divider(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(Banking_lbl_Branch,
                      style: primaryTextStyle(
                          color: Banking_TextColorPrimary,
                          size: 18,
                          fontFamily: fontSemiBold)),
                  Text("Head Office Branch",
                      style:
                          primaryTextStyle(size: 18, fontFamily: fontSemiBold)),
                ],
              ),
              Divider(height: 24),
              Text(Banking_lbl_QR_Code,
                  style: primaryTextStyle(
                      color: Banking_TextColorPrimary,
                      size: 18,
                      fontFamily: fontSemiBold)),
              20.height,
              Image.asset(Banking_ic_QR,
                      height: 100, width: 100, fit: BoxFit.fill)
                  .center(),
              20.height,
              Text(Banking_lbl_Share_Info,
                  style: primaryTextStyle(
                      color: Banking_TextColorPrimary,
                      size: 18,
                      fontFamily: fontSemiBold)),
              40.height,
              Container(
                height: 50,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: mList1.length,
                  shrinkWrap: true,
                  padding: EdgeInsets.only(right: spacing_standard_new),
                  physics: ScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      height: 20,
                      width: 50,
                      margin: EdgeInsets.only(right: 16),
                      padding: EdgeInsets.all(8),
                      decoration: boxDecorationWithShadow(
                          borderRadius: BorderRadius.circular(10),
                          backgroundColor: Banking_whitePureColor,
                          boxShadow: defaultBoxShadow()),
                      child:
                          Image.asset(mList1[index].icon, height: 30, width: 30)
                              .center(),
                    );
                  },
                ),
              ).center(),
              SizedBox(height: 20,),
            ],
          ),
        ),
      ),
    );
  }
}
