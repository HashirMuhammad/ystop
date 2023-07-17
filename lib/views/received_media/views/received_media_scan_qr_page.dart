import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ystop_mystop/core/app/texts.dart';
import 'package:ystop_mystop/core/widgets/custom_appbar.dart';
import 'package:ystop_mystop/core/widgets/loading_widget.dart';
import 'package:ystop_mystop/core/widgets/qr_code_scanner_widget.dart';
import 'package:ystop_mystop/core/widgets/scan_qr_code.dart';
import 'package:ystop_mystop/routes.dart';
import '../controller/received_media_controller.dart';



class ReceiveMediaScanQRPage extends GetView<ReceiveMediaController>{
  const ReceiveMediaScanQRPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(context: context,title: AppTexts.receiveMedia,),
      body: GetX<ReceiveMediaController>(
        init: ReceiveMediaController(),
        builder: (_)=> Stack(
          children: <Widget>[
            ScanQrCode(
              onPressedScanQrCode: () {
                Get.to(QRCodeScannerWidget(
                  numberController: controller.numberTextEditingController ,
                 onPressedDoneBtn: (){
                  controller.receiveMedia();
                 
                 },));
            
              },
            ),
            if(controller.isLoading.value == ReceiveMediaLoadingType.parent)
            const LoadingWidget()
          ],
        ),
      ));
  }

}