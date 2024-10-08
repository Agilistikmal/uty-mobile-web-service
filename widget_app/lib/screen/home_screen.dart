import 'package:flutter/material.dart';
import 'package:widget_app/model/data.dart';
import 'package:widget_app/screen/another_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<StatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Sebagai control dan untuk mengambil nilai TextField
  final npmController = TextEditingController();
  final nameController = TextEditingController();

  // Menyimpan list data
  List<Data> dataList = [];

  // Untuk menambahkan data ke list
  void addToDataList(String npm, String name) {
    setState(() {
      dataList.add(Data(npm: npm, name: name));
    });
  }

  // Untuk membersihkan TextField saat state dimuat baru
  @override
  void dispose() {
    npmController.dispose();
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Center digunakan agar text tampil di posisi tengah
        title: const Center(
          child: Text("Widget App Part 2"),
        ),
        backgroundColor: Colors.indigo,
        // Foreground disini adalah warna untuk Text
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          const SizedBox(height: 50),
          Padding(
            // Padding menggunakan symmetric agar bisa mengatur horizontal dan vertical yang berbeda.
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
            // Container digunakan agar dapat memberi kesan kotak dan bisa diberi warna.
            child: Container(
              // MediaQuery width ini bisa diartikan sebagai Full width
              width: MediaQuery.sizeOf(context).width,
              // Alignment center agar konten didalam container ini di tengah
              alignment: Alignment.center,
              // BoxDecoration untuk memberikan border radius, warna, dan styling lainnya
              decoration: BoxDecoration(
                  // circular artinya disemua sisi memiliki radius yang sama
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.indigo.shade50),
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                child: Text(
                  "Masukkan Identitas Anda",
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.indigo,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Container(
              width: MediaQuery.sizeOf(context).width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.grey.shade200,
              ),
              child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: TextField(
                    // Untuk styling TextField menggunakan InputDecoration
                    decoration: const InputDecoration(
                      // LabelText adalah judul dari inputan
                      labelText: "Nama",
                      // HintText adalah placeholder/bantuan pengisian data
                      hintText: "Masukkan nama...",
                      // Disini saya menghilangkan border agar lebih simple
                      border: UnderlineInputBorder(
                        borderSide: BorderSide.none,
                      ),
                    ),
                    controller: nameController,
                  )),
            ),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Container(
              width: MediaQuery.sizeOf(context).width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.grey.shade200,
              ),
              child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: TextField(
                    decoration: const InputDecoration(
                      labelText: "NPM",
                      hintText: "Masukkan NPM...",
                      border: UnderlineInputBorder(
                        borderSide: BorderSide.none,
                      ),
                    ),
                    controller: npmController,
                  )),
            ),
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Container(
              width: MediaQuery.sizeOf(context).width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                // Disini saya memberi warna tombol menjadi indigo
                color: Colors.indigo,
              ),
              child: TextButton(
                // Saat Tombol di klik, maka akan mengubah state dan menampilkan datanya di section bawah ini.
                onPressed: () => {
                  // Menambahkan data ke list
                  addToDataList(npmController.text, nameController.text),
                  // Menghapus value npm dan nama dari textfield
                  npmController.clear(),
                  nameController.clear()
                },
                // Menggunakan row agar icon dan text tampil secara horizontal
                child: const Row(
                  // Main axis alignment center berarti semua konten didalam row akan berada di tengah
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Widget Icon untuk menampilkan Icon yang sudah ada di Flutter
                    Icon(
                      Icons.send_rounded,
                      color: Colors.white,
                    ),
                    SizedBox(width: 8),
                    Text(
                      "Next",
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 24),
          Container(
            color: Colors.grey.shade300,
            width: MediaQuery.sizeOf(context).width,
            height: 4,
          ),
          const SizedBox(height: 16),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              // itemCount adalah jumlah dari item yang akan dibuat, disini menggunakan length dari list agar dinamis
              itemCount: dataList.length,
              // itemBuilder adalah widget yang akan dibuat untuk setiap perulangan sesuai jumlah itemCount
              itemBuilder: (context, index) {
                // Mengambil data dari list sesuai index
                final data = dataList[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.indigo.shade50,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 24, vertical: 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            data.npm!,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.indigo,
                              fontSize: 18,
                            ),
                          ),
                          Text(
                            data.name!,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
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
          const SizedBox(
            height: 24,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Container(
              width: MediaQuery.sizeOf(context).width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                // Disini saya memberi warna tombol menjadi indigo dengan shade 50
                color: Colors.indigo.shade50,
              ),
              child: TextButton(
                // Saat Tombol di klik, maka akan pindah ke halaman AnotherScreen
                onPressed: () => {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const AnotherScreen(),
                  ))
                },
                // Menggunakan row agar icon dan text tampil secara horizontal
                child: const Row(
                  // Main axis alignment center berarti semua konten didalam row akan berada di tengah
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Widget Icon untuk menampilkan Icon yang sudah ada di Flutter
                    Icon(
                      Icons.navigate_next,
                      color: Colors.indigo,
                    ),
                    SizedBox(width: 8),
                    Text(
                      "Go to another page",
                      style: TextStyle(color: Colors.indigo),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 24,
          )
        ],
      ),
    );
  }
}
