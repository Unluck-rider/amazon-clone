import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final List<Map<String, String>> mproduct = [
    {"image": "assets/images/1.jpg", "type": "asset"},
    {"image": "assets/images/3.png", "type": "asset"},
    {"image": "assets/images/4.jpg", "type": "asset"},
    {"image": "assets/images/5.jpg", "type": "asset"},
  ];

  final List<Map<String, String>> buyagain = [
    {"image": "assets/profile/f1.jpeg", "type": "asset"},
    {"image": "assets/profile/f2.jpg", "type": "asset"},
    {"image": "assets/profile/f3.jpg", "type": "asset"},
    {"image": "assets/profile/f4.jpg", "type": "asset"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: SingleChildScrollView(
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
            SizedBox(height: 5),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: Row(
                children: [
                  Row(
                    children: [
                      Padding(
                          padding:
                              EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                          child: Image.asset(
                            "assets/profile/user_profile.png",
                            height: 30,
                            width: 30,
                          )),
                      SizedBox(width: 5),
                      GestureDetector(
                          onTap: () {
                            showModalBottomSheet(
                              context: context,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(20)),
                              ),
                              backgroundColor: Colors.white,
                              builder: (context) {
                                return Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Row(
                                        children: [
                                          Text("Who is shopping",
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold)),
                                          Spacer(),
                                          Icon(
                                            Icons.close,
                                            size: 30,
                                          )
                                        ],
                                      ),
                                      SizedBox(height: 8),
                                      Container(
                                        height: 70,
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                          color: Colors.white70,
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.black26,
                                            ),
                                          ],
                                        ),
                                        padding: EdgeInsets.all(8),
                                        child: Row(
                                          children: [
                                            Image.asset(
                                              "assets/profile/user_profile.png",
                                              height: 35,
                                              width: 35,
                                            ),
                                            SizedBox(width: 8),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                SizedBox(width: 2),
                                                Text("Sathish"),
                                                Text(
                                                  "Account hold..",
                                                  style: TextStyle(
                                                      color: Colors.grey),
                                                ),
                                              ],
                                            ),
                                            Spacer(),
                                            TextButton(
                                                onPressed: () {},
                                                child: Text(
                                                  "View",
                                                  style: TextStyle(
                                                      color: Colors.teal,
                                                      fontSize: 16),
                                                ))
                                          ],
                                        ),
                                      ),
                                      SizedBox(width: 8),
                                      Row(
                                        children: [
                                          GestureDetector(
                                              onTap: () {},
                                              child: Padding(
                                                padding: EdgeInsets.symmetric(
                                                    vertical: 12.0,
                                                    horizontal: 8.0),
                                                child: Row(
                                                  children: [
                                                    Text(
                                                      "Add Profile",
                                                      style: TextStyle(
                                                          color: Colors.teal,
                                                          fontSize: 16),
                                                    ),
                                                  ],
                                                ),
                                              )),
                                          Spacer(),
                                          GestureDetector(
                                              onTap: () {},
                                              child: Padding(
                                                padding: EdgeInsets.symmetric(
                                                    vertical: 12.0,
                                                    horizontal: 8.0),
                                                child: Row(
                                                  children: [
                                                    Text(
                                                      "Remove",
                                                      style: TextStyle(
                                                          color: Colors
                                                              .teal.shade100,
                                                          fontSize: 16),
                                                    ),
                                                  ],
                                                ),
                                              )),
                                        ],
                                      ),
                                      SizedBox(height: 10),
                                      Divider(
                                        color: Colors.grey,
                                      ),
                                      SizedBox(height: 10),
                                      Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 10.0),
                                          child: Row(children: [
                                            Text(
                                              "Signed in as sathis123@gmail.com",
                                              style: TextStyle(
                                                  color: Colors.black45),
                                            )
                                          ])),
                                      SizedBox(height: 6),
                                      GestureDetector(
                                        onTap: () {},
                                        child: Container(
                                          height: 50,
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.black,
                                                spreadRadius: 0.6,
                                              ),
                                            ],
                                          ),
                                          padding: EdgeInsets.all(8),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                "Switch Accounts",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w800,
                                                    fontSize: 16),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 10),
                                      Center(
                                        child: TextButton(
                                            onPressed: () {},
                                            child: Text(
                                              'Sign',
                                              style: TextStyle(
                                                color: Colors.blue,
                                                fontSize: 16,
                                              ),
                                            )),
                                      ),
                                      SizedBox(height: 10),
                                    ],
                                  ),
                                );
                              },
                            );
                          },
                          child: Row(
                            children: [
                              Text("Hello, Sathis.."),
                              Icon(
                                Icons.arrow_drop_down_sharp,
                                size: 30,
                              )
                            ],
                          ))
                    ],
                  ),
                  Spacer(),
                  Row(
                    children: [
                      Icon(
                        Icons.settings_outlined,
                        size: 25,
                      ),
                      SizedBox(width: 5),
                      Icon(
                        Icons.notifications_outlined,
                        size: 25,
                      ),
                      SizedBox(width: 18),
                      Image.asset(
                        "assets/profile/flag.png",
                        height: 26,
                        width: 26,
                      ),
                      SizedBox(width: 5),
                      Text("EN")
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 5),
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
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black,
                                spreadRadius: 0.6,
                              ),
                            ],
                          ),
                          child: Center(child: Text('Order')),
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
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black,
                                spreadRadius: 0.6,
                              ),
                            ],
                          ),
                          child: Center(child: Text('List')),
                        ),
                      ),
                    )
                  ],
                )),
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
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black,
                                spreadRadius: 0.6,
                              ),
                            ],
                          ),
                          child: Center(child: Text('Account')),
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
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black,
                                spreadRadius: 0.6,
                              ),
                            ],
                          ),
                          child: Center(child: Text('Buy')),
                        ),
                      ),
                    )
                  ],
                )),
            SizedBox(height: 5),
            Row(
              children: [
                SizedBox(width: 10),
                Text(
                  "Your Orders",
                  style: TextStyle(fontSize: 18),
                ),
                Spacer(),
                Padding(
                    padding: EdgeInsets.only(right: 20.0),
                    child: TextButton(
                        onPressed: () {},
                        child: Text(
                          "View",
                          style: TextStyle(
                              color: Colors.teal.shade300, fontSize: 16),
                        )))
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
              child: SizedBox(
                height: 200,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: mproduct.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {},
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Column(
                          children: [
                            Container(
                              width: 200,
                              height: 155,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.1),
                                    blurRadius: 5,
                                    spreadRadius: 2,
                                  ),
                                ],
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  const SizedBox(height: 5),
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 10),
                                    child: Image.asset(
                                      mproduct[index]["image"]!,
                                      width: 150,
                                      errorBuilder:
                                          (context, error, stackTrace) {
                                        return const Icon(Icons.broken_image,
                                            size: 30);
                                      },
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            Divider(
              thickness: 3,
            ),
            Row(
              children: [
                SizedBox(width: 10),
                Text(
                  "Buy Again",
                  style: TextStyle(fontSize: 18),
                ),
                Spacer(),
                Padding(
                    padding: EdgeInsets.only(right: 20.0),
                    child: TextButton(
                        onPressed: () {},
                        child: Text(
                          "See",
                          style: TextStyle(
                              color: Colors.teal.shade300, fontSize: 16),
                        )))
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
              child: SizedBox(
                height: 200,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: buyagain.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {},
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Column(
                          children: [
                            Container(
                              width: 120,
                              height: 145,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.1),
                                    blurRadius: 5,
                                    spreadRadius: 2,
                                  ),
                                ],
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  const SizedBox(height: 5),
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 10),
                                    child: Image.asset(
                                      buyagain[index]["image"]!,
                                      width: 150,
                                      errorBuilder:
                                          (context, error, stackTrace) {
                                        return const Icon(Icons.broken_image,
                                            size: 30);
                                      },
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            Row(
              children: [
                SizedBox(width: 10),
                Text(
                  "Your Rewards",
                  style: TextStyle(fontSize: 18),
                ),
                Spacer(),
                Padding(
                    padding: EdgeInsets.only(right: 20.0),
                    child: TextButton(
                        onPressed: () {},
                        child: Text(
                          "See",
                          style: TextStyle(
                              color: Colors.teal.shade300, fontSize: 16),
                        )))
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: SizedBox(
                child: Container(
                  height: 80,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black,
                        spreadRadius: 0.6,
                      ),
                    ],
                  ),
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                    child: Row(
                      children: [
                        Column(
                          children: [
                            Text("Cashback",style: TextStyle(color: Colors.black45),),
                           Row(
                             children: [
                               Image.asset("assets/profile/cashback.png",
                               height: 30,
                                 width: 30,
                               ),
                               SizedBox(width: 2),
                               Text("₹ 500")
                             ],
                           ),

                          ],
                        ),
                        Spacer(),
                        Column(
                          children: [
                            Text("Collected",style: TextStyle(color: Colors.black45),),
                            Row(
                              children: [
                                Image.asset("assets/profile/collect.png",
                                  height: 30,
                                  width: 30,
                                ),
                                SizedBox(width: 2),
                                Text("0")
                              ],
                            ),

                          ],
                        ),
                        Spacer(),
                        Column(
                          children: [
                            Text("Scratch cards",style: TextStyle(color: Colors.black45),),
                            Row(
                              children: [
                                Image.asset("assets/profile/cards.png",
                                  height: 30,
                                  width: 30,
                                ),
                                SizedBox(width: 2),
                                Text("3")
                              ],
                            ),

                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            )
          ],
        ),
      ))),
    );
  }
}
