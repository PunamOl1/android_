import 'package:api/model/addmedi.dart';
import 'package:flutter/material.dart';
import 'package:motion_toast/motion_toast.dart';

class Addmedi extends StatefulWidget {
  const Addmedi({Key? key}) : super(key: key);

  @override
  _AddmediState createState() => _AddmediState();
}

class _AddmediState extends State<Addmedi> {
  final _formkey = GlobalKey<FormState>();
  String pname = '';
  String pprice = '';
  String pdesc = '';
  String pquatity = '';
  String userId = '';

  /*Future<bool> registerUser(User u) {
    var res = HttpConnectUser().registerPost(u);
    return res;*/
  // }

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
                const Text('Add Medicine'),
                const SizedBox(height: 30),
                TextFormField(
                  onSaved: (value) {
                    pname = value!;
                  },
                  validator: checkEmpty,
                  textCapitalization: TextCapitalization.words,
                  decoration: const InputDecoration(
                    labelText: 'pname',
                    hintText: 'Enter the medicine name',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  onSaved: (value) {
                    pprice = value!;
                  },
                  validator: checkEmpty,
                  textCapitalization: TextCapitalization.words,
                  decoration: const InputDecoration(
                    labelText: 'pprice',
                    hintText: 'Enter the price of medicine',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  onSaved: (value) {
                    pdesc = value!;
                  },
                  validator: checkEmpty,
                  keyboardType: TextInputType.phone,
                  decoration: const InputDecoration(
                    labelText: 'pdesc',
                    hintText: 'Describe about medicine.',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  onSaved: (value) {
                    pquatity = value!;
                  },
                  validator: checkEmpty,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'pquantity',
                    hintText: 'Enter desire quantity',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 50),
                    ),
                    onPressed: () {},
                    /*async {
                      if (_formkey.currentState!.validate()) {
                        _formkey.currentState!.save();
                        //User created in user.dart
                        bool isCreated = await registerUser(Usermedi(
                            username: username,
                            password: password,
                            phone: phone,
                            age: age,
                            address: address));
                        if (isCreated) {
                          MotionToast.success(
                            description: Text('new user added'),
                          ).show(context);
                        } else {
                          MotionToast.error(
                                  description: Text('failed to register'))
                              .show(context);
                        }
                      }
                    },*/
                    child: const Text('Submit')),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
