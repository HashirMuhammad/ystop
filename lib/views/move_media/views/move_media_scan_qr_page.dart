import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ystop_mystop/core/app/texts.dart';
import 'package:ystop_mystop/core/widgets/custom_appbar.dart';
import 'package:ystop_mystop/core/widgets/qr_code_scanner_widget.dart';
import 'package:ystop_mystop/core/widgets/scan_qr_code.dart';
import 'package:ystop_mystop/routes.dart';
import 'package:ystop_mystop/views/move_media/controller/move_media_controller.dart';



class MoveMediaMediaScanQRPage extends GetView<MoveMediaController>{
  const MoveMediaMediaScanQRPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(context: context,title: AppTexts.moveMedia,),
      body: GetBuilder<MoveMediaController>(
        init: MoveMediaController(),
        builder: (_)=> ScanQrCode(
          onPressedScanQrCode: () {
            Get.to(QRCodeScannerWidget(
              numberController: controller.numberTextEditingController ,
             onPressedDoneBtn: (){
              Get.toNamed(AppRoutes.moveMediaDetailPage);
             },));
        
          },
        ),
      ));
  }

}