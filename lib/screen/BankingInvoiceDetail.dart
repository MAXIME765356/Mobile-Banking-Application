import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import '../utils/BankingColors.dart';
import '../utils/BankingContants.dart';
import '../utils/BankingSlider.dart';
import '../utils/BankingStrings.dart';
import '../utils/BankingWidget.dart';

class BankingInvoiceDetail extends StatefulWidget {
  static var tag = "/BankingInvoiceDetail";

  @override
  _BankingInvoiceDetailState createState() => _BankingInvoiceDetailState();
}

class _BankingInvoiceDetailState extends State<BankingInvoiceDetail> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Banking_app_Background,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: spacing_standard_new),
            headerView(Banking_lbl_Pay_Voice, width * 0.34, context),
            Text("Choose Account to Transfer",
                    style: secondaryTextStyle(
                        color: Banking_TextColorSecondary,
                        size: 14,
                        fontFamily: fontRegular))
                .paddingOnly(
                    left: spacing_standard_new, top: spacing_standard_new),
            16.height,
            BankingSliderWidget(),
            Text("Invoice Mar 2023",
                    style: secondaryTextStyle(
                        color: Banking_TextColorSecondary,
                        size: 14,
                        fontFamily: fontRegular))
                .paddingOnly(
                    left: spacing_standard_new, top: spacing_standard_new),
            Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("Name",
                            style: primaryTextStyle(
                                color: Banking_TextColorSecondary,
                                size: 18,
                                fontFamily: fontRegular))
                        .paddingOnly(
                            left: spacing_standard_new,
                            top: spacing_standard_new),
                    Text("John Ako",
                            style: primaryTextStyle(
                                color: Banking_TextColorPrimary,
                                size: 18,
                                fontFamily: fontRegular))
                        .paddingOnly(
                            right: spacing_standard_new,
                            top: spacing_standard_new),
                  ],
                ),
                Divider().paddingOnly(
                    left: spacing_standard, right: spacing_standard)
              ],
            ),
            Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("Address",
                            style: primaryTextStyle(
                                color: Banking_TextColorSecondary,
                                size: 18,
                                fontFamily: fontRegular))
                        .paddingOnly(
                            left: spacing_standard_new,
                            top: spacing_standard_new),
                    Text("Ngoa Ekelle Yaoundé",
                            style: primaryTextStyle(
                                color: Banking_TextColorPrimary,
                                size: 18,
                                fontFamily: fontRegular))
                        .paddingOnly(
                            right: spacing_standard_new,
                            top: spacing_standard_new),
                  ],
                ),
                Divider().paddingOnly(
                    left: spacing_standard, right: spacing_standard)
              ],
            ),
            Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("Code",
                            style: primaryTextStyle(
                                color: Banking_TextColorSecondary,
                                size: 18,
                                fontFamily: fontRegular))
                        .paddingOnly(
                            left: spacing_standard_new,
                            top: spacing_standard_new),
                    Text("#7783",
                            style: primaryTextStyle(
                                color: Banking_TextColorPrimary,
                                size: 18,
                                fontFamily: fontRegular))
                        .paddingOnly(
                            right: spacing_standard_new,
                            top: spacing_standard_new),
                  ],
                ),
                Divider().paddingOnly(
                    left: spacing_standard, right: spacing_standard)
              ],
            ),
            Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("TimeService",
                            style: primaryTextStyle(
                                color: Banking_TextColorSecondary,
                                size: 18,
                                fontFamily: fontRegular))
                        .paddingOnly(
                            left: spacing_standard_new,
                            top: spacing_standard_new),
                    Text("25 Jan - 25 Feb",
                            style: primaryTextStyle(
                                color: Banking_TextColorPrimary,
                                size: 18,
                                fontFamily: fontRegular))
                        .paddingOnly(
                            right: spacing_standard_new,
                            top: spacing_standard_new),
                  ],
                ),
                Divider().paddingOnly(
                    left: spacing_standard, right: spacing_standard)
              ],
            ),
            Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("Amount Transaction",
                            style: primaryTextStyle(
                                color: Banking_TextColorSecondary,
                                size: 18,
                                fontFamily: fontRegular))
                        .paddingOnly(
                            left: spacing_standard_new,
                            top: spacing_standard_new),
                    Text("\200,000 FCFA",
                            style: primaryTextStyle(
                                color: Banking_TextColorPrimary,
                                size: 18,
                                fontFamily: fontRegular))
                        .paddingOnly(
                            right: spacing_standard_new,
                            top: spacing_standard_new),
                  ],
                ),
                Divider().paddingOnly(
                    left: spacing_standard, right: spacing_standard)
              ],
            ),
            16.height,
            BankingButton(textContent: Banking_lbl_Pay, onPressed: () {})
                .paddingOnly(
                    top: spacing_standard_new,
                    left: spacing_standard_new,
                    right: spacing_standard_new,
                    bottom: spacing_standard_new),
          ],
        ),
      ),
    );
  }
}
