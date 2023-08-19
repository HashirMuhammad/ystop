import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:ystop_mystop/core/app/images.dart';
import 'package:ystop_mystop/core/widgets/custom_appbar.dart';
import 'package:ystop_mystop/core/widgets/custom_button.dart';
import '../../../../core/app/colors.dart';
import '../../../../core/app/snackbar.dart';
import '../../../../core/app/styles.dart';
import '../../../../core/app/texts.dart';
import '../../../../core/widgets/custom_text_field.dart';





enum ScanMode {Single,  Multiple
}

class SelectedJobScanQRCodePage extends StatefulWidget  {
  
  final Function() onPressedDoneBtn;
  const SelectedJobScanQRCodePage({super.key, required this.onPressedDoneBtn});

  @override
  State<SelectedJobScanQRCodePage> createState() => _SelectedJobScanQRCodePageState();
}

class _SelectedJobScanQRCodePageState extends State<SelectedJobScanQRCodePage> with SingleTickerProviderStateMixin{

  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? controller;
  late AnimationController animationController;
  late Animation<double> animation;
   bool sourcePigeonholeScanned = false; // Track if the source pigeonhole is scanned
   String? sourcePigeonholeQRCode;

 Size? size;
  double? imageHeight;
  bool isFlashOn = false;
   String scannedPigeonholesLength = '';
 List<Map<String, dynamic>> scannedPigeonholes = [];
TextEditingController numberController = TextEditingController();

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );
    animation = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
      parent: animationController,
      curve: Curves.linear,
    ));
    animationController.repeat(reverse: true);
  }

  @override
  void dispose() {
    controller?.dispose();
    animationController.dispose();
    super.dispose();
  }


 @override
Widget build(BuildContext context) {
  size = MediaQuery.of(context).size;
  imageHeight = size!.height * 0.6;

  return Scaffold(
    appBar: CustomAppBar(
      context: context,
      title: "Scan Pigeonhole",
      appBarAction: IconButton(
        icon: Icon(
          isFlashOn ? Icons.flash_on : Icons.flash_off,
          color: Colors.white,
        ),
        onPressed: _toggleFlash,
      ),
      isAppBarActions: true,
      appBarColor: AppColors.primaryGreyColor,
      titleColor: AppColors.primaryWhite,
      leadingIconColor: AppColors.primaryWhite,
    ),
    backgroundColor: AppColors.primaryGreyColor,
    body: Column(
      children: [
        SizedBox(height: size!.height * 0.05),
        Expanded( // Wrap the Column with Expanded
          child: Center(
            child: Container(
              width: size!.width * 0.8,
              height: size!.height * 0.4,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white, width: 2.0),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Stack(
                  children: [
                    QRView(
                      key: qrKey,
                      onQRViewCreated: _onQRViewCreated,
                    ),
                    // Positioned.fill(
                    //   child: Container(
                    //     alignment: Alignment.center,
                    //     child: SizedBox(
                    //       width: size!.width * 0.8,
                    //       height: size!.height * 0.6,
                    //       child: Image.asset(AppImages.qrDummy),
                    //     ),
                    //   ),
                    // ),
                    AnimatedBuilder(
                      animation: animationController,
                      builder: (context, child) {
                        return Positioned(
                          top: imageHeight! * animation.value,
                          left: 0,
                          right: 0,
                          child: Column(
                            children: [
                              Container(
                                height: 3,
                                color: AppColors.mainThemeColor,
                              ),
                              const SizedBox(
                                height: 4,
                              ),
                              Container(
                                height: 3,
                                color: AppColors.mainThemeColor,
                              ),
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
        ),
        _bottomsheet(size!)
      ],
    ),
  );
}


  void _onQRViewCreated(QRViewController controller) {
         

    setState(() {
      this.controller = controller;
    });
 // Your QR code scanning logic here
  controller.scannedDataStream.listen((scanData) {
    String qrCode = scanData.code!;
        print('scandata////////////////// $qrCode');

    // Check if the scanned pigeonhole is already in the list


            if(!Get.isSnackbarOpen){
      CustomSnackbar.showSuccess('This pigeonhole has been scanned.');

            }

  
  });
   
    setState(() {
    });
  }

  

  void _toggleFlash() {
    setState(() {
      isFlashOn = !isFlashOn;
      controller?.toggleFlash();
    });
  }

Widget _bottomsheet(Size size) {
  return Stack(
    children: [
      SizedBox(
      
        height: size.height * 0.35,
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            decoration: const BoxDecoration(
              color: AppColors.primaryWhite,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25),
                topRight: Radius.circular(25),
              ),
            ),
            height: size.height * 0.3,
            width: size.width,
            child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18),
              child: Column(
             //   shrinkWrap: true,
                children: [
                  const SizedBox(height: 40,),
                  Text(scannedPigeonholesLength),
                    const SizedBox(height: 10,),
                    Center(
                      child: Text(
                        "Or Enter Number",
                        style: AppStyles.textStyleCustom.copyWith(fontSize: 22),
                      ),
                    ),
                    SizedBox(height: 10),
                      CustomTextField(
                        controller: numberController,
                        hintText: "Enter Here",
                        prefixIcon: Icon(Icons.draw_rounded),
                        onChanged: (val){
                          
                           numberController.text = val;
                           if(numberController.text.isNotEmpty){
                          setState(() {
                            
                          });
                          }
                      
                        },
                      
                        
                      ),
                        SizedBox(height: 20), // Added space after text field
                    Expanded(child: Container()), // Space filler
                    Center(child: _doneButton(widget.onPressedDoneBtn)),
                     SizedBox(height: 25),  
                ],
              ),
            ),
          ),
        ),
      ),
      
      Padding(
        padding: const EdgeInsets.only(top :12.0),
        child: Align(
          alignment: Alignment.topCenter,
          child: SizedBox(
            width: 70,
            height: 70,
            child: FittedBox(
              child: FloatingActionButton(
              
                onPressed: () {},
                backgroundColor: AppColors.mainThemeColor,
                
                child: Image.asset(AppImages.scanImage),
                
              ),
            ),
          ),
        ),
      ),
    ],
  );
}
}
 Widget _doneButton(Function() onPressed) {
    return CustomButtonWidget(
      text: AppTexts.next,
      onPressed: onPressed,
      backgroundColor: AppColors.mainThemeColor,
    );
  }

    
