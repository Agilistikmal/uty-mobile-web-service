import 'package:flutter/material.dart';
import 'package:widget_app/screen/home_screen.dart';

void main() {
  runApp(const MyApp());
}

// Stateless artinya tidak ada perubahan yang dinamis alias statis
// Tidak memerlukan state yang value nya bisa berubah-ubah
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // build adalah root atau jalur utama dari aplikasi kita
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Widget App Demo',
        theme: ThemeData(
          useMaterial3: true,
        ),
        // Untuk menghilangkan banner debug di kanan atas
        debugShowCheckedModeBanner: false,
        // Import HomeScreen dari file yang berbeda
        home: const HomeScreen());
  }
}
