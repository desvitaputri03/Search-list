import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  final String category;

  const DetailPage({super.key, required this.category});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  TextEditingController searchController = TextEditingController();
  String searchQuery = "";

  final List<Map<String, String>> staffList = [
    {'name': 'Ridwan Adrian', 'role': 'Math Teacher', 'image': 'gambar/dosen1.jpg'},
    {'name': 'Desvita Putri', 'role': 'Supervisor', 'image': 'gambar/dosen2.jpg'},
    {'name': 'Shafaussarirah', 'role': 'Admin', 'image': 'gambar/dosen3.jpg'},
    {'name': 'Angel Kyla', 'role': 'Class Teacher', 'image': 'gambar/dosen1.jpg'},
    {'name': 'Lula Selvia', 'role': 'Admin', 'image': 'gambar/dosen2.jpg'},
    {'name': 'Ayunda Rizqa', 'role': 'Class Teacher', 'image': 'gambar/dosen3.jpg'},
  ];

  @override
  Widget build(BuildContext context) {
    // Filter staffList sesuai searchQuery
    List<Map<String, String>> filteredStaff = staffList.where((staff) {
      return staff['name']!.toLowerCase().contains(searchQuery.toLowerCase()) ||
          staff['role']!.toLowerCase().contains(searchQuery.toLowerCase());
    }).toList();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            Row(
              children: [
                const CircleAvatar(
                  radius: 24,
                  backgroundImage: AssetImage('gambar/dosen1.jpg'),
                ),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text('Lucas Wilson', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                    Text('Thomas Jefferson High School', style: TextStyle(color: Colors.black54, fontSize: 13)),
                  ],
                ),
                const Spacer(),
                const CircleAvatar(
                  radius: 20,
                  backgroundColor: Color(0xFFFFCC4D),
                  child: Icon(Icons.refresh, color: Colors.white),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Staff available for ${widget.category}',
                style: const TextStyle(color: Colors.blueAccent, fontSize: 14),
              ),
            ),
            const SizedBox(height: 8),

            // Search Bar Staff
            TextField(
              controller: searchController,
              onChanged: (value) {
                setState(() {
                  searchQuery = value;
                });
              },
              decoration: InputDecoration(
                hintText: 'Search staff by name or role',
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: Colors.grey[200],
                contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 12),

            // List Staff
            Expanded(
              child: filteredStaff.isEmpty
                  ? const Center(child: Text("No staff found", style: TextStyle(color: Colors.grey)))
                  : ListView.builder(
                itemCount: filteredStaff.length,
                itemBuilder: (context, index) {
                  final staff = filteredStaff[index];
                  return ListTile(
                    contentPadding: const EdgeInsets.symmetric(vertical: 4),
                    leading: CircleAvatar(
                      backgroundImage: AssetImage(staff['image']!),
                    ),
                    title: Text(staff['name']!, style: const TextStyle(fontWeight: FontWeight.bold)),
                    subtitle: Text(staff['role']!),
                    trailing: const Icon(Icons.phone, color: Colors.blueAccent),
                    onTap: () {},
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}