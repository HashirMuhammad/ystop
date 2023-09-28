import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:ystop_mystop/core/app/colors.dart';
import 'package:ystop_mystop/core/app/images.dart';
import 'package:ystop_mystop/core/app/styles.dart';
import 'package:ystop_mystop/core/app/texts.dart';
import 'package:ystop_mystop/routes.dart';

class GenericScanView extends StatefulWidget {
  GenericScanView({super.key});

  @override
  State<GenericScanView> createState() => _GenericScanViewState();
}

class _GenericScanViewState extends State<GenericScanView> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            width: size.width,
            height: size.height,
            color: Color(0xff5C5E5F),
            child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              //appbar
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.arrow_back_ios_new,
                        color: Colors.white,
                      )),
                  Text(
                    'Scan media',
                    style: TextStyle(color: Colors.white),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.flash_on,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              //Qr
              Container(
                height: size.width * 0.8,
                width: size.width * 0.8,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(AppImages.qrDummy),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              //bottom
              Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Container(
                    height: 350,
                    width: size.width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    )),
                  ),
                  Container(
                    height: 300,
                    width: size.width,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30),
                        )),
                  ),
                  Positioned(
                    top: 0,
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          width: size.width,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: 20,
                              ),
                              Container(
                                height: 80,
                                width: 80,
                                decoration: BoxDecoration(
                                  color: AppColors.mainThemeColor,
                                  borderRadius: BorderRadius.circular(40),
                                ),
                                child: Image.asset(
                                  AppImages.scanImage,
                                  height: 30,
                                  width: 40,
                                ),
                              ),
                              Container(width: 20, child: Icon(Icons.gps_fixed)),
                            ],
                          ),
                        ),
                        SizedBox(height: 20),
                        Container(
                          width: size.width,
                          padding: const EdgeInsets.symmetric(horizontal: 30.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Radio(
                                    value: true,
                                    groupValue: true,
                                  fillColor: MaterialStateProperty.resolveWith ((Set  states) {
                                    if (states.contains(MaterialState.disabled)) {
                                      return Colors.orange.withOpacity(.32);
                                    }
                                    return Colors.orange;
                                  }),
                                    onChanged: (v) {},
                                  ),
                                  Text('QR Code Scan'),
                                ],
                              ),
                              Row(
                                children: [
                                  Radio(
                                    value: false,
                                    groupValue: true,
                                    fillColor: MaterialStateProperty.resolveWith ((Set  states) {
                                      if (states.contains(MaterialState.disabled)) {
                                        return Colors.orange.withOpacity(.32);
                                      }
                                      return AppColors.greyColor;
                                    }),
                                    onChanged: (v) {},
                                  ),
                                  Text('NFC Scan'),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Text(
                          'Or Enter Number',
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                        SizedBox(height: 20),
                        //textform
                        SizedBox(
                          width: size.width,
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20.0),
                            child: TextFormField(
                              decoration: InputDecoration(
                                filled: true,
                                isDense: true,
                                hintText: 'Enter Here',
                                prefixIcon: Icon(
                                  Icons.drive_file_rename_outline,
                                  color: Colors.grey,
                                  size: 20,
                                ),
                                hintStyle: TextStyle(color: Colors.grey),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: BorderSide(color: Colors.transparent),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: BorderSide(color: Colors.transparent),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: BorderSide(color: Colors.transparent),
                                ),
                                fillColor: Color(0xffF4F4F4),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        _buildContinueButton(context), SizedBox(height: 20),
                      ],
                    ),
                  ),
                ],
              ),
            ]),
          ),
        ),
      ),
    );
  }

  _buildContinueButton(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.065),
      child: InkWell(
        onTap: () async {
          Get.toNamed(AppRoutes.postedMediaPage);
        },
        child: Container(
          height: MediaQuery.of(context).size.height * 0.075,
          width: MediaQuery.of(context).size.width * 0.5,
          decoration: BoxDecoration(
            color: AppColors.mainThemeColor,
            borderRadius: BorderRadius.circular(47),
          ),
          child: Center(
            child: Text(
              'Next',
              style: AppStyles.forgotPasswordButtonStyle,
            ),
          ),
        ),
      ),
    );
  }
}
