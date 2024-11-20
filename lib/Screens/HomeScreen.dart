// ignore_for_file: file_names, use_key_in_widget_constructors, prefer_const_declarations, prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last, sized_box_for_whitespace, must_be_immutable

import 'package:flutter/material.dart';
import 'package:amazon/Services/Networking.dart';
import 'package:amazon/Services/ContainerBox.dart';
import 'package:amazon/Services/Images.dart';

class HomeScreen extends StatefulWidget {
  static final id = 'home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // String? country;
  // String? city;
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   getPlace();
  // }

  // void getPlace() async {
  //   final net = Networking('c51a239b-eb31-483b-9a17-c9f52fd8e81c');
  //   final response = await net.fetchData();

  //   setState(() {
  //     if (response != null) {
  //       country = response.country;
  //       city = response.city;
  //     } else {
  //       country = 'Unknown Country';
  //       city = 'Unknown City';
  //     }
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff085749),
      body: SafeArea(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.white,
                ),
                child: TextField(
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search),
                      prefixIconColor: Colors.black,
                      suffixIcon: Icon(Icons.camera_alt),
                      suffixIconColor: Colors.grey,
                      hintText: 'Search Amazon',
                      hintStyle: TextStyle(color: Colors.black54)),
                ),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Row(
              children: [
                Icon(
                  Icons.place_rounded,
                  color: Colors.grey,
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'Deliver to CountryName , CityName',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),
            //1,2,3,4,5
            SizedBox(
              height: 5.0,
            ),
            SizedBox(
              height: 200.0,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Container(
                    //color: Colors.blue,
                    width: 412.0,
                    child: Image.asset('lib/assets/asset 1.jpeg'),
                  ),
                  Container(
                    //color: Colors.white,
                    width: 412.0,
                    child: Image.asset('lib/assets/asset 2.jpeg'),
                  ),
                  Container(
                    //color: Colors.red,
                    width: 412.0,
                    child: Image.asset('lib/assets/asset 3.jpeg'),
                  ),
                  Container(
                    //color: Colors.black,
                    width: 412.0,
                    child: Image.asset('lib/assets/asset 4.jpeg'),
                  ),
                  Container(
                    //color: Colors.yellow,
                    width: 412.0,
                    child: Image.asset('lib/assets/asset 5.jpeg'),
                  ),
                ],
              ),
            ),
            ContainerBox(
              headertext: 'Score the top PCs & Accessories',
              btntxt: 'see more',
              imagepath1: images.images1.path,
              imagepath2: images.images2.path,
              imagepath3: images.images3.path,
              imagepath4:  images.images4.path,
              name1: images.images1.name,
              name2: images.images2.name,
              name3: images.images3.name,
              name4: images.images4.name,
            ),
            // ContainerBox(
            //   headertext: 'Fantastic Finds for Home',
            //   btntxt: 'see more',
            // ),
            //  ContainerBox(
            //   headertext: 'Shoes under \$60',
            //   btntxt: 'shop all',
            // ),
          ],
        ),
      ),
    );
  }
}
