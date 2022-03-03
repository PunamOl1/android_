import 'package:flutter/material.dart';
import 'package:motion_toast/motion_toast.dart';

class ContactUs extends StatefulWidget {
  const ContactUs({Key? key}) : super(key: key);

  @override
  _ContactUsState createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  final _formkey = GlobalKey<FormState>();
  String name = '';
  String email = '';
  String phone = '';
  String subject = '';
  String message = '';

  String? checkEmpty(value) {
    if (value == null || value.isEmpty) {
      return "* Required";
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(25.0),
          child: Form(
            key: _formkey,
            child: Column(
              children: [
                const Text(
                  'Always here to help',
                  style: TextStyle(color: Colors.blue, fontSize: 18),
                ),
                const SizedBox(
                  height: 8,
                ),
                const Text(
                  "Contact Us",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      color: Colors.blue),
                ),
                const SizedBox(height: 30),
                TextFormField(
                  onSaved: (value) {
                    name = value!;
                  },
                  validator: checkEmpty,
                  textCapitalization: TextCapitalization.words,
                  decoration: const InputDecoration(
                    labelText: 'Your Name',
                    hintText: 'Enter your name',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  onSaved: (value) {
                    email = value!;
                  },
                  validator: checkEmpty,
                  textCapitalization: TextCapitalization.words,
                  decoration: const InputDecoration(
                    labelText: 'Your Email',
                    hintText: 'Enter your email',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  onSaved: (value) {
                    phone = value!;
                  },
                  validator: checkEmpty,
                  keyboardType: TextInputType.phone,
                  decoration: const InputDecoration(
                    labelText: 'phone',
                    hintText: 'Enter phone number.',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  onSaved: (value) {
                    subject = value!;
                  },
                  validator: checkEmpty,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'subject',
                    hintText: 'Enter your subject',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  onSaved: (value) {
                    message = value!;
                  },
                  validator: checkEmpty,
                  keyboardType: TextInputType.phone,
                  decoration: const InputDecoration(
                    labelText: 'Your Message',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 15),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 50),
                    ),
                    onPressed: () {}
                    /*async {
                      if (_formkey.currentState!.validate()) {
                        _formkey.currentState!.save();
                        //User created in user.dart
                        bool isCreated = await registerUser(User(
                            username: username,
                            password: password,
                            phone: phone,
                            age: age,
                            address: address));
                        if (isCreated) {
                          MotionToast.success(
                            description: Text(
                                'Your account is registered. you  can login into app now'),
                          ).show(context);
                        } else {
                          MotionToast.error(
                                  description: Text('failed to register'))
                              .show(context);
                        }
                      }
                    }*/
                    ,
                    child: const Text('Send')),
                const SizedBox(height: 15),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Nepal",
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "We will reply back  withinn 24 hours.",
                        style: TextStyle(fontSize: 12),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    ListTile(
                      title: Text('+9867892356'),
                      subtitle: Text("pnm@drpd.us"),
                      leading: Icon(Icons.phone_android),
                    ),
                    ListTile(
                        title: Text('kathmandu,po'),
                        subtitle: Text("ktm"),
                        leading: Icon(
                          Icons.location_city,
                        )),
                    SizedBox(
                      height: 40,
                    ),
                    Text(
                      "India",
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      "We will reply back  withinn 24 hours.",
                      style: TextStyle(fontSize: 12),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    ListTile(
                      title: Text('+9167892356'),
                      subtitle: Text("punnnam@drpd.us"),
                      leading: Icon(Icons.phone_android),
                    ),
                    ListTile(
                        title: Text('Chennai,india'),
                        subtitle: Text("chenai india"),
                        leading: Icon(
                          Icons.location_city,
                        )),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
