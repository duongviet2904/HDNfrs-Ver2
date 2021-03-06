
import 'package:flutter/material.dart';
import 'package:hdnfr_ver2/json/JSON_ROOT.dart';
import 'package:hdnfr_ver2/models/plant.dart';
import 'package:hdnfr_ver2/screens/googleMap.dart';
import 'package:hdnfr_ver2/screens/home_page.dart';
import 'package:hdnfr_ver2/screens/landing_page.dart';
import 'package:hdnfr_ver2/screens/plant_list.dart';
import 'package:hdnfr_ver2/screens/profile.dart';

import '../plantData.dart';


class RootApp extends StatefulWidget {
  final List<Plant> lstPlant;
  // final GlobalKey<_RootAppState> key = GlobalKey();
  RootApp({Key? key, required this.lstPlant}): super(key: key);
  @override
  _RootAppState createState() => _RootAppState();

}

class _RootAppState extends State<RootApp> {
  int activeTab = 0;
  // final GlobalKey<_RootAppState> key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      bottomNavigationBar: getFooter(),
      body: getBody(),
    );
  }

  Widget getBody() {
    return IndexedStack(
      index: activeTab,
      children: [HomePage(lstPlant: widget.lstPlant,), MapSample(), Profile()],
    );
  }

  Widget getFooter() {
    return Container(
      height: 60,
      decoration: BoxDecoration(color: Colors.white),
      child: Padding(
        padding: const EdgeInsets.only(left: 40, right: 40, top: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(items.length, (index) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  activeTab = index;
                });
              },
              child: Column(
                children: [
                  Icon(
                    items[index]['icon'],
                    color: activeTab == index
                        ? Colors.green
                        : Colors.black26,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    items[index]['text'],
                    style: TextStyle(
                        fontSize: 13,
                        color: activeTab == index
                            ? Colors.green
                            : Colors.black26),
                  )
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}
