import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mum/src/locations.dart' as locations;
import 'package:geolocator/geolocator.dart';

class GoogleScreen extends StatefulWidget {
  const GoogleScreen({super.key});

  @override
  State<GoogleScreen> createState() => _GoogleScreenState();
}

class _GoogleScreenState extends State<GoogleScreen> {
  final Map<String, Marker> _markers = {};

  Future<void> _onMapCreated(GoogleMapController controller) async {
    final googleOffices = await locations.getGoogleOffices();
    setState(() {
      _markers.clear();
      for (final office in googleOffices.offices) {
        final marker = Marker(
          markerId: MarkerId(office.name),
          position: LatLng(office.lat, office.lng),
          infoWindow: InfoWindow(
            title: office.name,
            snippet: office.address,
          ),
        );
        _markers[office.name] = marker;
      }
    });
  }

  @override
  Widget build(BuildContext context) {

    void getLoocation() async {
      Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.low);

    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Google Office Locations'),
        elevation: 2,
      ),
      body: GoogleMap(

        onMapCreated: _onMapCreated,
        initialCameraPosition: const CameraPosition(
          target: LatLng(0, 0),
          zoom: 2,
        ),
        markers: _markers.values.toSet(),
      ),
    );
  }
}
