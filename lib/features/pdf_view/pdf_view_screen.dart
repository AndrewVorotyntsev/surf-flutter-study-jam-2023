import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:surf_flutter_study_jam_2023/res/colors.dart';

///
class PdfViewScreen extends StatelessWidget {
  final String pdfSource;

  const PdfViewScreen(
    this.pdfSource, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: cardShadowColor.withOpacity(0.3),
                  spreadRadius: 0,
                  blurRadius: 20,
                  offset: const Offset(0, 0),
                ),
              ],
              borderRadius: BorderRadius.all(Radius.circular(5)),
            ),
            child: PDFView(
              filePath: pdfSource,
              enableSwipe: true,
              //swipeHorizontal: true,
              autoSpacing: false,
              pageFling: false,
            ),
          ),
        ),
      ),
    );
  }
}

/// Навигация к странице [PdfViewScreen]
class PdfViewScreenRoute extends MaterialPageRoute {
  PdfViewScreenRoute(String pdfSource)
      : super(
          builder: (context) => PdfViewScreen(pdfSource),
        );
}
