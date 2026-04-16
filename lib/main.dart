import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();


}
class _MyAppState extends State<MyApp> {
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
