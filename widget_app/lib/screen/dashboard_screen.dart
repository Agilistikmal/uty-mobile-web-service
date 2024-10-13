import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:widget_app/model/data.dart';

class DashboardScreen extends StatefulWidget {
  // Menyiapkan variable untuk menampung data
  final TextEditingController username;
  final TextEditingController password;

  const DashboardScreen({
    super.key,
    required this.username,
    required this.password,
  });

  @override
  State<StatefulWidget> createState() =>
      // Meneruskan data ke Screen State
      // ignore: no_logic_in_create_state
      _DashboardScreenState(username: username, password: password);
}

class _DashboardScreenState extends State<DashboardScreen> {
  _DashboardScreenState({required this.username, required this.password});

  // Menyiapkan variable untuk menampung data
  final TextEditingController username;
  final TextEditingController password;

  // Membuat data dummy untuk ditampilkan
  final List<Data> datalist = [
    Data(image: "makan1.jpg", name: "Mie Ayam Bakso", price: "15.000"),
    Data(image: "makan2.jpeg", name: "Nasi Goreng", price: "25.000"),
    Data(image: "makan3.jpg", name: "Sate Ayam", price: "20.000"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dashboard"),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Container(
            color: Colors.grey.shade200,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
              child: Row(
                children: [
                  // Menambahkan gambar profil dibagian kiri
                  const Image(
                    image: AssetImage("assets/profile.png"),
                    width: 50,
                  ),
                  // Untuk jarak dari gambar ke text
                  const SizedBox(
                    width: 16,
                  ),
                  // Menambahkan column agar text bisa atas bawah
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Halo, selamat pagi",
                        style: TextStyle(fontSize: 18),
                      ),
                      // Mengambil data username
                      Text(
                        username.text,
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: ClipRRect(
              // Agar gambar ada lekukan diujung
              borderRadius: BorderRadius.circular(12),
              child: Image(
                  image: const AssetImage("assets/sushi.jpg"),
                  // Agar gambar membesar ke ukuran ClipRREct
                  fit: BoxFit.cover,
                  height: 150,
                  // Membuat gambar lebarnya full
                  width: MediaQuery.sizeOf(context).width),
            ),
          ),
          Expanded(
            child: ListView.builder(
              // Mengambil jumlah data
              itemCount: datalist.length,
              itemBuilder: (context, index) {
                return Padding(
                  // Memberikan padding
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 8,
                  ),
                  child: Container(
                    color: Colors.grey.shade200,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 8),
                      child: Row(
                        children: [
                          ClipRRect(
                            // Agar sudut tidak lancip
                            borderRadius: BorderRadius.circular(12),
                            child: Image(
                              // Mengambil gambar sesuai setiap menu
                              image:
                                  AssetImage("assets/${datalist[index].image}"),
                              width: 100,
                              height: 100,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(
                            width: 24,
                          ),
                          Column(
                            // Agar text rata kiri
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Mengambil nama sesuai menu
                              Text(
                                "${datalist[index].name}",
                                style: const TextStyle(
                                    fontWeight: FontWeight.w500, fontSize: 18),
                              ),
                              // Mengambil harga sesuai menu
                              Text("Rp${datalist[index].price}")
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
