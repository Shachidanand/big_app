import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter_geocoder/geocoder.dart';
import 'package:velocity_x/velocity_x.dart';

class MyLocation extends StatefulWidget {
  const MyLocation({Key? key}) : super(key: key);

  @override
  _MyLocationState createState() => _MyLocationState();
}

class _MyLocationState extends State<MyLocation> {
  var myaddress;
  @override
  void initState() {
    super.initState();
    locationdata();
  }

  locationdata() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    // print(position.latitude);
    // print(position.longitude);
    getaddress(Coordinates(position.latitude, position.longitude));
  }

  getaddress(Coordinates cords) async {
    var addresses = await Geocoder.local.findAddressesFromCoordinates(cords);
    // print(addresses);
    var first = addresses.first;
    //print(first.locality);
    myaddress = first.locality;
    setState(() {});
    // print(myaddress);
    // print(first);
    // print("${first.addressLine}");
    // _address = first.addressLine;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: "$myaddress".text.make(),
    );
  }
}
