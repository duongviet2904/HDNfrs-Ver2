import 'package:google_maps_flutter/google_maps_flutter.dart';

class Pharmacies {
  String shopName;
  String address;
  String description;
  String thumbNail;
  LatLng locationCoords;

  Pharmacies(
      {this.shopName,
        this.address,
        this.description,
        this.thumbNail,
        this.locationCoords});
}

final List<Pharmacies> pharmaciesLocation = [
  Pharmacies(
      shopName: 'Cty nông nghiệp An Đô',
      address: '134 Lô B4,Hoàng Mai-HN',
      description:
      'Coffee bar chain offering house-roasted direct-trade coffee, along with brewing gear & whole beans',
      locationCoords: LatLng(20.973809, 105.836988),
      thumbNail: 'https://lh5.googleusercontent.com/p/AF1QipNNzoa4RVMeOisc0vQ5m3Z7aKet5353lu0Aah0a=w90-h90-n-k-no'
  ),
  Pharmacies(
      shopName: 'Cty Phương MAi',
      address: 'Ngõ 89 Phương Định',
      description:
      'All-day American comfort eats in a basic diner-style setting',
      locationCoords: LatLng(21.001816, 105.836764),
      thumbNail: 'https://lh5.googleusercontent.com/p/AF1QipOfv3DSTkjsgvwCsUe_flDr4DBXneEVR1hWQCvR=w90-h90-n-k-no'
  ),
  Pharmacies(
      shopName: 'Cty bve TV1',
      address: '240 Sullivan St',
      description:
      'Small spot draws serious caffeine lovers with wide selection of brews & baked goods.',
      locationCoords: LatLng(21.011000, 105.820122),
      thumbNail: 'https://lh5.googleusercontent.com/p/AF1QipPGoxAP7eK6C44vSIx4SdhXdp78qiZz2qKp8-o1=w90-h90-n-k-no'
  ),
  Pharmacies(
      shopName: 'Cty HP',
      address: '214 E 10th St',
      description:
      'Snazzy, compact Japanese cafe showcasing high-end coffee & sandwiches, plus sake & beer at night.',
      locationCoords: LatLng(21.025788, 105.821821),
      thumbNail: 'https://lh5.googleusercontent.com/p/AF1QipNhygtMc1wNzN4n6txZLzIhgJ-QZ044R4axyFZX=w90-h90-n-k-no'
  ),
  Pharmacies(
      shopName: 'Cty Sx Thái Hà',
      address: '301 W Broadway',
      description:
      'Compact coffee & espresso bar turning out drinks made from direct-trade beans in a low-key setting.',
      locationCoords: LatLng(21.015807, 105.832226),
      thumbNail: 'https://lh5.googleusercontent.com/p/AF1QipOMNvnrTlesBJwUcVVFBqVF-KnMVlJMi7_uU6lZ=w90-h90-n-k-no'
  )
];