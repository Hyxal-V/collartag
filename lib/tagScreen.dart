import 'package:collarcode/styles.dart';
import 'package:flutter/material.dart';

class TagScreen extends StatelessWidget {
  final String petName;
  final String ownerName;
  final String phoneNumber;
  final String email;
  final String address;
  final String petType;

  const TagScreen(
      {super.key,
      required this.petName,
      required this.ownerName,
      required this.phoneNumber,
      required this.email,
      required this.address,
      required this.petType});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                padding: EdgeInsets.only(
                    left: MediaQuery.sizeOf(context).width * 0.05,
                    top: MediaQuery.sizeOf(context).height * 0.02,
                    bottom: MediaQuery.sizeOf(context).height * 0.001),
                child: Text("$petName", style: headText)),
            Container(
                padding: EdgeInsets.only(
                    left: MediaQuery.sizeOf(context).width * 0.05,
                    bottom: MediaQuery.sizeOf(context).height * 0.03),
                child: Text(
                  petType,
                  style: subHeadText,
                )),
            Container(
              padding:
                  EdgeInsets.only(left: MediaQuery.sizeOf(context).width * 0.05),
              child: Text.rich(TextSpan(children: [
                TextSpan(text: "Hey there! I'm with ", style: paraText),
                TextSpan(text: ownerName, style: paraBoldText),
                phoneNumber !="e"?
                TextSpan(text: ". If I am lost call ", style: paraText):TextSpan(text: ""),

                TextSpan(text: phoneNumber, style: paraBoldText),
                email != "e"
                    ? TextSpan(
                        text: ". You can contact me (email) at ", style: paraText)
                    : TextSpan(text: ""),
                email != "e"
                    ? TextSpan(text: email, style: paraBoldText)
                    : TextSpan(text: ""),
                address != "e"
                    ? TextSpan(text: ". I live at  ", style: paraText)
                    : TextSpan(text: ""),
                address != "e"
                    ? TextSpan(text: address, style: paraBoldText)
                    : TextSpan(text: ""),
              ])),
            ),
          ],
        ),
      ),
      backgroundColor: pickRandomColor(),
    );
  }
}
