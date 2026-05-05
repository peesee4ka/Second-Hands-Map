import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'firebase_options.dart';

class MapScreen extends StatefulWidget{
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen>{
  Set<Marker> _markers = {};

  Future<List<List<double>>> readData() async {
    final db = FirebaseFirestore.instance;
    var snapshot = await db.collection("ssMap").get();

    List<List<double>> data = [];

    for (var doc in snapshot.docs) {
      var docData = doc.data();

      double lat = double.tryParse(docData["latitude"].toString()) ?? 0.0;
      double lng = double.tryParse(docData["longitude"].toString()) ?? 0.0;

      data.add([lat, lng]);
    }

    return data;
  }
  void _onMapCreated(GoogleMapController controller) async {
    List<List<double>> coords = await readData();
    setState((){
      for(int i = 0; i < coords.length; i++){
        _markers.add(
            Marker(
                markerId: MarkerId ("${i}"),
                position: LatLng(coords[i][0], coords[i][1]),
                onTap: (){print("click");}
            )
        );
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: GoogleMap(
          onMapCreated: _onMapCreated,
          initialCameraPosition: CameraPosition(
            target: LatLng(52.22983, 21.01172),
            zoom: 14,
          ),
          markers: _markers,
        ),
      ),
    );
  }

}