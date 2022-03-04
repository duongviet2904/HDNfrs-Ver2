import 'package:hdnfr_ver2/models/plant.dart';
import 'package:flutter/material.dart';

class PlantListWidget extends StatelessWidget {
  final Plant item;
  final VoidCallback? onClicked;

  const PlantListWidget({
    required this.item,
    this.onClicked,
    Key? key,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(padding: EdgeInsets.all(15),
          child: Column(
            children: [
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: AssetImage(item.imageUrl),
                      fit: BoxFit.cover
                  ),
                ),
              ),
              SizedBox(height: 15,),
              Padding(padding: EdgeInsets.only(right: 5, left: 5), child: Text(item.name),),
              SizedBox(height: 10,),
            ],
          ),
        ),
        Positioned(
          top: -10,
          right: -30,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FlatButton(
                child: Image.asset("assets/images/icons/cancel.png", width: 20, height: 20,),
                onPressed: onClicked
              ),
            ],
          ),
        ),
      ],
    );
  }

  
}