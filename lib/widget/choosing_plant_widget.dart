import 'package:hdnfr_ver2/models/plant.dart';
import 'package:flutter/material.dart';

class ChoosingPantWidget extends StatelessWidget {
  final Plant item;
  final VoidCallback? onClicked;

  const ChoosingPantWidget({
    required this.item,
    this.onClicked,
    Key? key,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClicked,
      child: Container(
        // width: (MediaQuery.of(context).size.width) / 3,
        child: Stack(
          children: [
            Padding(padding: EdgeInsets.all(15),
              child: Column(
                children: [
                  Container(
                    // width: 50,
                    // height: 50,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: Image.asset(item.imageUrl, width: 50,),
                  ),
                  SizedBox(height: 15,),
                  Padding(padding: EdgeInsets.only(right: 5, left: 5), child: Text(item.name),),
                  SizedBox(height: 10,),
                ],
              ),
            ),
          ],
        ),
      )
    );
  }

  
}