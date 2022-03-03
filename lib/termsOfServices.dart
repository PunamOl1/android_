import 'package:flutter/material.dart';

class TermsOfServices extends StatefulWidget {
  const TermsOfServices({Key? key}) : super(key: key);

  @override
  _TermsOfServicesState createState() => _TermsOfServicesState();
}

class _TermsOfServicesState extends State<TermsOfServices> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Terms  of Services"),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(120.0, 4.0, 15, 10.0),
                child: Text(
                    "Please read these terms and conditions of use \nthoroughly before accessing, using or obtaining \nany materials, information, products or services. \nBy accessing, the Dr. Pad website, mobile or tablet application, or \nany other feature or other \nDr. Pad platform you agree to be bound by \nthese terms and conditions (“Terms”) and our Privacy \nPolicy."),
              ),
              SizedBox(height: 17),
              Text(
                "DISCLAIMER OF WARRANTIES: LIABILITY AND \nLIMITATION",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 17,
              ),
              Text(
                  "IMEDI SYSTEMS, LLC DOES NOT GUARANTEE, \nREPRESENT, OR WARRANT THAT YOUR USE OF \nTHE SERVICE PROVIDED BY this service\nWILL BE UNINTERRUPTED OR ERROR-FREE, \nAND YOU AGREE THAT FROM TIME TO TIME \nIMEDI SYSTEMS (DR. PAD) MAY REMOVE THE\nSERVICE FOR INDEFINITE PERIOD OF TIME, OR \nCANCEL THE SERVICE AT ANY TIME, WITHOUT \nNOTICE TO YOU."),
              SizedBox(
                height: 17,
              ),
              Text(
                  "YOU AGREE THAT YOUR USE OF, OR INABILITY \nTO USE, THE SERVICE PROVIDED BY DR. PAD \nIS AT YOUR SOLE RISK. THE SERVICE PROVIDED \nTO YOU \nTHROUGH MOBILE APPS, AND DR.PAD \nWEBSITE ARE PROVIDED \n“AS IS” AND “AS \nAVAILABLE” FOR YOUR USE, WITHOUT \nWARRANTIES OF ANY\nKIND, EITHER EXPRESS OR IMPLIED.")
            ],
          ),
        ),
      ),
    );
  }
}
