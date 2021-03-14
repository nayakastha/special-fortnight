import 'package:flutter/material.dart';
import 'package:geocoder/geocoder.dart';
import 'package:location/location.dart';
import 'package:url_launcher/url_launcher.dart' as UrlLauncher;

void main() {
  runApp(MyApp());
}

getLocation(double lat, double lon) async {
  Location location = new Location();

  bool _serviceEnabled;
  PermissionStatus _permissionGranted;
  LocationData _locationData;

  _serviceEnabled = await location.serviceEnabled();
  if (!_serviceEnabled) {
    _serviceEnabled = await location.requestService();
    if (!_serviceEnabled) {
      return;
    }
  }

  _permissionGranted = await location.hasPermission();
  if (_permissionGranted == PermissionStatus.denied) {
    _permissionGranted = await location.requestPermission();
    if (_permissionGranted != PermissionStatus.granted) {
      return;
    }
  }

  _locationData = await location.getLocation();
  lat = _locationData.latitude;
  lon = _locationData.longitude;
  final coordinate = new Coordinates(lat, lon);
  List<dynamic> address =
      await Geocoder.local.findAddressesFromCoordinates(coordinate);
  var first = address.first;
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(247, 82, 50, 1),
          title: Text(
            'Emergency App',
            style: TextStyle(
                fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
        backgroundColor: Color.fromRGBO(45, 48, 45, 0.8),
        body: Center(
          child: InkWell(
            onTap: () {
              UrlLauncher.launch('sms://+919437255618');
            },
            child: Stack(
              fit: StackFit.loose,
              children: [
                Center(
                  child: Container(
                    height: 300,
                    width: 300,
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(61, 48, 40, 1),
                        shape: BoxShape.circle),
                  ),
                ),
                Center(
                  child: Container(
                    height: 253,
                    width: 253,
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(123, 61, 45, 1),
                        shape: BoxShape.circle),
                  ),
                ),
                Center(
                  child: Container(
                    height: 204,
                    width: 204,
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(201, 74, 49, 1),
                        shape: BoxShape.circle),
                  ),
                ),
                Center(
                  child: Container(
                    height: 149,
                    width: 149,
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(247, 82, 50, 1),
                        shape: BoxShape.circle),
                  ),
                ),
                Center(
                    child: Container(
                        height: 50,
                        width: 50,
                        child: Image.asset('assets/alert.png')))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
