import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

import 'modalclass.dart';

class InvoiceGenerator extends StatefulWidget {
  const InvoiceGenerator({Key? key}) : super(key: key);

  @override
  State<InvoiceGenerator> createState() => _InvoiceGeneratorState();
}

class _InvoiceGeneratorState extends State<InvoiceGenerator> {
  @override
  final globalkey = new GlobalKey();

  Widget build(BuildContext context) {
    Future<void> getpdf1() async {
      pw.Document pdf = pw.Document();

      pdf.addPage(pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) => pw.Column(children: [
          pw.Padding(
            padding: pw.EdgeInsets.all(8),
            child: pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                pw.Padding(
                  padding: pw.EdgeInsets.all(8.0),
                  child: pw.Text(
                    "Invoice Maker",
                    style: pw.TextStyle(fontSize: 20, color: PdfColors.grey),
                  ),
                ),
                pw.Padding(
                  padding: pw.EdgeInsets.all(8.0),
                  child: pw.Text(
                    "Name : Neel Maniya",
                  ),
                ),
                pw.Padding(
                  padding: pw.EdgeInsets.only(left: 8),
                  child: pw.Text(
                    "Mobile : 1234567890",
                  ),
                ),
                pw.SizedBox(
                  height: 10,
                ),
                pw.Padding(
                  padding: pw.EdgeInsets.all(8.0),
                  child: pw.Row(
                    //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      pw.Container(
                          child: pw.Text("Product",
                              style:
                                  pw.TextStyle(fontSize: 12, letterSpacing: 1)),
                          width: 90,
                          color: PdfColors.grey,
                          alignment: pw.Alignment.center,
                          padding: pw.EdgeInsets.all(3)),
                      pw.SizedBox(
                        width: 5,
                      ),
                      pw.Container(
                          child: pw.Text("Price",
                              style:
                                  pw.TextStyle(letterSpacing: 1, fontSize: 12)),
                          width: 50,
                          color: PdfColors.grey,
                          alignment: pw.Alignment.center,
                          padding: pw.EdgeInsets.all(3)),
                      pw.SizedBox(
                        width: 5,
                      ),
                      pw.Container(
                          child: pw.Text("Qty",
                              style:
                                  pw.TextStyle(fontSize: 12, letterSpacing: 1)),
                          width: 40,
                          color: PdfColors.grey,
                          alignment: pw.Alignment.center,
                          padding: pw.EdgeInsets.all(3)),
                      pw.SizedBox(
                        width: 5,
                      ),
                      pw.Container(
                          child: pw.Text("Tax",
                              style:
                                  pw.TextStyle(fontSize: 12, letterSpacing: 1)),
                          width: 40,
                          color: PdfColors.grey,
                          alignment: pw.Alignment.center,
                          padding: pw.EdgeInsets.all(3)),
                      pw.SizedBox(
                        width: 5,
                      ),
                      pw.Container(
                          child: pw.Text("Amount",
                              style:
                                  pw.TextStyle(fontSize: 12, letterSpacing: 1)),
                          width: 80,
                          color: PdfColors.grey,
                          alignment: pw.Alignment.center,
                          padding: pw.EdgeInsets.all(3)),
                    ],
                  ),
                ),
                pw.Text(
                    "--------------------------------------------------------------------------"),
                pw.SizedBox(
                  height: 20,
                ),
                pw.Container(
                    child: pw.Text(
                      "",
                      // "${tx.totalQ}",
                      style: pw.TextStyle(
                        fontSize: 12,
                      ),
                    ),
                    color: PdfColors.grey,
                    padding: pw.EdgeInsets.all(10)),
                pw.SizedBox(
                  height: 10,
                ),
                pw.Container(
                    child: pw.Text("",
                        // child: pw.Text("Total Amount : ${tx.totalAmount}/-",
                        style: pw.TextStyle(fontSize: 12)),
                    color: PdfColors.grey,
                    padding: pw.EdgeInsets.all(10)),
                pw.SizedBox(
                  height: 10,
                ),
                pw.Padding(
                  padding: pw.EdgeInsets.all(8.0),
                  child: pw.Container(
                    height: 150,
                    // child: Image.asset("assets/images/done.png"),
                  ),
                ),
                pw.Padding(
                  padding: pw.EdgeInsets.all(8.0),
                  child: pw.Text(
                    "Neel Maniya",
                    style: pw.TextStyle(fontSize: 18),
                  ),
                ),
                pw.Padding(
                  padding: pw.EdgeInsets.all(8.0),
                  child: pw.Text(
                    "19-03-2023",
                    style: pw.TextStyle(fontSize: 10),
                  ),
                ),
              ],
            ),
          ),
        ]),
      ));

      Uint8List data = await pdf.save();
      await Printing.layoutPdf(
        onLayout: (format) => data,
      );
    }

    //List<InvoiceModle> product = ModalRoute.of(context)!.settings.arguments as List<InvoiceModle>;
    totalModel tx = ModalRoute.of(context)!.settings.arguments as totalModel;

    return SafeArea(
      child: RepaintBoundary(
        key: globalkey,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            centerTitle: true,
            title: Text("Invoice Maker",
                style: TextStyle(
                    color: Colors.blue,
                    fontSize: 25,
                    fontWeight: FontWeight.w500)),
            actions: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                    onTap: () {
                      getpdf1();
                    },
                    child: Icon(Icons.save, color: Colors.black)),
              ),
            ],
          ),
          backgroundColor: Colors.grey.shade200,
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Product Details",
                      style: TextStyle(fontSize: 20, color: Colors.green),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child:
                        Text("Name :Neel Maniya", style: GoogleFonts.ptMono()),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Text("Mobile : 1234567890",
                        style: GoogleFonts.ptMono()),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 40),
                          child: Container(
                              child: Text("Product",
                                  style: TextStyle(
                                      fontSize: 12, letterSpacing: 1)),
                              width: 90,
                              color: Colors.grey,
                              alignment: Alignment.center,
                              padding: EdgeInsets.all(3)),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Container(
                            child: Text("Price",
                                style:
                                    TextStyle(letterSpacing: 1, fontSize: 12)),
                            width: 50,
                            color: Colors.grey,
                            alignment: Alignment.center,
                            padding: EdgeInsets.all(3)),
                        SizedBox(
                          width: 5,
                        ),
                        Container(
                            child: Text("Qty",
                                style:
                                    TextStyle(fontSize: 12, letterSpacing: 1)),
                            width: 40,
                            color: Colors.grey,
                            alignment: Alignment.center,
                            padding: EdgeInsets.all(3)),
                        SizedBox(
                          width: 5,
                        ),
                        // Container(
                        //     child: Text("Tax",
                        //         style: TextStyle(
                        //             fontSize: 12, letterSpacing: 1)),
                        //     width: 40,
                        //     color: Colors.grey,
                        //     alignment: Alignment.center,
                        //     padding: EdgeInsets.all(3)),
                        // SizedBox(
                        //   width: 5,
                        // ),
                        Container(
                            child: Text("Amount",
                                style:
                                    TextStyle(fontSize: 12, letterSpacing: 1)),
                            width: 80,
                            color: Colors.grey,
                            alignment: Alignment.center,
                            padding: EdgeInsets.all(3)),
                      ],
                    ),
                  ),
                  ListView.builder(
                    physics: BouncingScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return dataEntry(
                          tx.prList![index].productName!,
                          tx.prList![index].productPrice!,
                          tx.prList![index].productQty!,
                          "18",
                          tx.prList![index].productAmount!);
                    },
                    itemCount: tx.prList?.length,
                  ),
                  Text(
                      "--------------------------------------------------------------------------"),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                              child: Text("Total Quantity : ${tx.totalQ}",
                                  style: TextStyle(fontSize: 12)),
                              color: Colors.grey,
                              padding: EdgeInsets.all(10)),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                              child: Text("Total Amount : ${tx.totalAmount}/-",
                                  style: TextStyle(fontSize: 12)),
                              color: Colors.grey,
                              padding: EdgeInsets.all(10)),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 320,
                      width: 320,
                      child: Image.network(
                          "https://lh5.googleusercontent.com/p/AF1QipOtFhUFzyO4AlRXYIBF2T-6yZSeA6zcBkoBW6Xz"),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Neel Maniya",
                      style: GoogleFonts.sacramento(
                          fontWeight: FontWeight.w600, fontSize: 18),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "01-04-2023",
                      style: GoogleFonts.ptMono(
                          fontWeight: FontWeight.w600, fontSize: 10),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget dataEntry(
      String name, String price, String qty, String tax, String amount) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              child: Text("$name", style: TextStyle(fontSize: 11)),
              width: 90,
              alignment: Alignment.center,
              padding: EdgeInsets.all(3)),
          SizedBox(
            width: 5,
          ),
          Container(
              child: Text("$price", style: TextStyle(fontSize: 11)),
              width: 50,
              alignment: Alignment.center,
              padding: EdgeInsets.all(3)),
          SizedBox(
            width: 5,
          ),
          Container(
            child: Text("$qty", style: TextStyle(fontSize: 11)),
            width: 40,
            alignment: Alignment.center,
            padding: EdgeInsets.all(3),
          ),
          SizedBox(
            width: 5,
          ),
          Container(
              child: Text("$amount", style: GoogleFonts.ptMono(fontSize: 11)),
              width: 80,
              alignment: Alignment.center,
              padding: EdgeInsets.all(3)),
        ],
      ),
    );
  }
