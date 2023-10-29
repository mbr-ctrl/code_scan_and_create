import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:code_scan/widgets/gesture_detector.dart';

class GenerateQr extends StatefulWidget {
  const GenerateQr({super.key});

  @override
  State<GenerateQr> createState() => _GenerateQrState();
}

class _GenerateQrState extends State<GenerateQr> {
  String qrData = 'https://mubarakmohamed.com/';
  final qrText = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'Générateur de QR Code',
          style: GoogleFonts.getFont('Lato', color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(top: 40.0, left: 20.0, right: 20.0),
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text("Generer le QR Code",
                  style: GoogleFonts.getFont('Lato', fontSize: 30.0, fontWeight: FontWeight.w600, color: Colors.black),
                  textAlign: TextAlign.center),
              const SizedBox(
                height: 10.0,
              ),
              Container(
                alignment: Alignment.topRight,
                child: SizedBox(
                  height: 250,
                  child: QrImageView(
                    data: qrData,
                      version: QrVersions.auto,
                      size: 320,
                      gapless: false
                  ),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              const Divider(
                height: 20.0,
                thickness: 1.0,
                color: Colors.black,
                endIndent: 42.0,
                indent: 42.0,
              ),
              const SizedBox(
                height: 20.0,
              ),
              Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.only(left: 40.0, right: 40.0),
                child: Text(
                  "Il vous suffit d'entrer une adresse puis générer votre Qrcode",
                  style: GoogleFonts.getFont('Lato', fontSize: 17.0, fontWeight: FontWeight.w400, color: Colors.black),
                      textAlign: TextAlign.left,
                ),
              ),
              const SizedBox(
                height: 12.0,
              ),
              TextField(
                controller: qrText,
                decoration: const InputDecoration(
                  hintText: "entrez votre texte",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(
                        16.0,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 14.0,
              ),
              Container(
                padding: const EdgeInsets.only(left: 55.0, right: 55.0),
                height: 50.0,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.black,
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(
                        color: Colors.black,
                        width: 1.0,
                        style: BorderStyle.solid,
                      ),
                      borderRadius: BorderRadius.circular(
                        32.0,
                      ),
                    ),
                  ),
                  onPressed: () {
                    if (qrText.text.isEmpty) {
                      setState(() {
                        qrData = "https://mubarakmohamed.com/";
                        ScaffoldMessenger.of(context).showSnackBar(
                           SnackBar(
                            content: Text(
                              "Veuillez entrer un texte!",
                              style: GoogleFonts.getFont('Lato', fontSize: 17.0),
                            ),
                          ),
                        );
                      });
                    } else {
                      setState(() {
                        qrData = qrText.text;
                      });
                    }
                  },
                  child: Text(
                    "Générer le QR Code",
                    style: GoogleFonts.getFont('Lato', fontSize: 17.0, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const SizedBox(
                height: 30.0,
              ),
          //* tools
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              //*save
              ClickDetect(
                icon: const Icon(Icons.download),
                onPressed: () {
                HapticFeedback.heavyImpact();
                },
              ),
              ClickDetect(
                  icon: const Icon(Icons.share),
                  onPressed: () {
                  HapticFeedback.heavyImpact();
                  },
              )
            ],
          ),
          ]
        ),
      ),
      )
    );
  }
}
