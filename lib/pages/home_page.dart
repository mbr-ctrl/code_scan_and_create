import 'package:code_scan/pages/generate_qr.dart';
import 'package:code_scan/pages/scan_qr.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'QR CODE',
          style: GoogleFonts.getFont('Lato', color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(50.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Bienvenu', style: GoogleFonts.getFont('Lato', fontSize: 60.0),
                textAlign: TextAlign.center,
              ),
              Text(
                'Generer le code', style: GoogleFonts.getFont('Lato', fontSize: 15, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const Image(
                image: NetworkImage(
                    'https://media.istockphoto.com/vectors/qr-code-scan-phone-icon-in-comic-style-scanner-in-smartphone-vector-vector-id1166145556'),
              ),
              const SizedBox(height: 30.0),
              Button('Scan QR', const ScanQR()),
              const SizedBox(height: 15.0),
              Button('Generate Qr', const GenerateQr()),
              const SizedBox(height: 110.0),
            ],
          ),
        ),
      ),
    );
  }
  Widget Button(String text, Widget page){
    return Container(
      padding: const EdgeInsets.all(3.0),
      height: 50.0,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.black,
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            side: const BorderSide(
              color: Colors.black,
              width: 1.0,
              style: BorderStyle.solid
            ),
            borderRadius: BorderRadius.circular(32.0)
          )
        ),
        onPressed: () {
          Navigator.push(
              context,
            MaterialPageRoute(builder: (context) => page)
          );
        },
        child: Text(text, style: GoogleFonts.getFont('Lato', fontSize: 18.0)),
      ),
    );
  }
}
