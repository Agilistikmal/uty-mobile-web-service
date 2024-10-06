# Pertemuan 3 <!-- omit in toc -->

3 Oktober 2024 <br>
_Note: Kode lengkap aplikasi ini ada di folder github "widget_app"_

### Data Diri

| Nama                | NPM        |
| ------------------- | ---------- |
| Agil Ghani Istikmal | 5220411040 |

### Daftar Isi

- [Data Diri](#data-diri)
- [Daftar Isi](#daftar-isi)
- [Flutter Widget Lanjutan](#flutter-widget-lanjutan)
  - [Struktur File](#struktur-file)
  - [Customize AppBar](#customize-appbar)
  - [Form Title](#form-title)
  - [Form Body](#form-body)
  - [Button](#button)
- [ListView Widget](#listview-widget)
  - [ListView Builder](#listview-builder)
- [Referensi](#referensi)

### Flutter Widget Lanjutan

Melanjutkan dari Flutter Widget Pertemuan-2 sebelumnya, disini saya akan mencoba eksplor lebih dalam tentang widget di flutter. <br>
Pada pertemuan ke-3 ini saya fokus untuk belajar melakukan styling dan layouting menggunakan Flutter. Saya membuat form sederhana untuk menampilkan data yang telah diinput. <br>

#### Struktur File

Agar lebih rapi, file dari setiap screen/page akan dipisahkan. Masing masing akan diletakkan dalam folder `lib/screen`. <br>

<p align="middle">
  <img src="./assets/struktur-folder.jpg" />
</p>

Karena menggunakan file file yang berbeda, maka ada sedikit perubahan di file `main.dart`. <br>

```dart
import 'package:flutter/material.dart';
import 'package:widget_app/screen/home_screen.dart'; // Import home screen dari file lain

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
          // Ini adalah tema basic untuk tampilan aplikasi kita
          // Contohnya kita bisa mengubah tema warna dibawah ini menjadi merah
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
          useMaterial3: true,
        ),
        // Untuk menghilangkan banner debug di kanan atas
        debugShowCheckedModeBanner: false,
        // Import HomeScreen dari file yang berbeda
        home: const HomeScreen());
  }
}
```

Pada file `home_screen.dart` hanya berisi tampilan untuk di di halaman atau screen Home saja.

```dart
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<StatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return ...
  }
}
```

#### Customize AppBar

Membuat tampilan AppBar dengan Text ditengah dengan latar belakang indigo.

```dart
Scaffold(
  appBar: AppBar(
    // Center digunakan agar text tampil di posisi tengah
    title: const Center(
      child: Text("Widget App Part 2"),
    ),
    backgroundColor: Colors.indigo,
    // Foreground disini adalah warna untuk Text
    foregroundColor: Colors.white,
  ),
  body: ...
)
```

<p align="middle">
  <img src="./assets/appbar-1.jpg" />
</p>

#### Form Title

```dart
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
```

<p align="middle">
  <img src="./assets/form-1.jpg" />
</p>

#### Form Body

Terdapat 2 input text, yaitu Nama dan NPM menggunakan widget `TextField`.

```dart
Padding(
  padding: const EdgeInsets.symmetric(horizontal: 24),
  child: Container(
    width: MediaQuery.sizeOf(context).width,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(8),
      color: Colors.grey.shade200,
    ),
    child: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 12),
        child: TextField(
          // Untuk styling TextField menggunakan InputDecoration
          decoration: InputDecoration(
            // LabelText adalah judul dari inputan
            labelText: "Nama",
            // HintText adalah placeholder/bantuan pengisian data
            hintText: "Masukkan nama...",
            // Disini saya menghilangkan border agar lebih simple
            border: UnderlineInputBorder(
              borderSide: BorderSide.none,
            ),
          ),
        )),
  ),
),
```

<p align="middle">
  <img src="./assets/input-1.jpg" />
</p>

<p align="middle">
  <img src="./assets/input-2.jpg" />
</p>

<p align="middle">
  <img src="./assets/input-3.jpg" />
</p>

#### Button

Untuk membuat button di flutter bisa menggunakan widget `TextButton`. Namun saya bungkus menggunakan `Padding` dan `Container` agar tampilan lebih rapi dan menarik.

```dart
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
      onPressed: () => {},
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
```

<p align="middle">
  <img src="./assets/button-1.jpg" />
</p>

### ListView Widget

Selanjutnya saya akan mengimplementasikan form dan button sebelumnya untuk menampilkan data di list menggunakan ListView

#### ListView Builder

```dart
ListView.builder(
  itemCount: 1,
  itemBuilder: (context, index) {
    return Container(
      color: Colors.grey.shade300,
      child: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 8),
        child: Column(
          children: [Text("NPM"), Text("Nama")],
        ),
      ),
    );
  },
)
```

Namun terdapat error seperti berikut.

<p align="middle">
  <img src="./assets/listview-error.jpg" />
</p>

Setelah diselidiki, ternyata `ListView` tidak bisa langsung didalam child `Column`, harus di wrap menggunakan widget `Expanded` terlebih dahulu. Jadi seperti berikut

```dart
Expanded(
  child: ListView.builder(
    itemCount: 1,
    itemBuilder: (context, index) {
      return Container(
        color: Colors.grey.shade300,
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 8),
          child: Column(
            children: [Text("NPM"), Text("Nama")],
          ),
        ),
      );
    },
  ),
),
```

### Referensi

https://api.flutter.dev/flutter/widgets/widgets-library.html <br>
https://medium.com/@marketing_96275/how-to-create-and-design-buttons-in-flutter-81e87f709348
