# Jarkom-Modul-01-2025-K34


| Nama | NRP |
|------ | ----- |
| Paundra Pujo Darmawan | 5027241008 |

**(Q1) Untuk mempersiapkan pembuatan entitas selain mereka, Eru yang berperan sebagai Router membuat dua Switch/Gateway. Dimana Switch 1 akan menuju ke dua Ainur yaitu Melkor dan Manwe. Sedangkan Switch 2 akan menuju ke dua Ainur lainnya yaitu Varda dan Ulmo. Keempat Ainur tersebut diberi perintah oleh Eru untuk menjadi Client.**

**(Q2) Karena menurut Eru pada saat itu Arda (Bumi) masih terisolasi dengan dunia luar, maka buat agar Eru dapat tersambung ke internet.**

**(Q3) Sekarang pastikan agar setiap Ainur (Client) dapat terhubung satu sama lain.**

**(Q4) Setelah berhasil terhubung, sekarang Eru ingin agar setiap Ainur (Client) dapat mandiri. Oleh karena itu pastikan agar setiap Client dapat tersambung ke internet.**

**(Q5) Ainur terkuat Melkor tetap berusaha untuk menanamkan kejahatan ke dalam Arda (Bumi). Sebelum terjadi kerusakan, Eru dan para Ainur lainnya meminta agar semua konfigurasi tidak hilang saat semua node di restart.**

**(Q6) Setelah semua Ainur terhubung ke internet, Melkor mencoba menyusup ke dalam komunikasi antara Manwe dan Eru. Jalankan file berikut (link file) lalu lakukan packet sniffing menggunakan Wireshark pada koneksi antara Manwe dan Eru, lalu terapkan display filter untuk menampilkan semua paket yang berasal dari atau menuju ke IP Address Manwe. Simpan hasil capture tersebut sebagai bukti.**

**(Q7) Untuk meningkatkan keamanan, Eru memutuskan untuk membuat sebuah FTP Server di node miliknya. Lakukan konfigurasi FTP Server pada node Eru. Buat dua user baru: ainur dengan hak akses write&read dan melkor tanpa hak akses sama sekali ke direktori shared. Buktikan hasil tersebut dengan membuat file teks sederhana kemudian akses file tersebut menggunakan kedua user.**

**(Q8) Ulmo, sebagai penjaga perairan, perlu mengirimkan data ramalan cuaca ke node Eru. Lakukan koneksi sebagai client dari node Ulmo ke FTP Server Eru menggunakan user ainur. Upload sebuah file berikut (link file). Analisis proses ini menggunakan Wireshark dan identifikasi perintah FTP yang digunakan untuk proses upload.**

**(Q9) Eru ingin membagikan "Kitab Penciptaan" di (link file) kepada Manwe. Dari FTP Server Eru, download file tersebut ke node Manwe. Karena Eru merasa Kitab tersebut sangat penting maka ia mengubah akses user ainur menjadi read-only. Gunakan Wireshark untuk memonitor koneksi, identifikasi perintah FTP yang digunakan, dan uji akses user ainur.**

**(Q10) Melkor yang marah karena tidak diberi akses, mencoba melakukan serangan dengan mengirimkan banyak sekali request ke server Eru. Gunakan command ping dari node Melkor ke node Eru dengan jumlah paket yang tidak biasa (spam ping misalnya 100 paket). Amati hasilnya, apakah ada packet loss? Catat average round trip time untuk melihat apakah serangan tersebut mempengaruhi kinerja Eru.**

**(Q11) Sebelum era koneksi aman, Eru sering menyelinap masuk ke wilayah Melkor. Eru perlu masuk ke node tersebut untuk memeriksa konfigurasi, namun ia tahu Melkor mungkin sedang memantau jaringan. Buktikan kelemahan protokol Telnet dengan membuat akun dan password baru di node Melkor kemudian menangkap sesi login Eru ke node Melkor menggunakan Wireshark. Tunjukkan bagaimana username dan password dapat terlihat sebagai plain text.**

**(Q12) Eru mencurigai Melkor menjalankan beberapa layanan terlarang di node-nya. Lakukan pemindaian port sederhana dari node Eru ke node Melkor menggunakan Netcat (nc) untuk memeriksa port 21, 80, dalam keadaan terbuka dan port rahasia 666 dalam keadaan tertutup.**

