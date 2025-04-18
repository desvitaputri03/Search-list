import 'package:flutter/material.dart';
import 'package:flutter_app_desvita/Screen/maps/detail_wisata_page.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class TouristAttraction {
  final String title;
  final String locationName;
  final LatLng location;
  final String description;
  final String imageUrl;

  TouristAttraction({
    required this.title,
    required this.locationName,
    required this.location,
    required this.description,
    required this.imageUrl,
  });
}

class ListWisataPage extends StatelessWidget {
  ListWisataPage({Key? key}) : super(key: key);

  final List<TouristAttraction> attractions = [
    TouristAttraction(
      title: 'Jam Gadang Bukittinggi',
      locationName: 'Bukittinggi, Sumatera Barat',
      location: const LatLng(-0.3047564, 100.3675407),
      description: 'Jam Gadang adalah menara jam ikonik yang terletak di pusat kota Bukittinggi, Sumatera Barat, Indonesia. Menara ini memiliki ukuran besar di empat sisinya dan menjadi simbol kota Bukittinggi. Dikenal dengan arsitekturnya yang unik, Jam Gadang dikelilingi oleh taman yang indah, membuatnya menjadi tempat yang populer bagi wisatawan untuk berfoto dan bersantai. Selain itu, sejarahnya yang kaya dan budaya Minangkabau yang kental menjadikan tempat ini wajib dikunjungi.',
      imageUrl: 'gambar/jamgdg.jpg',
    ),
    TouristAttraction(
      title: 'Candi Borobudur',
      locationName: 'Magelang, Jawa Tengah',
      location: const LatLng(-7.6079, 110.2025),
      description: 'Candi Borobudur merupakan candi Buddha terbesar di dunia yang dibangun pada abad ke-9. Candi ini terdiri dari 504 patung Buddha dan lebih dari 2.600 panel relief yang menggambarkan kisah hidup Buddha. Selain sebagai situs warisan dunia UNESCO, Borobudur juga terkenal dengan pemandangan matahari terbit yang menakjubkan, di mana para pengunjung dapat menyaksikan keindahan alam sekitarnya saat fajar menyingsing. Pengalaman spiritual dan budaya yang ditawarkan di sini sangatlah luar biasa.',
      imageUrl: 'gambar/brb.jpg',
    ),
    TouristAttraction(
      title: 'Labuan Bajo',
      locationName: 'Nusa Tenggara Timur',
      location: const LatLng(-8.4867, 119.8895),
      description: 'Labuan Bajo adalah gerbang menuju Taman Nasional Komodo dan Pulau Padar. Destinasi ini terkenal dengan pantai pink yang eksotis dan spot snorkeling yang luar biasa. Keindahan alamnya yang masih alami serta keanekaragaman hayati bawah lautnya menjadikan Labuan Bajo salah satu tempat terbaik untuk berlibur. Banyak wisatawan yang datang untuk melakukan kegiatan seperti diving, trekking, dan menikmati sunset yang memukau di Bukit Amelia.',
      imageUrl: 'gambar/lbh.jpg',
    ),
    TouristAttraction(
      title: 'Gunung Bromo',
      locationName: 'Probolinggo, Jawa Timur',
      location: const LatLng(-7.9425, 112.9530),
      description: 'Gunung Bromo adalah gunung berapi aktif yang terkenal dengan pemandangan alam yang spektakuler. Dikenal sebagai salah satu tempat terbaik untuk menyaksikan matahari terbit, pengunjung dapat melakukan perjalanan ke Penanjakan untuk mendapatkan pemandangan yang luar biasa dari kawah yang mengeluarkan asap. Dikelilingi oleh lautan pasir yang luas, Gunung Bromo menawarkan pengalaman yang sangat unik bagi para petualang dan fotografer. Suasana magis saat fajar membuat tempat ini menjadi salah satu destinasi wisata paling populer di Indonesia.',
      imageUrl: 'gambar/brm.jpg',
    ),
    TouristAttraction(
      title: 'Pura Ulun Danu Beratan',
      locationName: 'Bedugul, Bali',
      location: const LatLng(-8.2751, 115.1670),
      description: 'Pura Ulun Danu Beratan adalah pura yang terletak di tepi Danau Beratan, Bali, dan dikenal karena keindahannya yang menakjubkan. Pura ini seolah mengapung di atas air dan dikelilingi oleh pegunungan yang hijau, menciptakan suasana yang damai dan menenangkan. Dibangun untuk menghormati Dewi Danu, dewi air, pura ini menjadi salah satu tempat suci yang paling penting bagi masyarakat Bali. Banyak wisatawan yang datang untuk menikmati keindahan alam dan mengabadikan momen dengan latar belakang pura yang megah.',
      imageUrl: 'gambar/imgg.png',
    ),
    TouristAttraction(
      title: 'Danau Toba',
      locationName: 'Sumatera Utara',
      location: const LatLng(2.6843, 98.8762),
      description: 'Danau Toba adalah danau vulkanik terbesar di dunia dan merupakan salah satu keajaiban alam Indonesia. Terletak di tengah-tengah Pulau Samosir, danau ini menawarkan pemandangan yang menakjubkan dengan air biru yang jernih dan pegunungan yang mengelilinginya. Selain keindahan alamnya, Danau Toba juga merupakan pusat budaya Batak yang kaya, di mana pengunjung dapat menikmati tradisi lokal, makanan khas, dan kerajinan tangan. Kegiatan seperti berperahu dan trekking di sekitar danau sangat populer di kalangan wisatawan.',
      imageUrl: 'gambar/toba.jpg',
    ),
    TouristAttraction(
      title: 'Tana Toraja',
      locationName: 'Sulawesi Selatan',
      location: const LatLng(-3.0756, 119.8271),
      description: 'Tana Toraja adalah daerah yang terkenal dengan budaya unik dan tradisi pemakaman yang menakjubkan. Rumah adat Tongkonan yang memiliki atap berbentuk perahu menjadi salah satu ciri khas arsitektur di sini. Upacara Rambu Solo, yang merupakan ritual pemakaman, menarik perhatian banyak wisatawan karena keunikan dan keramaian acara tersebut. Selain itu, pemandangan alam yang indah dan lokasi yang sejuk menambah daya tarik Tana Toraja sebagai tujuan wisata yang wajib dikunjungi.',
      imageUrl: 'gambar/trj.jpg',
    ),
    TouristAttraction(
      title: 'Derawan',
      locationName: 'Kalimantan Timur',
      location: const LatLng(2.2696, 118.2401),
      description: 'Derawan adalah kepulauan yang terkenal dengan pantai pasir putih dan biota laut yang menakjubkan. Dengan laguna yang tenang dan spot penyelaman yang luar biasa, Derawan menjadi surga bagi para penyelam dan pecinta alam. Keberagaman hayati di sini termasuk penyu, ikan tropis, dan terumbu karang yang indah. Pulau Maratua dan Kakaban adalah dua tempat yang paling populer untuk dikunjungi, menawarkan pengalaman yang tak terlupakan bagi wisatawan.',
      imageUrl: 'gambar/drw.jpg',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List Wisata'),
        backgroundColor: Colors.tealAccent,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.blue.shade50, Colors.lightBlue.shade100],
          ),
        ),
        child: ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: attractions.length,
          itemBuilder: (context, index) {
            final attraction = attractions[index];
            return Card(
              margin: const EdgeInsets.only(bottom: 16),
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: InkWell(
                borderRadius: BorderRadius.circular(12),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailWisataPage(
                        title: attraction.title,
                        locationName: attraction.locationName,
                        location: attraction.location,
                        description: attraction.description,
                        imageUrl: attraction.imageUrl,
                      ),
                    ),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(
                          attraction.imageUrl,
                          width: 80,
                          height: 80,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return Container(
                              width: 80,
                              height: 80,
                              color: Colors.grey.shade200,
                              child: const Icon(Icons.photo, size: 30),
                            );
                          },
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              attraction.title,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              attraction.locationName,
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                            //
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}