import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hdnfr_ver2/models/plant.dart';
import 'package:hdnfr_ver2/plantData.dart';
import 'package:hdnfr_ver2/screens/root.dart';
import 'package:hdnfr_ver2/widget/choosing_plant_widget.dart';
import 'package:hdnfr_ver2/widget/plant_list_widget.dart';

import 'diseasesInformation.dart';

class MainPage extends StatefulWidget {
  final String title;
  final List<Plant> items;
  // final List<Plant> lstPlant;
  // final List<Plant> items;
  // final List<Plant> plantList;
  const MainPage({
    Key? key,
    required this.title, required this.items,
    // required this.plantList,
    // required this.items
  }):super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final key = GlobalKey<AnimatedListState>();
  
  final plantList = List.from(PlantData.PlanDataList);

  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: Colors.grey[200],
    appBar: AppBar(
      title: Text(widget.title, style: TextStyle(
        color: Colors.black
      ),),
      actions: [
        FlatButton (
          child: Text(
            "Bắt đầu",
            style: TextStyle(
                fontSize: 18
            ),
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => RootApp(lstPlant: widget.items)),
            );
          },
          color: Colors.white,
          textColor: Colors.black,
        )
      ],
      backgroundColor: Colors.white,
      automaticallyImplyLeading: true,
      foregroundColor: Colors.black,
    ),
    // body: ListView.builder(
    //   padding: EdgeInsets.all(15),
    //   scrollDirection: Axis.horizontal,
    //   shrinkWrap: true,
    //   itemCount: items.length,
    //   itemBuilder: (context, index) =>
    //       buildItem(items[index], index),
    //   // itemBuilder: (context, index){
    //   //   return PlantListWidget(
    //   //     item: items[index],
    //   //     onClicked: removeItem(index),
    //   //   );
    //   // },
    // )
    body: SingleChildScrollView(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(top: 15, left: 15),
            width: (MediaQuery.of(context).size.width),
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: Text(
              "Các cây trồng đã chọn:",
              style: TextStyle(
                  fontSize: 18
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 20),
            height: 160,
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: Row(
              children: [
                Expanded(
                  child: AnimatedList(
                    scrollDirection: Axis.horizontal,
                    key: key,
                    initialItemCount: widget.items.length,
                    itemBuilder: (context, index, animation) =>
                        buildItem(widget.items[index], index, animation),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              buildItem2(plantList[0],),
              buildItem2(plantList[1], ),
              buildItem2(plantList[2], ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              buildItem2(plantList[3], ),
              buildItem2(plantList[4], ),
              buildItem2(plantList[5], ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              buildItem2(plantList[6], ),
              buildItem2(plantList[7], ),
              buildItem2(plantList[8], ),
            ],
          ),
          // SingleChildScrollView(
          //   child: ListView.builder(
          //     padding: EdgeInsets.all(15),
          //     scrollDirection: Axis.vertical,
          //     shrinkWrap: true,
          //     itemCount: plantList.length,
          //     physics: NeverScrollableScrollPhysics(),
          //     itemBuilder: (context, index) =>
          //         buildItem2(plantList[index], index),
          //   ),
          // )

        ],
      ),

    )
  );

  Widget buildItem2(item) =>
      ChoosingPantWidget(
        item: item,
        onClicked: () => insertItem(item),
      );

  Widget buildItem(item, int index, Animation<double> animation) =>
      PlantListWidget(
        item: item,
        onClicked: () => removeItem(index),
      );

  void insertItem(Plant item) {
    if(widget.items.isEmpty){
      widget.items.add(item);
      key.currentState!.insertItem(0);
    }else {
      for (int i = 0; i < widget.items.length; i++) {
        if (widget.items[i].id == item.id) {
          return;
        }
      }
      widget.items.add(item);
      key.currentState!.insertItem(widget.items.length - 1);
    }
    // widget.items.insert(item);
  }

  void removeItem(int index) {
    final item = widget.items.removeAt(index);
    key.currentState!.removeItem(
      index,
          (context, animation) => buildItem(item, index, animation),
    );
  }
}