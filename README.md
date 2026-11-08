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


CIDR GNS3
Berbeda dengan CPT yang menggunakan VLSM biasa, pada topologi GNS3 ini diterapkan metode CIDR (Classless Inter-Domain Routing). Fokus utamanya adalah penggabungan rute (route summarization) agar tabel routing lebih efisien. Blok induk yang digunakan adalah `10.73.0.0/19`.

## 1. Topologi GNS3

Topologi terdiri dari 13 router yang terhubung ke router pusat **Wired**. Subnet dikelompokkan menjadi tiga sayap:

- **Sayap Bawah:** Tachibana, Deus, Protocol7, Knights, Phantoma, Shibuya.
- **Sayap Kanan/Atas:** Cyberia dan Navi.
- **Sayap Kiri (Switch2):** Psyche, Copland, Schumann, Accela.

Sayap Kiri dipecah dua agar digabung dengan wilayah terdekat: Copland dan Schumann ke Sayap Bawah, Psyche dan Accela ke Sayap Kanan/Atas.

*[Tempel screenshot topologi GNS3 di sini]*

## 2. Perhitungan Penggabungan IP (Supernetting)

Penggabungan dilakukan bertahap (bottom-up) per wilayah. Dua blok digabung menjadi blok terkecil yang menutupi keduanya.

- **Tahap 1 (Sayap Bawah):** menggabungkan subnet kecil yang berdekatan, contoh A23 + A22 = B1, lalu naik sampai B11 = `10.73.0.0/22`.
- **Tahap 2 sampai 4:** menambahkan Kiri bawah (C), Navi dan Cyberia (D), serta Kiri atas (E).
- **Tahap akhir:** F1 = C5 + E2 = `10.73.0.0/19`.

**Cara menghitung supernet:** total alamat dua blok yang digabung dibulatkan ke pangkat 2 (rumus 2ⁿ, tanpa dikurangi 2 karena yang digabung adalah blok utuh). Prefix = 32 − n. Hasilnya dicek dengan membandingkan bit alamat awal dan alamat akhir: jumlah bit depan yang sama harus sama dengan prefix.

**Studi kasus CIDR: Subnet B1 (Sayap Bawah)**

B1 adalah gabungan A23 (`10.73.3.40/30`) dan A22 (`10.73.3.44/30`).

a. Menentukan prefix hasil gabungan

- Total yang digabung: 4 + 4 = 8 IP.
- Rumus: 2ⁿ ≥ total. Karena 2² = 4 (kurang) dan 2³ = 8 (cukup), maka n = 3.
- Prefix = 32 − 3 = **/29**. Cara cepat: dua blok /30 berprefix sama digabung menjadi /29 (prefix berkurang 1).
- Pengecekan bit: alamat awal 3.40 = `00101000`, alamat akhir 3.47 = `00101111`. Bit depan yang sama `00101` (5 bit), maka 24 + 5 = /29 (cocok).

b. Menghitung block size

- 2⁽³²⁻²⁹⁾ = 2³ = 8 IP.
- Prefix /29 jatuh di oktet keempat, jadi blok ini memakai 8 angka di oktet keempat.

c. Network ID dan broadcast

- Network ID: diambil dari network ID blok terendah, yaitu A23 = `10.73.3.40`. Syarat aligned terpenuhi karena 40 kelipatan 8.
- Network berikutnya: 40 + 8 = 48, jadi subnet berikutnya mulai di `10.73.3.48`.
- Broadcast: satu angka sebelum network berikutnya, yaitu `10.73.3.47`.

d. Range IP usable

- IP pertama: `10.73.3.41`.
- IP terakhir: `10.73.3.46`.

**Studi kasus CIDR: Hasil akhir F1 (supernet utama)**

F1 adalah gabungan C5 (`10.73.0.0/21`) dan E2 (`10.73.16.0/20`).

a. Menentukan prefix hasil gabungan

- Total: 2048 + 4096 = 6144 IP. Angka ini bukan pangkat 2, sehingga dibulatkan ke atas menjadi 8192 (2¹³). Selisih 2048 adalah ruang cadangan `10.73.8.0` sampai `10.73.15.255` yang berada di antara kedua blok.
- n = 13, prefix = 32 − 13 = **/19**.
- Pengecekan bit: oktet ke-3 alamat awal 0 = `00000000`, alamat akhir 31 = `00011111`. Bit depan yang sama `000` (3 bit), maka 16 + 3 = /19 (cocok).

b. Menghitung block size

- 2⁽³²⁻¹⁹⁾ = 2¹³ = 8192 IP.
- 8192 / 256 = 32, artinya blok ini memakai 32 angka di oktet ketiga.

