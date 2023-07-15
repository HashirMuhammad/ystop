import 'package:get/get.dart';
import 'package:ystop_mystop/routes.dart';
import 'package:ystop_mystop/views/received_media/views/received_media_scan_qr_page.dart';

class AppPages {
  static final List<GetPage<dynamic>> pages = [
    GetPage<dynamic>(name: AppRoutes.receivedMediaScanQr, page: () => ReceiveMediaScanQRPage ()),       
  ];
}
