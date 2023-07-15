import 'package:flutter/material.dart';
import 'package:ystop_mystop/core/app/texts.dart';
import 'package:ystop_mystop/core/widgets/custom_button.dart';

import '../app/images.dart';

class ScanQrCode extends StatelessWidget {
  final Function() onPressedScanQrCode;
  const ScanQrCode({required this.onPressedScanQrCode,super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context , BoxConstraints constraints) => Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: constraints.maxHeight * 0.1,),
          Center(
            child: Image.asset(
              
              AppImages.scanQr,
              fit: BoxFit.fill,
              width: constraints.maxWidth * 0.8,
              height: constraints.maxHeight * 0.45,
            ),
          ),
          const SizedBox(height: 40,),
          CustomButtonWidget(text: AppTexts.scanQrCode, onPressed: onPressedScanQrCode, isScanQrBtn: true,)
        ],
      ),
    );
  }
}