c. Network ID dan broadcast

- Network ID: `10.73.0.0`. Syarat aligned terpenuhi karena 0 kelipatan 32.
- Network berikutnya: 0 + 32 = 32, jadi `10.73.32.0`.
- Broadcast: `10.73.31.255`.

d. Range IP usable

- IP pertama: `10.73.0.1`.
- IP terakhir: `10.73.31.254`.

**Hasil Akhir Penggabungan (Supernet Utama):**

| Wilayah | Total blok | Dibulatkan | Supernet |
|---|---|---|---|
| Bawah (termasuk Kiri bawah) | 1428 | 2048 | `10.73.0.0/21` |
| Atas dan kanan (termasuk Kiri atas) | 2760 | 4096 | `10.73.16.0/20` |
| **Total (digabung)** | 4188 | 8192 | **`10.73.0.0/19`** |

*[Tempel tabel penggabungan B sampai F dari Excel di sini]*

## 3. Perhitungan Pembagian IP (Subnetting)

Setelah blok induk dibagi ke tiap wilayah, IP dibagi ke setiap subnet (A1 sampai A25) dari yang terbesar ke terkecil.

**Studi kasus: Subnet A4 (Sayap Bawah)**

a. Menentukan prefix (CIDR)

- Kebutuhan: 267 IP.
- Rumus: 2ⁿ − 2 ≥ kebutuhan. Karena 2⁸ = 256 (254, kurang) dan 2⁹ = 512 (510, cukup), maka n = 9.
- Prefix = 32 − 9 = **/23**.

b. Menghitung block size

- 2⁽³²⁻²³⁾ = 2⁹ = 512 IP.
- 512 / 256 = 2, artinya subnet ini memakai 2 angka di oktet ketiga.

c. Network ID dan broadcast

- Network ID: A4 adalah subnet pertama di Sayap Bawah (blok `10.73.0.0/21`), maka dimulai dari `10.73.0.0`.
- Network berikutnya: 0 + 2 = 2, jadi subnet berikutnya mulai di `10.73.2.0`.
- Broadcast: satu angka sebelum network berikutnya, yaitu `10.73.1.255`.

d. Range IP usable

- IP pertama: Network ID + 1 = `10.73.0.1`.
- IP terakhir: Broadcast − 1 = `10.73.1.254`.

**Kenapa B1 dimulai di 10.73.3.40:** subnet A15 (`10.73.3.32/29`, 8 IP) berakhir di 10.73.3.39, sehingga alamat bebas berikutnya 10.73.3.40. Link P2P berukuran /30 (kelipatan 4), dan 40 adalah kelipatan 4, jadi A23 menempati `10.73.3.40/30`.

## 4. Konfigurasi dan Routing

Konfigurasi IP dan routing dilakukan melalui console tiap node (perintah `ip addr` dan `ip route`).

**Konfigurasi router pusat (Wired):** dua rute ringkas ke wilayah di belakang router tetangga, ditambah rute per subnet untuk sayap kiri.

| Tujuan | Next hop |
|---|---|
| `10.73.0.0/22` (semua di belakang Tachibana) | 10.73.3.62 |
| `10.73.24.0/23` (A5 dan A6) | 10.73.26.194 (Navi) |
| `10.73.0.0/19` (blackhole) | pengaman agar alamat kosong tidak berputar |

**Konfigurasi router Cyberia:** satu rute ringkas `10.73.0.0/19` via 10.73.26.198 menggantikan 25 rute terpisah.

**Konfigurasi host (contoh):**

- Karl (A1, Kiri atas): IP `10.73.16.2/22`, gateway `10.73.16.1`.
- Alice (A5, Kanan): IP `10.73.24.2/24`, gateway `10.73.24.1`.

*[Tempel screenshot `ip -br -4 addr`, `ip route` di Wired dan Cyberia, serta `show ip` host di sini]*

## 5. Testing Koneksi (Ping)

Validasi dilakukan dengan ping antar-wilayah (cross-wing) untuk membuktikan routing dan penggabungan CIDR bekerja.

| Dari | Ke | Hasil |
|---|---|---|
| Karl (Kiri atas) | Masayuki (Kiri bawah) | *[isi setelah dites]* |
| Karl (Kiri atas) | Lain (Bawah) | *[isi setelah dites]* |
| Alice (Kanan) | Collective (Bawah) | *[isi setelah dites]* |
| Eiri (Bawah) | Taro (Kanan) | *[isi setelah dites]* |
| Cyberia | 10.73.2.194 melalui rute `/19` | *[isi setelah dites]* |

*[Tempel screenshot hasil ping di sini]*
