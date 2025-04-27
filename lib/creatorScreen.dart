import 'dart:js_interop';

import 'package:collarcode/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:html' as html;
import 'package:qr_flutter/qr_flutter.dart';
import 'dart:js' as js;
import 'package:intl_phone_field/intl_phone_field.dart';
class CreatorScreen extends StatefulWidget {
  const CreatorScreen({super.key});

  @override
  State<CreatorScreen> createState() => _CreatorScreenState();
}

class _CreatorScreenState extends State<CreatorScreen> {
  final TextEditingController _petNameController = TextEditingController();
  final TextEditingController _petTypeController = TextEditingController();
  final TextEditingController _ownerNameController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  void dispose() {
    _petNameController.dispose();
    _petTypeController.dispose();
    _ownerNameController.dispose();
    _phoneNumberController.dispose();
    _emailController.dispose();
    _addressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: SafeArea(
          child: Container(
        margin: EdgeInsets.symmetric(
            horizontal: MediaQuery.sizeOf(context).width * 0.06),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: MediaQuery.sizeOf(context).height * 0.03),
              Text(
                "CollarCode",
                style: headTitleText, // Assuming headTitleText is defined
              ),
              SizedBox(height: MediaQuery.sizeOf(context).height * 0.03),
              TextField(
                controller: _petNameController,
                decoration: textfieldStyle(
                    hintText:
                        "Pet Name*"), // Assuming textfieldStyle is defined
              ),
              SizedBox(height: MediaQuery.sizeOf(context).height * 0.03),
              TextField(
                controller: _petTypeController,
                decoration: textfieldStyle(hintText: "Pet Type*"),
              ),
              SizedBox(height: MediaQuery.sizeOf(context).height * 0.03),
              TextField(
                controller: _ownerNameController,
                decoration: textfieldStyle(hintText: "Owner Name*"),
              ),
              SizedBox(height: MediaQuery.sizeOf(context).height * 0.03),
            
              IntlPhoneField(
                keyboardType: TextInputType.phone, // Specifically for phone numbers
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly, // Only allow digits
                ],
                       controller: _phoneNumberController,
                decoration: textfieldStyle(hintText: "Phone Number"),),
              SizedBox(height: MediaQuery.sizeOf(context).height * 0.01),
              TextField(
                controller: _emailController,
                decoration: textfieldStyle(hintText: "Email"),
              ),
              SizedBox(height: MediaQuery.sizeOf(context).height * 0.03),
              TextField(
                controller: _addressController,
                decoration: textfieldStyle(hintText: "Address"),
              ),
              SizedBox(height: MediaQuery.sizeOf(context).height * 0.03),
              Container(
                height: MediaQuery.sizeOf(context).height * 0.06,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () async {
                    if (_petNameController.text == "" ||
                        _petTypeController.text == "" ||
                        _ownerNameController.text == "" 
                       ) {
                      js.context.callMethod(
                          'alert', ["Please fill all * marked TextField"]);
                    } else {
                      final qrImage = await QrPainter(
                        data:
                            '${html.window.location.origin}/#/tag/${_petNameController.text}/${_petTypeController.text}/${_ownerNameController.text}/${_phoneNumberController.text==""? "e" :_phoneNumberController.text }/${_emailController.text == "" ? "e" : _emailController.text}/${_addressController.text == "" ? "e" : _addressController.text}',
                        version: QrVersions.auto,
                        gapless: false,
                      ).toImageData(200);
                      if (qrImage != null) {
                        Uint8List pngBytes = qrImage.buffer.asUint8List();

                        final blob = html.Blob([pngBytes]);
                        final url = html.Url.createObjectUrlFromBlob(blob);
                        final anchor = html.AnchorElement(href: url)
                          ..setAttribute("download", "qrcode.png")
                          ..click();
                        html.Url.revokeObjectUrl(url);
                      }
                    }
                  },
                  style: downloadButton,
                  child: Text(
                    "Download",
                    style: downloadButtonText,
                  ),
                ),
              )
            ],
          ),
        ),
      )),
    );
  }
}

InputDecoration textfieldStyle({required String hintText}) {
  var decoration = InputDecoration(
    border: OutlineInputBorder(),
    filled: false,
    focusedBorder: OutlineInputBorder(),
    hintText: hintText,
  );
  return decoration;
}
