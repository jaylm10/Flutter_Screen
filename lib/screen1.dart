import 'package:flutter/material.dart';
import 'package:screen1/screen2.dart';
import 'package:screen1/screen3.dart';

class Screen1 extends StatefulWidget {
  const Screen1({super.key});

  @override
  State<Screen1> createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  final List<String> regions = [
    'Asia',
    'Europe',
    'South America',
    'North America',
    'Australia',
    'Africa',
  ];

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.fromLTRB(20, 40, 20, 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,

              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hello, Vanesaa',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 1),
                    Text('Welcome to TripGlide'),
                  ],
                ),

                CircleAvatar(
                  radius: 25,
                  backgroundImage: AssetImage('assets/img/profile.jpg'),
                ),
              ],
            ),

            SizedBox(height: 20),

            TextField(
              decoration: InputDecoration(
                hintText: 'Search',

                prefixIcon: Icon(Icons.search, color: Colors.black),
                suffixIcon: Icon(Icons.filter_list, color: Colors.black),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(28.0),
                ),

                filled: true,
                fillColor: Colors.white,

                contentPadding: EdgeInsets.all(18.0),
              ),
            ),

            SizedBox(height: 28),

            Text(
              'Select your next trip',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 18),

            SizedBox(
              height: 45,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,

                itemCount: regions.length,
                itemBuilder: (context, index) {
                  bool isSelected = selectedIndex == index;

                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndex = index;
                      });
                    },

                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 18,
                      ),
                      decoration: BoxDecoration(
                        color: isSelected ? Colors.black : Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(25),
                      ),

                      child: Text(
                        regions[index],
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: isSelected ? Colors.white : Colors.black,
                        ),
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return SizedBox(width: 10);
                },
              ),
            ),

            const SizedBox(height: 20),

            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Stack(
                  children: [
                    Image.asset(
                      'assets/img/rio.jpg',
                      height: 320,
                      width: 270,
                      fit: BoxFit.cover,
                    ),

                    Positioned(
                      top: 16,
                      right: 16,
                      child: Container(
                        padding: const EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color.fromRGBO(12, 8, 8, 0.698),
                        ),
                        child: const Icon(
                          Icons.favorite_border,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                    ),

                    Positioned(
                      bottom: 70,
                      left: 16,

                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Brazil',
                            style: TextStyle(color: Colors.white),
                          ),
                          const Text(
                            'Rio De Janeiro',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Row(
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(
                                  vertical: 1,
                                  horizontal: 6,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(color: Colors.white),
                                ),
                                child: Row(
                                  children: [
                                    const Icon(Icons.star),
                                    const Text(
                                      '5.0',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(width: 10),
                              const Text(
                                '143 Reviews',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    Positioned(
                      left: 16,
                      right: 16,
                      bottom: 16,
                      child: Container(
                        height: 44,
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(12, 8, 8, 0.698),
                          borderRadius: BorderRadius.circular(22),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(left: 78),
                              child: Text(
                                'See more',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(right: 6),
                              height: 34,
                              width: 34,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white,
                              ),
                              child: const Icon(Icons.arrow_forward, size: 18),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 25),

            Center(
              child: Container(
                width: 300,
                padding: EdgeInsets.symmetric(vertical: 13, horizontal: 10),

                decoration: BoxDecoration(
                  color: Color.fromRGBO(8, 8, 8, 0.8),
                  borderRadius: BorderRadius.circular(50),
                ),

                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(Icons.home, color: Colors.white),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Screen2()),
                        );
                      },
                      child: Icon(Icons.message),
                    ),
                    ElevatedButton(onPressed:(){Navigator.push(context, MaterialPageRoute(builder: (context)=> Screen3()));} , child: Icon(Icons.favorite))
                    ,
                    Icon(Icons.menu, color: Colors.white),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
