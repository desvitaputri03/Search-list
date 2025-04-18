import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_app_desvita/Screen/maps/full_page_map.dart';  // Full map page import

class DetailWisataPage extends StatelessWidget {
  final String title;
  final String locationName;
  final LatLng location;
  final String description;
  final String imageUrl;

  const DetailWisataPage({
    Key? key,
    required this.title,
    required this.locationName,
    required this.location,
    required this.description,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Wisata'),
        backgroundColor: Colors.tealAccent,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Image section
            Container(
              width: double.infinity,
              height: 250,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            // Details section
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  // Title
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8),
                  // Location name
                  Text(
                    locationName,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.black12,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),
                  // Description
                  Text(
                    description,
                    style: const TextStyle(fontSize: 16),
                    textAlign: TextAlign.justify,
                  ),
                  const SizedBox(height: 24),
                  // Map section (only one marker for the selected place)
                  SizedBox(
                    width: double.infinity,
                    height: 300, // Set height for the map
                    child: GoogleMap(
                      initialCameraPosition: CameraPosition(
                        target: location,
                        zoom: 14,
                      ),
                      markers: _createMarkers(), // Add marker for the selected place
                    ),
                  ),
                  const SizedBox(height: 24),
                  // Button to view full map with more markers
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => FullMapPage(
                              location: location,
                              title: title,
                              locationName: locationName,
                            ),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.tealAccent,
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text(
                        "Lihat Map Wisata",
                        style: TextStyle(
                          color: Colors.black87,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Marker for the specific place clicked in the Detail page
  Set<Marker> _createMarkers() {
    return {
      Marker(
        markerId: MarkerId(title),
        position: location,
        infoWindow: InfoWindow(
          title: title,
          snippet: locationName,
        ),
      ),
    };
  }
}
