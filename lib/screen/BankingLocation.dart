import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import '../models/BankingModel.dart';
import '../utils/BankingColors.dart';
import '../utils/BankingContants.dart';
import '../utils/BankingDataGenerator.dart';
import '../utils/BankingImages.dart';
import '../utils/BankingStrings.dart';
import '../utils/BankingWidget.dart';

class BankingLocation extends StatefulWidget {
  static var tag = "/BankingLocation";

  @override
  _BankingLocationState createState() => _BankingLocationState();
}

class _BankingLocationState extends State<BankingLocation> {
  late List<BankingLocationModel> mList1;

  bool? isSelected;
  String? txtHeader;

  @override
  void initState() {
    super.initState();
    isSelected = false;
    mList1 = bankingLocationList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Banking_app_Background,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            30.height,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.chevron_left, size: 30, color: Banking_blackColor)
                    .onTap(
                  () {
                    finish(context);
                  },
                ),
                30.height,
                Text(Banking_lbl_Branch_Location,
                    style: boldTextStyle(
                        size: 30, color: Banking_TextColorPrimary)),
              ],
            ).paddingAll(16),
            Container(
                height: 250, width: context.width(), color: Banking_greyColor),
            Container(
              padding: EdgeInsets.all(16),
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: "Search Payment",
                      labelStyle:
                          primaryTextStyle(size: 18, color: Banking_greyColor),
                      suffixIcon: Icon(Icons.search, color: Banking_greyColor),
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black12)),
                      errorBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.red)),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Banking_greyColor)),
                    ),
                  ),
                  ListView.separated(
                    separatorBuilder: (BuildContext context, int index) =>
                        Divider(),
                    scrollDirection: Axis.vertical,
                    itemCount: mList1.length,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        padding: EdgeInsets.only(top: 8, bottom: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Image.asset(Banking_ic_Pin,
                                    color: Banking_Primary,
                                    height: 30,
                                    width: 30),
                                16.width,
                                Text(mList1[index].location!,
                                    style: primaryTextStyle(
                                        color: Banking_TextColorPrimary,
                                        size: 16,
                                        fontFamily: fontRegular)),
                              ],
                            ),
                            Text(mList1[index].m!,
                                style: primaryTextStyle(
                                    color: Banking_TextColorPrimary,
                                    size: 16,
                                    fontFamily: fontRegular)),
                          ],
                        ),
                      ).onTap(
                        () {
                          isSelected = true;
                          txtHeader = mList1[index].location;
                          setState(() {});
                        },
                      );
                    },
                  ).visible(isSelected == false),
                  30.height,
                  Column(
                    children: [
                      Row(
                        children: [
                          Image.asset(Banking_ic_Pin,
                              height: 30, color: Banking_palColor),
                          15.width,
                          Text('Yaoundé Marché Centrale',
                              style: primaryTextStyle(
                                  color: Banking_TextColorPrimary,
                                  size: 16,
                                  fontFamily: fontRegular)),
                        ],
                      ),
                      Divider(height: 35),
                      Row(
                        children: [
                          Image.asset(Banking_ic_Call,
                              height: 30, color: Banking_RedColor),
                          15.width,
                          Text('+680245612',
                              style: primaryTextStyle(
                                  color: Banking_TextColorPrimary,
                                  size: 16,
                                  fontFamily: fontRegular)),
                        ],
                      ),
                      Divider(height: 35),
                      Row(
                        children: [
                          Image.asset(Banking_ic_Website,
                              height: 30, color: Banking_blueColor),
                          15.width,
                          Text('https://unicsgroup.com',
                              style: primaryTextStyle(
                                  color: Banking_TextColorPrimary,
                                  size: 16,
                                  fontFamily: fontRegular)),
                        ],
                      ),
                      Divider(height: 35),
                      Row(
                        children: [
                          Image.asset(Banking_ic_Clock,
                              height: 30, color: Banking_greenLightColor),
                          15.width,
                          Text('07:30 - 17:00',
                              style: primaryTextStyle(
                                  color: Banking_TextColorPrimary,
                                  size: 16,
                                  fontFamily: fontRegular)),
                        ],
                      ),
                      Divider(height: 35),
                      BankingButton(
                        textContent: Banking_lbl_Go_to_this_Place,
                        onPressed: () {
                          isSelected = false;
                          setState(() {});
                        },
                      ),
                    ],
                  ).visible(isSelected == true),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
