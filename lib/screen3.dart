import 'package:flutter/material.dart';

class Screen3 extends StatefulWidget {
  Screen3({super.key});

  @override
  State<Screen3> createState() => _Screen3State();
}

class _Screen3State extends State<Screen3> {
  List<String> list = ["Tour schedule", "Accomodation", "Booking Details"];

  int expandedIndex = -1;

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.transparent,

        leading: Padding(
          padding: const EdgeInsets.only(left: 16, top: 8, bottom: 8),
          child: CircleAvatar(
            backgroundColor: Colors.white,
            child: Icon(
              Icons.arrow_back_ios_new,
              color: Colors.black,
              size: 20,
            ),
          ),
        ),

        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16, top: 8, bottom: 8),
            child: CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(Icons.favorite_border, color: Colors.black),
            ),
          ),
        ],
        title: Column(
          children: [
            const Text(
              'Iconic Brazil',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 6),
            const Text(
              'Wed, Oct 21 - Sun, Nov 1',
              style: TextStyle(fontSize: 10, color: Colors.grey),
            ),
          ],
        ),
        centerTitle: true,
      ),

      body: DraggableScrollableSheet(
        initialChildSize: 0.96,
        minChildSize: 0.96,
        maxChildSize: 0.96,

        builder: (context, scrollController) {
          return Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),

              boxShadow: [BoxShadow(blurRadius: 10, color: Colors.black26)],
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
              child: SingleChildScrollView(
                controller: scrollController,

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Container(
                        height: 4,
                        width: 45,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 20,
                        horizontal: 8,
                      ),
                      child: SizedBox(
                        height: 60,
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemCount: list.length,
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
                                  vertical: 1,
                                  horizontal: 20,
                                ),
                                decoration: BoxDecoration(
                                  color: isSelected
                                      ? Colors.black
                                      : Color(0xFFF2F2F2),
                                  borderRadius: BorderRadius.circular(25),
                                ),

                                child: Center(
                                  child: Text(
                                    list[index],
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: isSelected
                                          ? Colors.white
                                          : Colors.black,
                                    ),
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
                    ),

                    // const SizedBox(height: 14,),
                    const Text(
                      '8-Days Brazil Adventure',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 21,
                      ),
                    ),

                    const SizedBox(height: 15),

                    Center(
                      child: Container(
                        padding: EdgeInsets.all(14),
                        height: 290,
                        width: 325,
                        decoration: BoxDecoration(
                          color: Color(0xFFF2F2F2),
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadiusGeometry.circular(
                                    10,
                                  ),
                                  child: Image.network(
                                    'https://images.unsplash.com/photo-1542296332-2e4473faf563?fm=jpg&q=60&w=3000&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8YWlycG9ydHxlbnwwfHwwfHx8MA%3D%3D',
                                    height: 65,
                                  ),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'Day 1',
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    const Text(
                                      'Arrival to Rio De Janerio',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                                Icon(Icons.keyboard_arrow_up),
                              ],
                            ),

                            const SizedBox(height: 10),
                            const Text(
                              'Morning',
                              style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const Text(
                              'Arrive in Rio de Janerio and transfer to your hotel',
                              style: TextStyle(fontWeight: FontWeight.w500),
                            ),
                            const SizedBox(height: 10),
                            const Text(
                              'Afternoon',
                              style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const Text(
                              'Free time to relax or explore nearby area',
                              style: TextStyle(fontWeight: FontWeight.w500),
                            ),
                            const SizedBox(height: 10),
                            const Text(
                              'Evening',
                              style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const Text(
                              'Welcome dinner at a traditional Brazillian restaurant',
                              style: TextStyle(fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(height: 10),

                    card(
                      0,
                      'https://media.istockphoto.com/id/1125317467/photo/sao-conrado-aerial-view.jpg?s=612x612&w=0&k=20&c=tVX6tag5V43jSOHtywIr8setErmTcjpk8GZG6R02KE4=',
                      'Day 2',
                      'Rio de Janerio',
                    ),
                    const SizedBox(height: 10),
                    card(
                      1,
                      'https://media.istockphoto.com/id/878377556/photo/sao-paulo.jpg?s=612x612&w=0&k=20&c=YIIn27eI1l_iNx-IOn48w93ZLpfki2akZhFeBljU6LA=',
                      'Day 3',
                      'São Paulo',
                    ),
                    const SizedBox(height: 10),
                    card(
                      2,
                      'https://landedtravel.com/wp-content/uploads/2020/02/Brazil-Brasilia-Cathedral-11.53.09.webp',
                      'Day 4',
                      'Brazillia',
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
            ),
          );
        },
      ),

      bottomNavigationBar: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),

          child: SizedBox(
            height: 55,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              onPressed: () {},
              child: const Text(
                "Book a tour",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget card(int index, String img, String day, String city) {
    // bool isExpanded = expandedIndex == index;

    return ExpansionTile(
      leading: Image.network(img),
      title: Text(day),
      subtitle: Text(city),
      children: [
        ListTile(title: Text('Description of the day itinerary'),),
      ],
    );

    // return GestureDetector(
    //   onTap: () {
    //     setState(() {
    //       expandedIndex = isExpanded ? -1 : index;
    //     });
    //   },
    //   child: Container(
    //     padding: const EdgeInsets.all(12),
    //     decoration: BoxDecoration(
    //       border: Border.all(color: Colors.black),
    //       borderRadius: BorderRadius.circular(10),
    //     ),
    //     child: Column(
    //       children: [

    //         Row(
    //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //           children: [
    //             Row(
    //               children: [
    //                 ClipRRect(
    //                   borderRadius: BorderRadius.circular(10),
    //                   child: Image.network(img, height: 60),
    //                 ),
    //                 const SizedBox(width: 15),
    //                 Column(
    //                   crossAxisAlignment: CrossAxisAlignment.start,
    //                   children: [
    //                     Text(
    //                       day,
    //                       style: TextStyle(color: Colors.grey.shade500),
    //                     ),
    //                     Text(
    //                       city,
    //                       style: const TextStyle(fontWeight: FontWeight.w500),
    //                     ),
    //                     const Text(
    //                       "Highlights",
    //                       style: TextStyle(fontWeight: FontWeight.w500),
    //                     ),
    //                   ],
    //                 ),
    //               ],
    //             ),

    //             Icon(
    //               isExpanded
    //                   ? Icons.keyboard_arrow_up
    //                   : Icons.keyboard_arrow_down_outlined,
    //             ),
    //           ],
    //         ),

    //         if (isExpanded)
    //           const Padding(
    //             padding: EdgeInsets.only(top: 12),
    //             child: Text(
    //               "Visit famous attractions, enjoy local food and explore the culture of the city.",
    //             ),
    //           ),
    //       ],
    //     ),
    //   ),
    // );
  }
}
