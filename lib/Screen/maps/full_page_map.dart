import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class FullMapPage extends StatelessWidget {
  final LatLng location;
  final String title;
  final String locationName;

  const FullMapPage({
    Key? key,
    required this.location,
    required this.title,
    required this.locationName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Map Wisata: $title'),
        backgroundColor: Colors.tealAccent,
      ),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: location,
          zoom: 13, // Adjust the zoom level
        ),
        markers: _createMarkers(), // Display all the markers for the area
        zoomControlsEnabled: true,
        myLocationEnabled: true,
        myLocationButtonEnabled: true,
      ),
    );
  }

  // Add multiple markers here for tourist spots in the same location (e.g., Bukittinggi, Bali, etc.)
  Set<Marker> _createMarkers() {
    return {
      // Marker for the location clicked from the Detail Page
      Marker(
        markerId: MarkerId(title),
        position: location,
        infoWindow: InfoWindow(
          title: title,
          snippet: locationName,
        ),
      ),
      // **Bukittinggi** (Sumatera Barat)
      Marker(
        markerId: const MarkerId("JamGadang"),
        position: const LatLng(-0.3031, 100.3672), // Jam Gadang coordinates
        infoWindow: const InfoWindow(
          title: 'Jam Gadang',
          snippet: 'Bukittinggi, Sumatera Barat',
        ),
      ),
      Marker(
        markerId: const MarkerId("GrahaSianok"),
        position: const LatLng(-0.3032, 100.3694), // Graha Sianok coordinates
        infoWindow: const InfoWindow(
          title: 'Graha Sianok',
          snippet: 'Bukittinggi, Sumatera Barat',
        ),
      ),
      Marker(
        markerId: const MarkerId("PanoramaBaru"),
        position: const LatLng(-0.3035, 100.3696), // Panorama Baru coordinates
        infoWindow: const InfoWindow(
          title: 'Panorama Baru',
          snippet: 'Bukittinggi, Sumatera Barat',
        ),
      ),
      // **Bali** (Various locations)
      Marker(
        markerId: const MarkerId("TanahLot"),
        position: const LatLng(-8.6219, 115.0860), // Tanah Lot coordinates
        infoWindow: const InfoWindow(
          title: 'Tanah Lot',
          snippet: 'Bali, Indonesia',
        ),
      ),
      Marker(
        markerId: const MarkerId("UluwatuTemple"),
        position: const LatLng(-8.8295, 115.0841), // Uluwatu Temple coordinates
        infoWindow: const InfoWindow(
          title: 'Uluwatu Temple',
          snippet: 'Bali, Indonesia',
        ),
      ),
      Marker(
        markerId: const MarkerId("KutaBeach"),
        position: const LatLng(-8.7232, 115.1701), // Kuta Beach coordinates
        infoWindow: const InfoWindow(
          title: 'Kuta Beach',
          snippet: 'Bali, Indonesia',
        ),
      ),
      Marker(
        markerId: const MarkerId("SacredMonkeyForest"),
        position: const LatLng(-8.5195, 115.2620), // Sacred Monkey Forest coordinates
        infoWindow: const InfoWindow(
          title: 'Sacred Monkey Forest',
          snippet: 'Ubud, Bali, Indonesia',
        ),
      ),
      // **Yogyakarta**
      Marker(
        markerId: const MarkerId("BorobudurTemple"),
        position: const LatLng(-7.6079, 110.2038), // Borobudur Temple coordinates
        infoWindow: const InfoWindow(
          title: 'Borobudur Temple',
          snippet: 'Magelang, Yogyakarta, Indonesia',
        ),
      ),
      Marker(
        markerId: const MarkerId("PrambananTemple"),
        position: const LatLng(-7.7519, 110.4915), // Prambanan Temple coordinates
        infoWindow: const InfoWindow(
          title: 'Prambanan Temple',
          snippet: 'Yogyakarta, Indonesia',
        ),
      ),
      // **Jakarta**
      Marker(
        markerId: const MarkerId("NationalMonument"),
        position: const LatLng(-6.1754, 106.8283), // National Monument (Monas) coordinates
        infoWindow: const InfoWindow(
          title: 'National Monument (Monas)',
          snippet: 'Jakarta, Indonesia',
        ),
      ),
      // **Bandung**
      Marker(
        markerId: const MarkerId("TangkubanPerahu"),
        position: const LatLng(-6.9029, 107.6000), // Tangkuban Perahu coordinates
        infoWindow: const InfoWindow(
          title: 'Tangkuban Perahu',
          snippet: 'Bandung, West Java, Indonesia',
        ),
      ),
      // Add more markers as needed for other tourist spots
    };
  }
}
