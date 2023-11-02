import 'package:cbi/data/models/pdfView.dart';
import 'package:cbi/presentation/utils/app_images.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import 'package:pdf/widgets.dart' as pw;

class TCCPDFViewPage {
  static Future<Uint8List> generateTransactionPDf({
    required PdfViewModel pdfViewModel,
  }) async {
    final pdf = Document();
    var appLogo = pw.MemoryImage(
      (await rootBundle.load(AppImages.appLogo)).buffer.asUint8List(),
    );
    var icHome = pw.MemoryImage(
      (await rootBundle.load(AppImages.home)).buffer.asUint8List(),
    );
    var icEmail = pw.MemoryImage(
      (await rootBundle.load(AppImages.icEmail)).buffer.asUint8List(),
    );
    var icPhone = pw.MemoryImage(
      (await rootBundle.load(AppImages.icPhone)).buffer.asUint8List(),
    );
    var icSend = pw.MemoryImage(
      (await rootBundle.load(AppImages.icSend)).buffer.asUint8List(),
    );
    var outputFormat = DateFormat('MM/dd/yyyy hh:mm a');
    var outputDate = outputFormat.format(DateTime.now());

    /// VAT

    pdf.addPage(
      pw.MultiPage(
        margin: const pw.EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        build: (context) => [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              pw.Image(
                height: 150,
                width: 150,
                appLogo,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(children: [
                    Text(
                      "ALBERTON (Head Office)",
                      style: pw.TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ]),
                  Row(children: [
                    Text(
                      "Address: 11 Helston Road, New Redruth, Alberton",
                      style: const pw.TextStyle(
                        fontSize: 10,
                      ),
                    ),
                    SizedBox(width: 4),
                    pw.Image(
                      height: 10,
                      width: 10,
                      icHome,
                    ),
                  ]),
                  Row(children: [
                    Text(
                      "Tel: 011 450 3734 | Fax: 086 747 8485",
                      style: const pw.TextStyle(
                        fontSize: 10,
                      ),
                    ),
                    SizedBox(width: 4),
                    pw.Image(
                      height: 10,
                      width: 10,
                      icPhone,
                    ),
                  ]),
                  Row(children: [
                    Text(
                      "P.O Box 446, Bedfordview, 2008, Docex 7 Bedfordview",
                      style: const pw.TextStyle(
                        fontSize: 10,
                      ),
                    ),
                    SizedBox(width: 4),
                    pw.Image(
                      height: 10,
                      width: 10,
                      icSend,
                    ),
                  ]),
                  Row(children: [
                    Text(
                      "Email: alberton@bassoninc.co.za",
                      style: const pw.TextStyle(
                        fontSize: 10,
                      ),
                    ),
                    SizedBox(width: 4),
                    pw.Image(
                      height: 10,
                      width: 10,
                      icEmail,
                    ),
                  ]),
                ],
              ),
            ],
          ),
          pw.Divider(
            endIndent: 20,
            indent: 20,
            thickness: 1,
            color: const PdfColor.fromInt(0xFF860004),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "PURCHASE PRICE: ${pdfViewModel.purchasePrice}",
                  style: const pw.TextStyle(
                    fontSize: 12,
                  ),
                ),
                Text(
                  "DATE CREATED: $outputDate",
                  style: const pw.TextStyle(
                    fontSize: 12,
                  ),
                ),
                Text(
                  "To: Evette@bassoninc.co.za",
                  style: const pw.TextStyle(
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20.0),

          /// Headre
          pw.Table(
            border: pw.TableBorder.all(width: 0.2),
            children: [
              pw.TableRow(
                children: [
                  pw.Padding(
                    padding: const pw.EdgeInsets.all(6),
                    child: pw.Container(
                      width: 120,
                      child: pw.Align(
                        alignment: Alignment.centerLeft,
                        child: pw.Text(
                          textAlign: pw.TextAlign.center,
                          "Description",
                          style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  pw.Padding(
                    padding: const pw.EdgeInsets.all(6),
                    child: pw.Container(
                      width: 77,
                      child: pw.Center(
                        child: pw.Text(
                          textAlign: pw.TextAlign.center,
                          "Charges",
                          style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),

          /// Transfer Attorney Fess
          pw.Table(
            border: pw.TableBorder.all(width: 0.2),
            children: [
              pw.TableRow(
                children: [
                  pw.Padding(
                    padding: const pw.EdgeInsets.all(6),
                    child: pw.Container(
                      width: 120,
                      child: pw.Align(
                        alignment: Alignment.centerLeft,
                        child: pw.Text(
                          "Transfer Attorney Fess",
                          style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  pw.Padding(
                    padding: const pw.EdgeInsets.all(6),
                    child: pw.Container(
                      width: 77,
                      child: pw.Center(
                        child: pw.Text(
                          textAlign: pw.TextAlign.center,
                          "${pdfViewModel.transferAttorneyFees}",
                          style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ],
                decoration: const pw.BoxDecoration(color: PdfColors.indigo50),
              ),
            ],
          ),

          /// Postage's & Petties
          pw.Table(
            border: pw.TableBorder.all(width: 0.2),
            children: [
              pw.TableRow(
                children: [
                  pw.Padding(
                    padding: const pw.EdgeInsets.all(6),
                    child: pw.Container(
                      width: 120,
                      child: pw.Align(
                        alignment: Alignment.centerLeft,
                        child: pw.Text(
                          "Postage & Petties",
                          style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  pw.Padding(
                    padding: const pw.EdgeInsets.all(6),
                    child: pw.Container(
                      width: 77,
                      child: pw.Center(
                        child: pw.Text(
                          textAlign: pw.TextAlign.center,
                          "${pdfViewModel.postgesAndPetties}",
                          style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),

          /// Deed Office Fee
          pw.Table(
            border: pw.TableBorder.all(width: 0.2),
            children: [
              pw.TableRow(
                decoration: const pw.BoxDecoration(color: PdfColors.indigo50),
                children: [
                  pw.Padding(
                    padding: const pw.EdgeInsets.all(6),
                    child: pw.Container(
                      width: 120,
                      child: pw.Align(
                        alignment: Alignment.centerLeft,
                        child: pw.Text(
                          "Deed Office Fee",
                          style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  pw.Padding(
                    padding: const pw.EdgeInsets.all(6),
                    child: pw.Container(
                      width: 77,
                      child: pw.Center(
                        child: pw.Text(
                          textAlign: pw.TextAlign.center,
                          "${pdfViewModel.deedsOfficeFees}",
                          style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),

          /// Electronic Generation Fee
          pw.Table(
            border: pw.TableBorder.all(width: 0.2),
            children: [
              pw.TableRow(
                children: [
                  pw.Padding(
                    padding: const pw.EdgeInsets.all(6),
                    child: pw.Container(
                      width: 120,
                      child: pw.Align(
                        alignment: Alignment.centerLeft,
                        child: pw.Text(
                          "Electronic Generation Fee",
                          style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  pw.Padding(
                    padding: const pw.EdgeInsets.all(6),
                    child: pw.Container(
                      width: 77,
                      child: pw.Center(
                        child: pw.Text(
                          textAlign: pw.TextAlign.center,
                          "${pdfViewModel.electronicGenerationFee}",
                          style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),

          /// Fica Registration Fee
          pw.Table(
            border: pw.TableBorder.all(width: 0.2),
            children: [
              pw.TableRow(
                decoration: const pw.BoxDecoration(color: PdfColors.indigo50),
                children: [
                  pw.Padding(
                    padding: const pw.EdgeInsets.all(6),
                    child: pw.Container(
                      width: 120,
                      child: pw.Align(
                        alignment: Alignment.centerLeft,
                        child: pw.Text(
                          "Fica Registration Fee",
                          style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  pw.Padding(
                    padding: const pw.EdgeInsets.all(6),
                    child: pw.Container(
                      width: 77,
                      child: pw.Center(
                        child: pw.Text(
                          textAlign: pw.TextAlign.center,
                          "${pdfViewModel.ficaRegistrationFee}",
                          style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),

          /// Rates Clearance Fee
          pw.Table(
            border: pw.TableBorder.all(width: 0.2),
            children: [
              pw.TableRow(
                children: [
                  pw.Padding(
                    padding: const pw.EdgeInsets.all(6),
                    child: pw.Container(
                      width: 120,
                      child: pw.Align(
                        alignment: Alignment.centerLeft,
                        child: pw.Text(
                          "Rates Clearance Fee",
                          style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  pw.Padding(
                    padding: const pw.EdgeInsets.all(6),
                    child: pw.Container(
                      width: 77,
                      child: pw.Center(
                        child: pw.Text(
                          textAlign: pw.TextAlign.center,
                          "${pdfViewModel.ratesClearanceFee}",
                          style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),

          ///Transfer Duty
          pw.Table(
            border: pw.TableBorder.all(width: 0.2),
            children: [
              pw.TableRow(
                decoration: const pw.BoxDecoration(color: PdfColors.indigo50),
                children: [
                  pw.Padding(
                    padding: const pw.EdgeInsets.all(6),
                    child: pw.Container(
                      width: 120,
                      child: pw.Align(
                        alignment: Alignment.centerLeft,
                        child: pw.Text(
                          "Transfer Duty",
                          style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  pw.Padding(
                    padding: const pw.EdgeInsets.all(6),
                    child: pw.Container(
                      width: 77,
                      child: pw.Center(
                        child: pw.Text(
                          textAlign: pw.TextAlign.center,
                          "${pdfViewModel.transferDutye}",
                          style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),

          /// Deeds Office Search Fee
          pw.Table(
            border: pw.TableBorder.all(width: 0.2),
            children: [
              pw.TableRow(
                decoration: const pw.BoxDecoration(color: PdfColors.indigo50),
                children: [
                  pw.Padding(
                    padding: const pw.EdgeInsets.all(6),
                    child: pw.Container(
                      width: 120,
                      child: pw.Align(
                        alignment: Alignment.centerLeft,
                        child: pw.Text(
                          "Deeds Office Search Fee",
                          style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  pw.Padding(
                    padding: const pw.EdgeInsets.all(6),
                    child: pw.Container(
                      width: 77,
                      child: pw.Center(
                        child: pw.Text(
                          textAlign: pw.TextAlign.center,
                          "${pdfViewModel.deedsOfficeSearchFee}",
                          style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),

          /// Total
          pw.Table(
            border: pw.TableBorder.all(width: 0.2),
            children: [
              pw.TableRow(
                decoration: const pw.BoxDecoration(color: PdfColors.red600),
                children: [
                  pw.Padding(
                    padding: const pw.EdgeInsets.all(6),
                    child: pw.Container(
                      width: 120,
                      child: pw.Align(
                        alignment: Alignment.centerLeft,
                        child: pw.Text(
                          "Total",
                          style: pw.TextStyle(
                              fontWeight: pw.FontWeight.bold,
                              color: PdfColors.white),
                        ),
                      ),
                    ),
                  ),
                  pw.Padding(
                    padding: const pw.EdgeInsets.all(6),
                    child: pw.Container(
                      width: 77,
                      child: pw.Center(
                        child: pw.Text(
                          textAlign: pw.TextAlign.center,
                          "${pdfViewModel.total}",
                          style: pw.TextStyle(
                              fontWeight: pw.FontWeight.bold,
                              color: PdfColors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 30),
          Text(
            "Estimated transfer quotation for selected purchase price",
            style: const pw.TextStyle(
              fontSize: 11,
            ),
          ),
          SizedBox(height: 10),
          Text(
              style: const pw.TextStyle(
                fontSize: 10,
              ),
              "Please note that all values returned by the Transfer cost calculator are quotation values subject to change. Although every effort has been made to ensure the accuracy of the content, CBI Attorneys accepts no liability in respect of any errors contained herein. Under no circumstances will CBI Attorneys be liable for any loss or damages whatsoever arising from the use of this calculator."),
          SizedBox(height: 11),
          Text(
              style: const pw.TextStyle(
                fontSize: 11,
              ),
              "The below costs exclude the following: rate clearance figures, levy figures, fees for registration of notarial deeds in respect exclusive use areas (sectional title properties)."),
          SizedBox(height: 10),
          Text(
              style: const pw.TextStyle(
                fontSize: 10,
              ),
              "f the seller is a VAT vendor; VAT is payable at 15% and NO Transfer Duty is payable. No distinction is made between Transfer Duty payable for natural and legal person"),
          SizedBox(height: 10),

          pw.Divider(
            endIndent: 20,
            indent: 20,
            thickness: 1,
            color: const PdfColor.fromInt(0xFF860004),
          ),


          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Also at:  WESTRAND",
                  style: pw.TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "             Ground Floor, Gateview House Block A1, Constantia Office Park,",
                  style: const pw.TextStyle(
                    fontSize: 10,
                  ),
                ),
                Text(
                  "              Vlakhaas Avenue,Weltevredenpark, Roodepoort",
                  style: const pw.TextStyle(
                    fontSize: 10,
                  ),
                ),
                Text(
                  "              Tel: 010 880 5409 | Fax: 086 747 8480",
                  style: const pw.TextStyle(
                    fontSize: 10,
                  ),
                ),
                Text(
                  "              Email: westrand@bassoninc.co.za",
                  style: const pw.TextStyle(
                    fontSize: 10,
                  ),
                ),
              ],
            ),
            Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
              Text(
                "NORTHRAND",
                style: pw.TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "Ground Floor, Unit 4 Manhattan Office Park",
                style: const pw.TextStyle(
                  fontSize: 10,
                ),
              ), Text(
                "16 Pieter Street, Highveld Techno Park, Centurion",
                style: const pw.TextStyle(
                  fontSize: 10,
                ),
              ), Text(
                "Tel: 012 030 3450 | Fax: 086 484 7708",
                style: const pw.TextStyle(
                  fontSize: 10,
                ),
              ), Text(
                "Email: northrand@bassoninc.co.za",
                style: const pw.TextStyle(
                  fontSize: 10,
                ),
              ),
            ]),
          ]),
          SizedBox(height: 10.0),

          Text(
              style: const pw.TextStyle(
                fontSize: 10,
              ),
              "Directors: Carel Lodewyk Basson (B. Proc) (Conveyancer) | Hilda Erasmus van Noordwyk (B. Proc) (Conveyancer and Notary)",
              textAlign: TextAlign.center),
          pw.Center(
              child: Text(
            style: const pw.TextStyle(
              fontSize: 10,
            ),
            "Associates: Nicole Lai (LLB) Pavidhar Sewpersad (LLB) (Conveyancer)",
            textAlign: TextAlign.center,
          )),
          pw.Center(
              child: Text(
            style: const pw.TextStyle(
              fontSize: 10,
            ),
            "Carel Basson Incorporated | Reg no. 2006/038 240/21 | B-BBEE Level 2 Contributor",
            textAlign: TextAlign.center,
          )),
        ],
      ),
    );
    return pdf.save();
  }
}
