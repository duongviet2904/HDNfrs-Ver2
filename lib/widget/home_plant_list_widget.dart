import 'package:hdnfr_ver2/models/plant.dart';
import 'package:flutter/material.dart';

class HomePlantListWidget extends StatelessWidget {
  final Plant item;
  final VoidCallback? onClicked;

  const HomePlantListWidget({
    required this.item,
    this.onClicked,
    Key? key,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Container(
              width: 60,
              height: 60,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                shape: BoxShape.circle,
              ),
              child: Image.asset(item.imageUrl, width: 35,),
            ),
            SizedBox(height: 15,),
            Padding(padding: EdgeInsets.only(right: 5, left: 5), child: Text(item.name),),
          ],
        ),
      ),
      onTap: onClicked
    );
  }
  
}