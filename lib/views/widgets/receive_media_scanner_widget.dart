import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:ystop_mystop/core/app/images.dart';
import 'package:ystop_mystop/core/widgets/custom_appbar.dart';
import 'package:ystop_mystop/core/widgets/custom_button.dart';
import 'package:ystop_mystop/views/received_media/controller/received_media_controller.dart';
import '../../core/app/colors.dart';
import '../../core/app/snackbar.dart';
import '../../core/app/styles.dart';
import '../../core/app/texts.dart';
import '../../core/widgets/custom_text_field.dart';



enum ScanMode {Single,  Multiple
}
class ReceiveMediaScannerWidget extends StatefulWidget {

  final Function() onPressedDoneBtn;

const ReceiveMediaScannerWidget({
    required this.onPressedDoneBtn,
    Key? key, // Add a Key parameter here
  }) : super(key: key); // Move the key parameter to the constructor  @override

 _ReceiveMediaScannerWidgetState createState() => _ReceiveMediaScannerWidgetState();
}

class _ReceiveMediaScannerWidgetState extends State<ReceiveMediaScannerWidget>
    with SingleTickerProviderStateMixin {
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
String? _currentQRCode;
int? _currentQuantity;
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
                    Positioned.fill(
                      child: Container(
                        alignment: Alignment.center,
                        child: SizedBox(
                          width: size!.width * 0.8,
                          height: size!.height * 0.6,
                          child: Image.asset(AppImages.qrDummy),
                        ),
                      ),
                    ),
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


            _currentQRCode = qrCode;
            if(!Get.isSnackbarOpen){
      CustomSnackbar.showSuccess('This pigeonhole has been scanned.');

            }

  
  });
   
    setState(() {
    });
  }

   


void _onTickButtonPressed() {
  // When the user clicks the tick icon after entering quantity
  // You can call this method from the tick icon's onPressed callback
  // This method will store the QR code and quantity in the list
  // Assuming you have a variable to store the currently entered QR code and quantity


  if (_currentQRCode != null && _currentQuantity != null) {
    // Add the scanned pigeonhole and quantity to the list
    scannedPigeonholes.add({
      'qrCode': _currentQRCode,
      'quantity': _currentQuantity,
    });
// Update the scannedPigeonholesLength variable and trigger a rebuild of the UI
  setState(() {
    scannedPigeonholesLength = scannedPigeonholes.length.toString();
  });

    // Show a snackbar or toast message to indicate that the data is added to the list
    CustomSnackbar.showSuccess('Pigeonhole and quantity added to the list.');
    Get.find<ReceiveMediaController>().scannedPigeonholes = scannedPigeonholes;
    // Clear the entered QR code and quantity variables for the next operation
    _currentQRCode = null;
    _currentQuantity = null;
   
       numberController.clear();
       numberController = TextEditingController(text: "");
  
  }
  else if(_currentQRCode == null && _currentQuantity == null){
    if(!Get.isSnackbarOpen){
 CustomSnackbar.showError('Please scan a pigeonhole and enter its quantity.');
    }
       

  }
  else if(_currentQuantity == null){
    if(!Get.isSnackbarOpen){
  CustomSnackbar.showError('Please enter quantity.');
    }
    

  }
   else {
    if(!Get.isSnackbarOpen){
CustomSnackbar.showError('Please scan a pigeonhole.');
    }
     
  }
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
              child: ListView(
                shrinkWrap: true,
                children: [
                  const SizedBox(height: 40,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(scannedPigeonholesLength),
                      Align(
                        alignment: Alignment.topRight,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: InkWell(
                            onTap: (){
                              _onTickButtonPressed();
                            },
                            child: Image.asset(AppImages.tick)),
                        ),
                      ),
                    ],
                  ),
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
                          _currentQuantity =  int.parse(numberController.text);
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
      text: AppTexts.done,
      onPressed: onPressed,
      backgroundColor: AppColors.mainThemeColor,
    );
  }



    
