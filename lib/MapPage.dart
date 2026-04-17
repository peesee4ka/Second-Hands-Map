import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPage extends StatefulWidget{
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage>{
  Set<Marker> _markers = {};

  void _onMapCreated(GoogleMapController controller){
    setState(() {
      _markers.add(
          Marker(
              markerId: const MarkerId("1"),
              position: const LatLng(52.21152, 20.97761),
              onTap: (){print("click");}
          )
      );
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