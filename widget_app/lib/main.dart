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

// Stateful artinya dinamis
// ada state yang value nya bisa berubah-ubah
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  String _name = "";

  void _incrementCounter() {
    setState(() {
      // Saat function ini dijalankan (dengan mengklik tombol)
      // maka nilai counter akan bertambah
      _counter++;
    });
  }

  void _setName(String value) {
    setState(() {
      _name = value;
    });
  }

  // build disini akan selalu dibuild ulang saat ada state yang berubah
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Background color disini mengambil value dari colorScheme sebelumnya
        // namun warna akan diinverse agar lebih soft
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // widget.title disini mengambil dari value yang ada di MyHomePage diatas
        title: Text(widget.title),
      ),
      body: Center(
        // Center untuk mempositikan ke tengah secara horizontal dan vertical
        // Child adalah isi yang akan berada diposisi tengah
        child: Column(
          // Column adalah kolom yang berisi widget widget lainnya
          // Bisa diatur posisinya
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 50),
              child: TextField(
                decoration: const InputDecoration(hintText: "Masukkan nama..."),
                onChanged: (value) {
                  _setName(value);
                },
              ),
            ),
            Text(
              '$_name mengklik sebanyak',
            ),
            Text(
              '$_counter kali',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
