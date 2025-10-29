import 'dart:io';

class Reservasi {
  String nama;
  String tanggal;
  int jumlahOrang;

  Reservasi(this.nama, this.tanggal, this.jumlahOrang);
}

void main() {
  List<Reservasi> daftarReservasi = [];

  while (true) {
    print('\n=== SISTEM RESERVASI ===');
    print('1. Tambah Reservasi');
    print('2. Lihat Semua Reservasi');
    print('3. Hapus Reservasi');
    print('4. Keluar');
    stdout.write('Pilih menu (1-4): ');
    String? pilihan = stdin.readLineSync();

    switch (pilihan) {
      case '1':
        tambahReservasi(daftarReservasi);
        break;
      case '2':
        lihatReservasi(daftarReservasi);
        break;
      case '3':
        hapusReservasi(daftarReservasi);
        break;
      case '4':
        print('Terima kasih! Program selesai.');
        exit(0);
      default:
        print('Pilihan tidak valid.');
    }
  }
}

void tambahReservasi(List<Reservasi> daftar) {
  stdout.write('\nMasukkan nama pemesan: ');
  String nama = stdin.readLineSync()!;

  stdout.write('Masukkan tanggal reservasi (contoh: 2025-10-30): ');
  String tanggal = stdin.readLineSync()!;

  stdout.write('Masukkan jumlah orang: ');
  int jumlah = int.parse(stdin.readLineSync()!);

  daftar.add(Reservasi(nama, tanggal, jumlah));
  print('\n✅ Reservasi berhasil ditambahkan!');
}

void lihatReservasi(List<Reservasi> daftar) {
  if (daftar.isEmpty) {
    print('\nBelum ada reservasi.');
  } else {
    print('\n=== DAFTAR RESERVASI ===');
    for (int i = 0; i < daftar.length; i++) {
      print(
          '${i + 1}. Nama: ${daftar[i].nama}, Tanggal: ${daftar[i].tanggal}, Orang: ${daftar[i].jumlahOrang}');
    }
  }
}

void hapusReservasi(List<Reservasi> daftar) {
  if (daftar.isEmpty) {
    print('\nBelum ada reservasi untuk dihapus.');
    return;
  }

  lihatReservasi(daftar);
  stdout.write('\nMasukkan nomor reservasi yang ingin dihapus: ');
  int index = int.parse(stdin.readLineSync()!);

  if (index < 1 || index > daftar.length) {
    print('Nomor tidak valid.');
  } else {
    daftar.removeAt(index - 1);
    print('\n🗑️ Reservasi berhasil dihapus.');
  }
}
