
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import '../widgets/gesture_detector.dart';

class ScanQR extends StatefulWidget {
  const ScanQR({super.key});

  @override
  State<ScanQR> createState() => _ScanQRState();
}

class _ScanQRState extends State<ScanQR> {
  //* qr scan transaction
  bool isScanComplete = false;

  //* flash bool
  bool isFlash = false;

  //* cam bool
  bool isCam = false;
  String qrResult = '';

  //* toggle flash controller
  MobileScannerController controller = MobileScannerController();

  //* change page
  void closeScanner() {
    setState(() {
      isScanComplete = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final key = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: key,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          'Scanner',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            //* Body title
            Expanded(
              child: Column(
                children: [
                  Text(
                    "Placer la camera sur le Qrcode",
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  Text(
                    "Scanne Automatiquement",
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                ],
              ),
            ),

            //* Camera Container
            Expanded(
              flex: 2,
              child: MobileScanner(
                controller: controller,
                onDetect: (capture) {
                  if (!isScanComplete) {
                    final List<Barcode> barcodes = capture.barcodes;
                    final Uint8List? image = capture.image;
                    for(final barcode in barcodes) {
                      qrResult = barcode.rawValue!;
                      print(qrResult);
                    }
                    setState(() {
                      isScanComplete = true;
                    });
                    /*Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => QrResultPage(
                          closeScreen: closeScanner,
                          qrResult: qrResult,
                        ),
                      ),
                    );*/
                  }
                },
              ),
            ),

            //* Tools Container
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  //* flash toggle
                  ClickDetect(
                    onPressed: () {
                      HapticFeedback.heavyImpact();
                      setState(() {
                        isFlash = !isFlash;
                      });
                      controller.toggleTorch();
                    },
                    icon: Icon(
                      Icons.flash_on,
                      color: isFlash ? Colors.yellow : Colors.white,
                    ),
                  ),

                  //* camera toggle
                  ClickDetect(
                    onPressed: () {
                      HapticFeedback.heavyImpact();
                      setState(() {
                        isCam = !isCam;
                      });
                      controller.switchCamera();
                    },
                    icon: const Icon(
                      Icons.switch_camera_outlined,
                      color: Colors.white,
                    ),
                  ),

                  //* gallery toggle
                  ClickDetect(
                    onPressed: () {
                      HapticFeedback.heavyImpact();
                    },
                    icon: const Icon(
                      Icons.browse_gallery_outlined,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
