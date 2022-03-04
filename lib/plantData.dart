import 'package:flutter/material.dart';
import 'package:hdnfr_ver2/models/plant.dart';

class PlantData {
  static final List<Plant> PlanDataList = [
    Plant(
      id: 1,
      name: "Dưa chuột",
      imageUrl: "assets/images/icons/cucumber.png",
      diseases: [1, 3, 6, 9, 11, 12, 17],
      // colorBackground:
    ),
    Plant(
        id: 2,
        name: "Cà chua",
        imageUrl: "assets/images/icons/tomato.png",
        diseases: [1, 3, 6, 9, 11, 12, 17],
        // colorBackground: Colors.teal[50]
    ),
    Plant(
        id: 3,
        name: "Táo",
        imageUrl: "assets/images/icons/apple.png",
        diseases: [1, 3, 6, 9, 11, 12, 17],
        // colorBackground: "Colors.teal[50]"
    ),
    Plant(
        id: 4,
        name: "Nho",
        imageUrl: "assets/images/icons/grapes.png",
        diseases: [1, 3, 6, 9, 11, 12, 17],
        // colorBackground: "Colors.teal[50]"
    ),
    Plant(
        id: 5,
        name: "Dâu tây",
        imageUrl: "assets/images/icons/strawberry.png",
        diseases: [1, 3, 6, 9, 11, 12, 17],
        // colorBackground: "Colors.teal[50]"
    ),
    Plant(
        id: 6,
        name: "Lúa mì",
        imageUrl: "assets/images/icons/wheat.png",
        diseases: [1, 3, 6, 9, 11, 12, 17],
        // colorBackground: "Colors.teal[50]"
    ),
    Plant(
        id: 7,
        name: "Bông",
        imageUrl: "assets/images/icons/cotton.png",
        diseases: [1, 3, 6, 9, 11, 12, 17],
        // colorBackground: "Colors.teal[50]"
    ),
    Plant(
        id: 8,
        name: "Ngô",
        imageUrl: "assets/images/icons/corn.png",
        diseases: [1, 3, 6, 9, 11, 12, 17],
        // colorBackground: "Colors.teal[50]"
    ),
    Plant(
        id: 9,
        name: "Khác",
        imageUrl: "assets/images/icons/question.png",
        diseases: [1, 3, 6, 9, 11, 12, 17],
        // colorBackground: "Colors.teal[50]"
    ),
  ];
}