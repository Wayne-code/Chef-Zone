import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'griddashboard.dart';

class Home extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('DashBoard'),
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {},
          ),
        ],
      ),
      body: Stack(children: [
        Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/Sign.jpg"), fit: BoxFit.cover))),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 40, 20, 125),
              child: Text('ChefZone',
                  style: GoogleFonts.openSans(
                      fontSize: 55,
                      color: Colors.white,
                      fontWeight: FontWeight.bold)),
            ),
            GridDashboard(),
          ],
        ),
      ]),
    );
  }
}
