import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../Model/product_model.dart';
class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  var _isLoading = false;
  String product_get = "https://fakestoreapi.com/products";
  List<Product> pendingdata = [];
  Future<void> fetchData() async {
    setState(() {
      _isLoading = true;
    });
    try {
      final response = await http.get(Uri.parse(product_get));
      print("Response: ${response.body}"); // Debug print

      if (response.statusCode == 200) {
        final List<dynamic> responseData = json.decode(response.body);
        setState(() {
          pendingdata = responseData.map((data) => Product.fromJson(data)).toList();
          _isLoading = false;
        });
        print("Parsed Data: $pendingdata"); // Debug print
      } else {
        throw Exception('Failed to load data');
      }
    } catch (error) {
      print('Error: $error');
      setState(() {
        _isLoading = false;
      });
    }

  }
  @override
  void initState() {
    super.initState();
    fetchData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Container(
                width: double.infinity, // Take full width
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.blue,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black,
                      spreadRadius: 1,
                    ),
                  ],
                ),
                child: TextField(
                  cursorColor: Colors.white,
                  decoration: InputDecoration(
                    hintText: "Search or ask a question",
                    prefixIcon: const Icon(Icons.search, color: Colors.black),
                    suffixIcon: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.mic, color: Colors.black),
                          onPressed: () {
                            // Action for Mic
                          },
                        ),
                        IconButton(
                          icon:
                              const Icon(Icons.camera_alt, color: Colors.black),
                          onPressed: () {
                            // Action for Camera
                          },
                        ),
                        IconButton(
                          icon: const Icon(Icons.qr_code_scanner,
                              color: Colors.black),
                          onPressed: () {
                            // Action for QR Scan
                          },
                        ),
                      ],
                    ),
                    filled: true,
                    fillColor: Colors.blue.shade100,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      // Rounded corners
                      borderSide: BorderSide.none, // No border
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 20),
                  ),
                ),
              ),
            ),
            Padding(padding: EdgeInsets.symmetric(horizontal: 5,vertical: 5.0),
                child:
                Row(
                  children: [
                    Image.asset("assets/cart/empty_cart.png",
                    height: 145,
                      width: 145,
                    ),
                    Column(
                      children: [
                        Text("Your Amazon Cart is\nempty",
                        style: TextStyle(fontSize: 19),
                        ),
                        TextButton(onPressed: (){}, child: Text('Pick up where you left off',
                        style: TextStyle(color: Colors.blue),
                        ))
                      ],
                    )
                  ],
                ),


            ),
            Padding(padding: EdgeInsets.symmetric(horizontal: 5,vertical: 5.0),
              child:
              Row(
                children: [
                  Image.asset("assets/cart/wallet.png",
                    height: 35,
                    width: 55,
                  ),
                  SizedBox(width: 15),
                  Column(
                    children: [

                  RichText(
                  text: TextSpan(
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black, // Default text color
                  ),
              children: [
                TextSpan(
                  text: "Now, pay everywhere in 1-click using\n",
                ),
                TextSpan(
                  text: "Amazon Pay Balance",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.blue, // Highlighted color
                  ),
                ),
                TextSpan(
                  text: ". Add ₹100 & Win\n",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.green, // Highlighted color
                  ),
                ),
                TextSpan(
                  text: "cashback up to ₹10.",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.green, // Highlighted color
                  ),
                ),
              ],
            ),
          ),


                    ],
                  )
                ],
              ),


            ),
            Divider(
              thickness: 15,
              color: Colors.grey.shade300,

            ),
            Padding(padding: EdgeInsets.symmetric(horizontal: 10.0),
            child:     Row(
              children: [
                Text("Save for later (3 items)",style: TextStyle(fontSize: 18),)
              ],
            )
            ),
            Padding(
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 15.0),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: Expanded(
                        child: Container(
                          height: 38,
                          width: 180,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black,
                                spreadRadius: 0.6,
                              ),
                            ],
                          ),
                          child: Center(child: Text('Sunscreen & after..')),
                        ),
                      ),
                    ),
                    Spacer(),
                    GestureDetector(
                      onTap: () {},
                      child: Expanded(
                        child: Container(
                          height: 38,
                          width: 180,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black,
                                spreadRadius: 0.6,
                              ),
                            ],
                          ),
                          child: Center(child: Text('Mobile case & co...')),
                        ),
                      ),
                    )
                  ],
                )
            ),
            Padding(padding: EdgeInsets.symmetric(horizontal: 15.0),
            child:    GestureDetector(
              onTap: () {},
              child: Expanded(
                child: Container(
                  height: 38,
                  width: 260,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black,
                        spreadRadius: 0.6,
                      ),
                    ],
                  ),
                  child: Center(child: Text('Sewing machine presser feet (1)')),
                ),
              ),
            )
            ),
            Padding(padding: EdgeInsets.symmetric(horizontal: 15.0,vertical: 5),
            child: GestureDetector(
              child: Row(
                children: [
                  Text("See more categories",
                  style: TextStyle(color: Colors.blue.shade300,fontSize: 16,fontWeight: FontWeight.w100),
                  ),
                  SizedBox(width: 8),
                  Icon(
                    Icons.arrow_drop_down
                  )
                ],
              ),
            ),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: pendingdata.take(5).length,
              itemBuilder: (context, index) {
                var item = pendingdata[index];

                return Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 4,
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                  child: ListTile(
                    contentPadding: EdgeInsets.all(12),
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(
                        item.image ?? '',
                        width: 50,
                        height: 50,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) =>
                            Icon(Icons.image_not_supported),
                      ),
                    ),
                    title: Text(
                      item.title ?? 'No Title',
                      style: TextStyle(fontWeight: FontWeight.bold),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                    subtitle: Text(
                      "\₹${item.price?.toStringAsFixed(2) ?? '0.00'}",
                      style: TextStyle(color: Colors.green, fontSize: 16),
                    ),

                  ),

                );
              },
            )
          ],
        ),
      )),
    );
  }
}
