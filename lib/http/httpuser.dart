//first import http.dart
//http package on client side, which alowws us to use post methode this indicates where or which location the data goes in server through api where the info is ket in post methode
import 'dart:convert';

import 'package:api/constant.dart';
import 'package:api/model/user.dart';
import 'package:api/response/response_user.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

//second make class httpuser
class HttpConnectUser {
  String baseurl = '$host';
  String token = '';
  Future<bool> registerPost(User user) async {
    //Future<bool>registerPost(User user) async {
    Map<String, dynamic> userMap = {
      "username": user.username,
      "password": user.password,
      "phone": user.phone,
      "age": user.age,
      "address": user.address,
    };

    print(userMap);

//sending data to server

    final response =
        await post(Uri.parse(baseurl + '/patients/register'), body: userMap);

    if (response.statusCode == 200) {
      var usrRes = ResponseUser.fromJson(jsonDecode(response.body));
      return usrRes.success!;
    } else {
      return false;
    }
  }

  Future<bool> loginPosts(String username, String password) async {
    Map<String, dynamic> login = {'username': username, 'password': password};
    print(login);
    try {
      final response = await post(Uri.parse(baseurl + "/login"), body: login);

//json serializing inline
      print(response.body);
      final jsonData = jsonDecode(response.body) as Map;
// bool val = jsonData['sucess'];
// print(jsonData['token']);
      token = jsonData['token'];
//merotoken = jsonData['token'];
      print(token);

      if (token.isNotEmpty) {
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('token', token);

        return true;
      }
    } catch (e) {
      print(e);
    }
    return false;
  }

  Future bookingPosts(
    String Name,
    String age,
    String description,
    String email,
    String date,
  ) async {
    final prefs = await SharedPreferences.getInstance();

    final String? tok = prefs.getString('token');
    print(tok);
    Map<String, dynamic> booking = {
      'Name': Name,
      'age': age,
      'description': description,
      'email': email,
      'date': date
    };
    print(booking);

    try {
      final response = await post(Uri.parse(baseurl + "/user/booking"),
          headers: {'Authorization': 'Bearer ${tok}'}, body: booking);
      final jsonData = jsonDecode(response.body) as Map;
    } catch (e) {
      print(e);
    }
  }

  Future products() async {
    final prefs = await SharedPreferences.getInstance();

    final String? tok = prefs.getString('token');
    try {
      final res = await get(Uri.parse(baseurl + "/user/product"),
          headers: {'Authorization': 'Bearer ${tok}'});
      final data = jsonDecode(res.body);
      // print(data);
      return data;
    } catch (e) {
      print(e);
    }
  }

  Future addToCart(String userId, String productId) async {
    Map data = {"userId": userId, "pid": productId};
    try {
      final res = await post(Uri.parse(baseurl + "/add-cart"), body: data);
      var result = jsonDecode(res.body);
      print(result);
      return result;
    } catch (e) {
      print(e);
    }
  }

  Future getCart(userId) async {
    try {
      final res = await get(Uri.parse(baseurl + "/my-cart/$userId"));
      var data = jsonDecode(res.body);
      // print(data);
      return data;
    } catch (e) {
      print(e);
    }
  }

  Future delete(wid) async {
    print(wid);
    try {
      final res = await delete(Uri.parse(baseurl + "/remove-wishlist/$wid"));
      var data = jsonDecode(res.body);
      // print(data);
      return data;
    } catch (e) {
      print(e);
    }
  }

  Future setReminder(String medicine, String time, String notes) async {
    final prefs = await SharedPreferences.getInstance();
    print(time);

    final String? tok = prefs.getString('token');
    Map reminders = {"title": medicine, "time": time, "description": notes};
    final response = await post(Uri.parse(baseurl + '/user/reminder'),
        headers: {'Authorization': 'Bearer ${tok}'}, body: reminders);

    if (response.statusCode == 200) {
      var usrRes = ResponseUser.fromJson(jsonDecode(response.body));
      print(usrRes);
      return usrRes.success!;
    } else {
      return false;
    }
  }

  //Future

  // Future setMedicine(String Pname, String pdesc, int pquantity, int Price)

//when is post the response is to be catched but here the json string is send in response but we converted it to json object using jsondecode where json object is json map(dynamic) but we want response in dart type so responseuser class is made
//response.body->json string->jsondecode->jsonmap(json object)->response.from json()->dart class object

}
