import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<bool> _onWillPop() async {
    return await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text("Exit App"),
            content: const Text("Are you sure you want to exit?"),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: const Text("No"),
              ),
              TextButton(
                onPressed: () => Navigator.of(context).pop(true),
                child: const Text("Yes"),
              ),
            ],
          ),
        ) ??
        false;
  }

  final List<Map<String, String>> items = [
    {
      "image": "assets/images/container_img_1.png",
      "title": "Pay",
      "type": "asset"
    },
    {
      "image": "assets/images/container_fresh_2.png",
      "title": "Fresh",
      "type": "asset"
    },
    {
      "image": "assets/images/container_bazaar_3.png",
      "title": "Bazaar",
      "type": "asset"
    },
    {
      "image": "assets/images/container_mx_4.png",
      "title": "Mx Pla..",
      "type": "asset"
    },
    {
      "image": "assets/images/container_health_5.png",
      "title": "Health",
      "type": "asset"
    },
  ];

  final List<Map<String, String>> address = [
    {"address": "No 15, valasaravakkam, porur, chennai"},
    {"address": "No 235, J.p. Nagar, 7 th phase, Bangalore"},
    {"address": "No 04, Anna nagar, chennai, chennai"},
  ];
  final List<String> adImages = [
    'assets/BANNER-ADS.jpg',
    'assets/banner2.png',
    'assets/PEAS-banner.jpg',
    'assets/banner4.jpg',
  ];


  final List<Color> colors = [
    Colors.orange.shade50,
    Colors.green.shade50,
    Colors.red.shade50,
    Colors.blue.shade50,
    Colors.teal.shade50,
  ];
  final PageController _pageController = PageController();

  final List<Map<String, String>> mproduct = [
    {
      "image": "assets/images/1.jpg",
      "title": "Keep shopping \n for Laptops",
      "type": "asset"
    },
    {
      "image": "assets/images/2.png",
      "title": ""
          "Reveal scratch \n card now",
      "type": "asset"
    },
    {
      "image": "assets/images/3.png",
      "title": "Keep shopping \n for Memory",
      "type": "asset"
    },
    {
      "image": "assets/images/4.jpg",
      "title": "Deal for you in\nBeauty and P..",
      "type": "asset"
    },
    {
      "image": "assets/images/5.jpg",
      "title": "Keep shopping\n for Men's Fli..",
      "type": "asset"
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              // Horizontal Scrollable List
              Column(

                children: [
                  // Horizontal Scrollable List
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                    child: SizedBox(
                      height: 100,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: items.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content:
                                      Text("${items[index]['title']} clicked"),
                                  duration: const Duration(seconds: 1),
                                ),
                              );
                            },
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Column(
                                children: [
                                  Container(
                                    width: 80,
                                    height: 70,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: colors[index % colors.length],
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withOpacity(0.1),
                                          blurRadius: 5,
                                          spreadRadius: 2,
                                        ),
                                      ],
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Image.asset(
                                          items[index]["image"]!,
                                          height: 35,
                                          width: 35,
                                          errorBuilder:
                                              (context, error, stackTrace) {
                                            return const Icon(
                                                Icons.broken_image,
                                                size: 30);
                                          },
                                        ),
                                        const SizedBox(height: 5),
                                        Text(
                                          items[index]["title"]!,
                                          style: const TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
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
                          prefixIcon:
                              const Icon(Icons.search, color: Colors.black),
                          suffixIcon: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                icon:
                                    const Icon(Icons.mic, color: Colors.black),
                                onPressed: () {
                                  // Action for Mic
                                },
                              ),
                              IconButton(
                                icon: const Icon(Icons.camera_alt,
                                    color: Colors.black),
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
                  Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 5.0, vertical: 10),
                      child: GestureDetector(
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
                                        Text("Choose your location",
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold)),
                                      ],
                                    ),
                                    Text(
                                        "Select a delivery location to see product availability and delivery option",
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600)),
                                    SizedBox(height: 10),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 10, horizontal: 5),
                                      child: SizedBox(
                                        height: 150,
                                        child: ListView.builder(
                                          scrollDirection: Axis.horizontal,
                                          itemCount: address.length,
                                          itemBuilder: (context, index) {
                                            return GestureDetector(
                                              onTap: () {
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                  SnackBar(
                                                    content: Text(
                                                        "Selected: ${address[index]['address']}"),
                                                    duration: const Duration(
                                                        seconds: 1),
                                                  ),
                                                );
                                              },
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 8.0),
                                                child: Column(
                                                  children: [
                                                    Container(
                                                      width: 150,
                                                      height: 150,
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              vertical: 5,
                                                              horizontal: 6),
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        boxShadow: [
                                                          BoxShadow(
                                                            color: Colors.black
                                                                .withOpacity(
                                                                    0.1),
                                                            blurRadius: 1,
                                                          ),
                                                        ],
                                                      ),
                                                      child: Center(
                                                        child: Text(
                                                          address[index]
                                                              ['address']!,
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: TextStyle(
                                                              fontSize: 12,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
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
                                    GestureDetector(
                                      onTap: () {},
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.location_on_outlined,
                                            color: Colors.blue,
                                          ),
                                          Text(
                                            "Enter a indian",
                                            style:
                                                TextStyle(color: Colors.blue),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    GestureDetector(
                                      onTap: () {},
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.location_searching_rounded,
                                            color: Colors.blue,
                                          ),
                                          Text(
                                            "Use my current location",
                                            style:
                                                TextStyle(color: Colors.blue),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 15),
                                  ],
                                ),
                              );
                            },
                          );
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(Icons.location_on_outlined),
                            SizedBox(width: 5),
                            Text("Deliver to Sathish - Chennai 600089"),
                            SizedBox(width: 5),
                            Icon(Icons.arrow_drop_down),
                          ],
                        ),
                      )
                  ),
                  Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10),
              SizedBox(
                height: 180, // Fixed height for banners
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: adImages.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        // Handle ad click
                      },
                      child: Container(
                        width: 300, // Width of each ad banner
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          image: DecorationImage(
                            image: AssetImage(adImages[index]), // Load images dynamically
                            fit: BoxFit.cover,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              blurRadius: 8,
                              spreadRadius: 2,
                              offset: Offset(0, 4),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 10),
              Center(
                child: SmoothPageIndicator(
                  controller: _pageController,
                  count: adImages.length,
                  effect: WormEffect(
                    dotHeight: 10,
                    dotWidth: 10,
                    spacing: 8,
                    activeDotColor: Colors.orange, // Active index is orange
                    dotColor: Colors.grey.shade400, // Inactive dots are grey
                  ),
                ),
              ),
            ],
          ),
        ),
                  Padding(
                    padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                    child: SizedBox(
                      height: 200,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: items.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content:
                                  Text("${mproduct[index]['title']} clicked"),
                                  duration: const Duration(seconds: 1),
                                ),
                              );
                            },
                            child:
                            Padding(
                              padding:
                              const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Column(
                                children: [
                                  Container(
                                    width: 120,
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
                                      mainAxisAlignment:
                                      MainAxisAlignment.start,
                                      children: [
                                        Padding(padding: EdgeInsets.symmetric(vertical: 5),
                                        child:       Text(
                                          mproduct[index]["title"]!,
                                          style: const TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                        ),

                                        const SizedBox(height: 5),
                                        Padding(padding: EdgeInsets.symmetric(horizontal: 10),
                                        child: Image.asset(
                                          mproduct[index]["image"]!,
                                          width: 150,
                                          errorBuilder:
                                              (context, error, stackTrace) {
                                            return const Icon(
                                                Icons.broken_image,
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
                  Padding(padding: EdgeInsets.symmetric(horizontal: 5),
                  child: Image.asset("assets/img/main_banner.png"),
                  )

                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
