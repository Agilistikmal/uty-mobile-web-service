import 'package:flutter/material.dart';
import 'package:widget_app/screen/dashboard_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<StatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Sebagai control dan untuk mengambil nilai TextField
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  // Untuk membersihkan TextField saat state dimuat baru
  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Center digunakan agar text tampil di posisi tengah
        title: const Center(
          child: Text("Welcome"),
        ),
        backgroundColor: Colors.indigo,
        // Foreground disini adalah warna untuk Text
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          const Image(
            image: AssetImage("assets/logo.png"),
            height: 250,
          ),
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
                  color: Colors.indigo),
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                child: Text(
                  "Login",
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
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
                      labelText: "Username",
                      // HintText adalah placeholder/bantuan pengisian data
                      hintText: "Masukkan username...",
                      // Disini saya menghilangkan border agar lebih simple
                      border: UnderlineInputBorder(
                        borderSide: BorderSide.none,
                      ),
                    ),
                    controller: usernameController,
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
                    obscureText: true,
                    decoration: const InputDecoration(
                      labelText: "Password",
                      hintText: "Masukkan P@ssw0rd...",
                      border: UnderlineInputBorder(
                        borderSide: BorderSide.none,
                      ),
                    ),
                    controller: passwordController,
                  )),
            ),
          ),
          const SizedBox(
            height: 2,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                TextButton(
                  onPressed: () => {},
                  child: const Text(
                    "Lupa Password?",
                    style: TextStyle(color: Colors.indigo),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 2),
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
                // Saat Tombol di klik, maka akan mengirim datanya ke DashboardScreen
                onPressed: () => {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => DashboardScreen(
                        username: usernameController,
                        password: passwordController,
                      ),
                    ),
                  )
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
                      "Login",
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Belum punya akun?"),
              TextButton(
                onPressed: () => {},
                child: const Text(
                  "Register disini",
                  style: TextStyle(color: Colors.indigo),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
