import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';


class Geo extends StatefulWidget {
  const Geo({super.key});

  @override
  State<Geo> createState() => _GeoState();
}

class _GeoState extends State<Geo> {
  
  String latitude = '';
  String longitude = '';
  late Position location;
  
  @override
  void initState() {
    super.initState();
  }
  
  Future<Position> getLocation() async {
    bool isServiceEnabled;
    LocationPermission permission;
    
    isServiceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!isServiceEnabled){
      return Future.error('Location services are disabled');
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied){
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied){
        return Future.error('Location permission is denied');
      }
    }
    
    if (permission == LocationPermission.deniedForever){
      return Future.error('Location permission is denied forever');
    }
    return Geolocator.getCurrentPosition();
  }
  
  void onButtonPressed() async {
    location = await getLocation();
    setState(() {
      latitude = location.latitude.toString();
      longitude = location.longitude.toString();
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text('Latitude, $latitude'),
          Text('Longitude, $longitude'),
          MaterialButton(
            onPressed: (){onButtonPressed();},
            child: const Text('Get Location'),
          )
        ],
      ),
    );
  }
}