**(Q13) Setelah insiden penyadapan Telnet, Eru memerintahkan semua koneksi administratif harus menggunakan SSH (Secure Shell) untuk mengamankan jaringan. Lakukan koneksi SSH dari node Varda ke Eru. Tangkap sesi tersebut menggunakan Wireshark. Analisis dan jelaskan mengapa username dan password tidak dapat dilihat seperti pada sesi Telnet. Tunjukkan paket-paket terenkripsi dalam hasil capture sebagai bukti keamanan SSH.**

**(Q14) Setelah gagal mengakses FTP, Melkor melancarkan serangan brute force terhadap  Manwe. Analisis file capture yang disediakan dan identifikasi upaya brute force Melkor. nc 10.15.43.32 3401**

Setelah diberikan sebuah file yang disediakan, kita bisa connect ke service yang disediakan untuk menjawab pertanyaan pertanyaan yang diberikan. File tersebut merupakan network capture yang bisa dibuka menggunakan wireshark.

1. How many packets are recorded in the pcapng file? Format: int

Untuk menjawab pertanyaan tersebut, kita bisa membuka file yang sudah diberikan.

![image](./images/14_1.jpeg)

Bisa dilihat bahwa untuk melihat banyaknya paket yang terekam ada di kolom paling kanan. Dan kita bisa menggulir ke paling bawah untuk melihat total paket yang terekam.

![image](./images/14_2.jpeg)

Maka didapatkan bahwa total paketnya adalah `500358`

2. What are the user that successfully logged in? Format: user:pass

Untuk menjawab pertanyaan tersebut, pertama tama, kita bisa melihat response paket yang gagal dalam melakukan login. Lalu, kita bisa filter kebalikannya.

`http.response && !(data-text-lines contains "Invalid")`

![image](./images/14_3.jpeg)

Dan untuk mengetahui username dan password yang digunakan, kita bisa klik kanan paket tersebut dan Follow -> HTTP Stream. Maka kita bisa menemukan credential yang digunakan, `n1enna:y4v4nn4_k3m3nt4r1`.

![image](./images/14_4.jpeg)

3. In which stream were the credentials found? Format: int

Kita bisa melihat stream pada screenshoot pada soal nomor 3 diatas pada pojok kanan bawah, yaitu `41824`.

4. What tools are used for brute force? Format: Hydra v1.8.0-dev

Kita juga bisa melihat tool yang digunakan untuk brute force pada screenshoot nomor 3 diatas yaitu pada User-Agent: `Fuzz Faster U Fool v2.1.0-dev`

**FLAG: KOMJAR25{Brut3_F0rc3_mkMfCf8l0kT7un3lw5BxxkQ2v}**

**(Q15) Melkor menyusup ke ruang server dan memasang keyboard USB berbahaya pada node Manwe. Buka file capture dan identifikasi pesan atau ketikan (keystrokes) yang berhasil dicuri oleh Melkor untuk menemukan password rahasia. nc 10.15.43.32 3402**

Pada soal ini, kita diberikan attachment baru yang masih berupa captured network traffic. Kita bisa menyambungkan ke connection yang diberikan.

1. What device does Melkor use? Format: string

Untuk mengetahui tersebut, pertama-tama kita bisa buka file tersebut menggunakan wireshark dan mengetahui bahwa protocol yang di captured adalah USB. Kita bisa melihat pada paket ke 6, terdapat Interface Descriptor yang menyebutkan device yang digunakan.

![image](./images/15_1.jpeg)

Diketahui device yang digunakan adalah: `Keyboard`.

2. What did Melkor write? Format: string

Untuk mengetahui hal tersebut, kita bisa menggunakan script yang sudah publik, [CTF-USB-KEYBOARD-PARSER](https://github.com/shark-asmx/CTF-Usb_Keyboard_Parser). Dan kita bisa melihat apa yang di ketik oleh Melkor.

![image](./images/15_2.jpeg)

Maka didapatkan string yang di ketik oleh Melkor adalah `UGx6X3ByMHYxZGVfeTB1cl91czNybjRtZV80bmRfcDRzc3cwcmQ=`

3. What is Melkor's secret message? Format: string

Kita bisa mengetahui bahwa yang di ketik melkor adalah encoded base64, maka kita bisa decode string tersebut.

![image](./images/15_3.jpeg)

Maka didapatkan pesan tersembunyi nya adalah `Plz_pr0v1de_y0ur_us3rn4me_4nd_p4ssw0rd`.





