import 'package:flutter/material.dart';

class FaqPage extends StatelessWidget {
  const FaqPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "FAQ",
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              backgroundColor: Colors.blueAccent),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(2.0),
                child: Text(
                  "Android – Not able to access paid features:",
                  style: TextStyle(
                      fontSize: 25,
                      color: Colors.blueAccent,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 7,
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  "In your devices, remove all the other gmail \naccounts except the one you are using it paid \nfor the subscription \nWhen you remove an account from your phone, \neverything associated with that account is also \ndeleted from your phone. This includes email, \ncontacts, and settings.",
                  style: TextStyle(
                    fontSize: 19,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  "1.Open your phone’s Settings app. \n2.ap Accounts. If you don’t see “Accounts,” tap Users & accounts. \n3.Tap the account you want to remove And then Remove account. /n4.If this is the only Google Account on the phone, you’ll need to enter your phone’s pattern, PIN, or password for security.",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Android – Sync is \nnot working:",
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.blueAccent,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  "First, logout and login back. Then try the sync. If it’s still not working, follow the following steps./nstep 1 – Make sure you have current version of the app in all the Android devices:\nGo to settings >> Apps > Tap in Dr. Pad >> scroll down to bottom  \nThe current version of the app is 5.9.6. If it’s not the current version, uninstall the older version and reinstall from Play Store. And check again to make sure you received a newer version of the app. \nStep 2 – logout and login back: \nAfter a the reinstall, logout of the app, close the app.  Then open the app and login back. \nStep 3 – Do the above steps in all the Android devices.\nStep 4 – Sync the data: \nNow Sync the data in first device after an update. Then sync the data in the second device.",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Local  device  encryption:",
                style: TextStyle(
                    fontSize: 30,
                    color: Colors.blueAccent,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                "Device encryption protects your files and folders from unauthorized access if your device is lost or stolen. After you turn on device encryption, only individuals with the correct password or pin will be able to sign in to your device.\nSome newer Android devices and iOS devices are encrypted by default, out-of-the-box. Certain Android devices from Huawei, Vivo, and OPPO can’t be encrypted. Check with corresponding device’s manual for encrypting the device.",
                style: TextStyle(
                    fontSize: 17,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
