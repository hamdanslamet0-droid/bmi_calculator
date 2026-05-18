TUGAS ETS PRAKTIKUM
Pengembangan Praktikum 3 sampai 5
Langkah‑langkah Pembuatan Aplikasi BMI Calculator
1. Persiapan Project
Install Flutter & Dart di komputer.
Buat project baru: flutter create bmi_calculator.
Atur struktur folder: models, services, screens, widgets.
2. Entry Point
Edit main.dart → set tema aplikasi, arahkan ke UserInputScreen.
3. Model Data
Buat file bmi_category.dart → class BmiCategory dengan properti min, max, label, advice, serta getter color dan icon.
4. Service
Buat bmi_service.dart → ambil kategori BMI dari JSON/endpoint.
Buat storage_service.dart → simpan dan load tinggi/berat dengan SharedPreferences.
5. Input Screen
Buat user_input.dart:
Tambahkan widget GenderToggle.
Tambahkan TextField + Slider untuk tinggi dan berat.
Tombol Calculate → navigasi ke BmiResultScreen.
6. Result Screen
Buat bmi_result.dart:
Hitung BMI dengan rumus.
Tentukan kategori menggunakan BmiCategory.
Tampilkan nilai BMI, kategori, advice, warna, dan ikon.
Widget Reusable
Buat gender_toggle.dart: widget toggle interaktif untuk memilih gender.
8. Testing
Jalankan aplikasi dengan flutter run.

Uji input tinggi/berat manual dan slider.

Pastikan hasil BMI sesuai kategori.

**Halaman Utama**
<img width="1920" height="1080" alt="Screenshot (5)" src="https://github.com/user-attachments/assets/360a888b-31d7-48bc-9287-c91d36d4a904" />




**Halaman Result**
<img width="1920" height="1080" alt="Screenshot (6)" src="https://github.com/user-attachments/assets/0499659f-08cf-4b5c-8296-dd6628fbadcb" />


