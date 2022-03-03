import 'package:flutter/material.dart';

class PrivacyPolicy extends StatelessWidget {
  const PrivacyPolicy({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Privacy policy"),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(50.0, 8.0, 50.0, 8.0),
                child: Text(
                    " We respects the privacy of our users. By accessing our website and entering information into any of our form pages, you are agreeing to and accepting this Privacy Policy as well as the terms and conditions or other end-user agreements for our site."),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(50.0, 8.0, 50.0, 8.0),
                child: Text(
                    ". We will not share information that identifies you individually or reveals your identity (“identifying information”) to any organization outside of Dr.Pad /n. We will not make identifying information available publicly without the prior written or electronic consent of the individual identified.  \n.We may collect and use information about you and your use of our sites, including identifying information, for our own internal purposes such as analyzing usage of the website for improvement purposes.\n.Dr.Pad may send users, via email or other means, information relating to our site and/or information on special events, new programs or services and/or promotions from our partners/colleagues. The information described in these messages is intended to be of high interest or value to our users. To choose not to receive such messages, or any other future emails simply choose “no” to receive future mailings on our form page(s), otherwise your electronic approval will qualify as your consent for this purpose.\n.If you make a purchase by credit card or otherwise provide your credit card information, the relevant data will be transmitted to Dr. Pad’s vendor providing such payment processing service.\n.If you subscribe to the cloud, Dr. Pad saves your clinical data in the cloud . If you login to the app, the app capture user’s email from corresponding identify providers such as Google, Apple, FaceBook or custom login, and other required data to validate your identity\n.Dr. Pad may use other companies or outside agencies to perform certain functions for us. These functions might include, for example, processing credit card payments, providing customer service and sending emails. These other companies or outside agencies may have access to customer information (such as identifying information) needed to perform their functions, but they are not authorized to use it for any other purposes. In addition, we may share information with other affiliated companies and joint ventures, for example, but we ask those companies to honor the standards of this Privacy Policy.In order to provide our users with a  complete understanding of how our website collect and use information from our users, we have provided the following information:"),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(50.0, 8.0, 50.0, 8.0),
                child: Text("Internet Protocol (IP) Address",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 17)),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(50.0, 8.0, 50.0, 8.0),
                child: Text(
                    "our sites may log IP addresses for systems administration, diagnostic, and site tracking purposes. The Dr.Pad sites do not link IP addresses to information identifying users individually."),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(50.0, 8.0, 50.0, 8.0),
                child: Text(
                  "Cookies",
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(50.0, 8.0, 50.0, 8.0),
                child: Text(
                    "our site may use files called “cookies” to store user preferences so that users don’t have to re-enter this information each time they use our site."),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(50.0, 8.0, 50.0, 8.0),
                child: Text(
                  "User Data Deletion",
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(50.0, 8.0, 50.0, 8.0),
                child: Text(
                    "If you login with Apple, Google, Facebook, or custom login, then your email and other details you provided in the registration is stored with Dr. Pad. If you want to remove the data from Dr. Pad database, send an email from the registered email to support@drpad.us and provide a proof of your clinic ( screenshot of Dr. Pad settings screen showing the clinic id)"),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(50.0, 8.0, 50.0, 8.0),
                child: Text(
                  "Changes to this Privacy Policy",
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(50.0, 8.0, 50.0, 8.0),
                child: Text(
                    "This privacy policy is subject to modification from time to time. You may be notified: (1) in an email sent to the email address if you have provided one to Dr.Pad through our sites, or (2) Dr.Pad’s posting of a notice for at least 30 days on this website stating that the privacy policy has been changed.If you have any questions regarding this policy, please contact us at support@drpad.us"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
