import 'package:api/http/httpuser.dart';
import 'package:api/utilities/pushNotification.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:api/constant.dart';
import 'package:api/model/Product.dart';

class MyCard extends StatefulWidget {
  const MyCard(
      {Key? key, required this.product, required this.userId, this.wishlistId})
      : super(key: key);

  final product;
  final userId;
  final wishlistId;

  @override
  State<MyCard> createState() => _MyCardState();
}

class _MyCardState extends State<MyCard> {
  Future addToCart(String productId) async {
    var res = await HttpConnectUser().addToCart(widget.userId, productId);
    print(res);
  }

  @override
  Widget build(BuildContext context) {
    // print("${widget.product['pname']} fsdsdfsdf");
    return Container(
      // height: MediaQuery.of(context).size.height * 0.7,
      margin: EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
          color: kSecondary, borderRadius: BorderRadius.circular(10)),
      width: MediaQuery.of(context).size.width * 0.4,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
            child: Image(
                width: MediaQuery.of(context).size.width * 0.7,
                // width: 100,
                height: MediaQuery.of(context).size.height * 0.13,
                fit: BoxFit.cover,
                image: NetworkImage("$host/${widget.product['image']}")),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6),
            child: Text(
              "${widget.product['pname']}",
              overflow: TextOverflow.ellipsis,
              style:
                  TextStyle(color: kTextPrimary, fontWeight: FontWeight.w900),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6),
            child: Text(
              "${widget.product['pdesc']}",
              overflow: TextOverflow.ellipsis,
              style: TextStyle(color: kTextPrimary),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6),
            child: Row(
              children: [
                Text(
                  "Rs.${widget.product['pprice']}",
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(color: kTextPrimary),
                ),
                TextButton(
                  onPressed: () async {
                    // print("Product id is here  ${widget.product['_id']}");
                    var res = await HttpConnectUser().delete(widget.wishlistId);
                    print(res);
                  },
                  child: Text("Remove"),
                )
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/pay');
            },
            child: Text("Check Out"),
          ),
        ],
      ),
    );
  }
}
