# Jarkom Modul 4 - Kelompok 19

## Anggota Kelompok

| Nama | NRP |
| --- | --- |
| Ni Putu Maqueenta Wijaya | 5027251004 |
| Malikha Syafira Dewi | 5027251032 |

## Laporan CPT - VLSM

Topologi jaringan dirancang menggunakan Cisco Packet Tracer. Pengalamatan menggunakan metode **VLSM (Variable Length Subnet Mask)** agar setiap segmen dapat menggunakan prefix yang sesuai dengan kebutuhan alamatnya. Berdasarkan spreadsheet, terdapat **25 subnet** dengan total kebutuhan **2.814 IP** dan prefix jaringan induk **/19**.

### Topologi

![Topologi CPT Kelompok 19](./assets/topologi-CPT.png)

Topologi terdiri dari segmen LAN yang menghubungkan router, switch, dan host, serta koneksi point-to-point antar-router. Pada gambar, nama subnet A1 sampai A25 menunjukkan pembagian segmen yang dirinci pada tabel VLSM di bawah ini. A16 merupakan segmen bersama melalui Switch2, sedangkan A17 sampai A25 adalah koneksi point-to-point.

File topologi yang dapat dibuka di Cisco Packet Tracer: [Topologi CPT_K19.pkt](./Topologi%20CPT_K19.pkt).

### Ringkasan Pembagian Prefix

Prefix dipilih berdasarkan kebutuhan alamat pada tiap subnet. Ringkasan berikut menunjukkan jumlah subnet untuk masing-masing prefix pada tabel:

| Prefix | Jumlah subnet | Keterangan |
| --- | ---: | --- |
| /22 | 2 | Segmen dengan kebutuhan alamat terbesar |
| /23 | 2 | Segmen LAN |
| /24 | 2 | Segmen LAN |
| /25 | 2 | Segmen LAN |
| /26 | 4 | Segmen LAN |
| /27 | 1 | Segmen LAN |
| /29 | 3 | Segmen kecil dan segmen bersama A16 |
| /30 | 9 | Koneksi point-to-point A17–A25 |

Dalam VLSM, setiap subnet memakai ukuran blok yang berbeda. Prefix yang lebih pendek menyediakan blok alamat lebih besar, sedangkan prefix yang lebih panjang menyediakan blok lebih kecil. Prefix dan jumlah IP pada tabel diambil dari spreadsheet; detail perhitungan alokasi dapat dilihat di sana.

### Tabel Subnetting VLSM

Kolom **Jumlah IP** dan **Netmask** mengikuti data sumber. Nama pada kolom rute menunjukkan perangkat atau host yang berada di segmen terkait.

| Subnet | Rute / segmen | Jumlah IP | Netmask |
| --- | --- | ---: | --- |
| A1 | Psyche > Switch3 > Karl (700 host), Lin (180 host) | 881 | /22 |
| A2 | Accela > Switch5 > Omnipresence (510 host), Denpa (3 host) | 514 | /22 |
| A3 | Copland > Switch4 > Masayuki (300 host) | 301 | /23 |
| A4 | Tachibana > Switch9 > Collective (260 host), Ghost (6 host) | 267 | /23 |
| A5 | Navi > Switch6 > Alice (208 host), Reika (45 host) | 254 | /24 |
| A6 | Navi > Switch8 > Yasuo (120 host), Miho (18 host), Kuma (4 host) | 143 | /24 |
| A7 | Cyberia > Switch1 > JJ (95 host), MyuMyu (30 host) | 126 | /25 |
| A8 | Deus > Switch10 > Lilith (77 host), Specter (21 host) | 99 | /25 |
| A9 | Copland > Juri (31 host) | 32 | /26 |
| A10 | Navi > Switch7 > Taro (57 host) | 58 | /26 |
| A11 | Protocol7 > Switch11 > Chisa (23 host), Hodgeson (9 host) | 33 | /26 |
| A12 | Shibuya > Switch13 > Lain (57 host), Mika (4 host) | 62 | /26 |
| A13 | Phamoma > Switch12 > Semi (14 host) | 15 | /27 |
| A14 | Schumann > Akashic (3 host) | 4 | /29 |
| A15 | Knights > Eiri (2 host) | 3 | /29 |
| A16 | Switch2 Segment (Wired - Psyche - Copland - Schumann) | 4 | /29 |
| A17 | P2P: Cyberia > Wired | 2 | /30 |
| A18 | P2P: Wired > Tachibana | 2 | /30 |
| A19 | P2P: Wired > Navi | 2 | /30 |
| A20 | P2P: Tachibana > Deus | 2 | /30 |
| A21 | P2P: Deus > Protocol7 | 2 | /30 |
| A22 | P2P: Protocol7 > Knights | 2 | /30 |
| A23 | P2P: Knights > Phamoma | 2 | /30 |
| A24 | P2P: Phamoma > Shibuya | 2 | /30 |
| A25 | P2P: Schumann > Accela | 2 | /30 |
| **Total** | **25 subnet** | **2.814** | **/19** |

### Contoh Testing
Jalankan dari `Karl`
```sh
ping 10.73.15.2
```
Jalankan dari `Shibuya`
```sh
enable
ping 10.73.0.2
```

### Referensi
- [Spreadsheet subnetting VLSM](https://docs.google.com/spreadsheets/d/1nVZ1kbNtTvpj7fBITO0Vh2FDM34ZA0pB/edit?gid=1538066846#gid=1538066846)