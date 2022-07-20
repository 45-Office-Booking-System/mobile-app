import 'package:kantoor_app/models/nearby_model.dart';
import 'package:uuid/uuid.dart';

class GedungModel {
  late String id;
  String nama;
  String jenis;
  String lokasi;
  String hargaBooking;
  double latitude;
  double longitude;
  String deskripsi;
  List<Nearby> nearby;
  List<String> imageUrl;

  GedungModel({
    required this.nama,
    required this.jenis,
    required this.lokasi,
    required this.hargaBooking,
    required this.latitude,
    required this.longitude,
    required this.deskripsi,
    required this.nearby,
    required this.imageUrl,
  }) {
    id = const Uuid().v1();
  }
}

List<GedungModel> listGedung = [
  GedungModel(
    nama: "Harris Hotel Tebet",
    jenis: "Ballroom",
    lokasi: "Jakarta Pusat",
    hargaBooking: "3000000",
    latitude: 0,
    longitude: 0,
    deskripsi: """
Fasilitas :
- AC
- Pryektor jumbo
- Sound system
- Include meja dan kursi

Free: Konsumsi untuk rapat selama 7 hari

Pembayaran paling lambat 1 minggu sebelum penggunaan office

Note : tanyakan terlebih dahulu ketersediaan office sebelum melakukan transaksi
    """,
    nearby: [
      Nearby(
          nama: "Masjid Istiqlal", jarak: 800, latitude: 0.0, longitude: 0.0),
      Nearby(
          nama: "Lapangan lari sudirman",
          jarak: 500,
          latitude: 0.0,
          longitude: 0.0),
    ],
    imageUrl: [
      "https://media-cdn.tripadvisor.com/media/photo-s/1b/bf/ba/72/orange-ballroom-theatre.jpg",
      "https://ik.imagekit.io/tk6ir0e7mng/uploads/2020/10/1603937179245.jpeg",
      "https://www.discoverasr.com/content/dam/tal/media/images/properties/indonesia/bogor/harris-hotel-sentul-city-bogor/meetings-and-events/HSRG-banner-mobile-meeting.jpg.transform/ascott-lowres/image.jpg",
    ],
  ),
  GedungModel(
    nama: "Aryaduta",
    jenis: "Gedung Serbaguna",
    lokasi: "Jakarta Pusat",
    hargaBooking: "5000000",
    latitude: 0,
    longitude: 0,
    deskripsi: """
Fasilitas :
- AC
- Keamanan 24 jam
- Sound system
- Wifi
- Kolam Renang  

Free: Konsumsi untuk rapat selama 7 hari

Pembayaran paling lambat 1 minggu sebelum penggunaan office

Note : tanyakan terlebih dahulu ketersediaan office sebelum melakukan transaksi
    """,
    nearby: [
      Nearby(
          nama: "Restoran Shabu&Agemono",
          jarak: 800,
          latitude: 0.0,
          longitude: 0.0),
      Nearby(
          nama: "Masjid Istiqlal", jarak: 300, latitude: 0.0, longitude: 0.0),
    ],
    imageUrl: [
      "https://img.okezone.com/content/2015/09/22/557/1218795/hotel-aryaduta-jakarta-hadir-di-pusat-kota-dengan-kemewahan-vCfAjoxLMY.jpg",
      "https://asset.kompas.com/crops/b74HZxpQihobPm2yId22bj74T1E=/0x0:0x0/375x240/data/photo/2014/06/30/1611258rps20140630-160940p.jpg",
      "https://s.kaskus.id/r480x480/images/fjb/2016/06/18/hotel_aryaduta_jakarta_pusat_5478169_1466223674.jpg",
    ],
  ),
  GedungModel(
    nama: "Auditorium Harun Nasution UIN Jakarta",
    jenis: "Auditorium",
    lokasi: "Jakarta Selatan",
    hargaBooking: "12000000",
    latitude: 0,
    longitude: 0,
    deskripsi: """
Fasilitas :
- Tribun
- Sound system
- Panggung

Free: Konsumsi untuk rapat selama 7 hari

Pembayaran paling lambat 1 minggu sebelum penggunaan office

Note : tanyakan terlebih dahulu ketersediaan office sebelum melakukan transaksi
    """,
    nearby: [
      Nearby(
          nama: "Masjid Abdurrahman",
          jarak: 400,
          latitude: 0.0,
          longitude: 0.0),
      Nearby(
          nama: "Rumah Makan Ampera",
          jarak: 1000,
          latitude: 0.0,
          longitude: 0.0),
    ],
    imageUrl: [
      "https://www.uinjkt.ac.id/wp-content/uploads/2018/06/halal-1.jpg",
      "http://www.uinjkt.ac.id/wp-content/uploads/2016/11/14906945_2019133414979608_7604633589399443612_n.jpg",
      "https://1.bp.blogspot.com/-HDRln0e3ZbU/WDy0_SJGqjI/AAAAAAAAAQs/mM176uvnkUkzosqc41ixltK5nxmR6xiIQCLcB/s640/UIN102%2BBACK%2BBURN.jpg",
    ],
  ),
  GedungModel(
    nama: "CoHive The Maja",
    jenis: "Meeting Room",
    lokasi: "Jakarta Selatan",
    hargaBooking: "300.000",
    latitude: 0,
    longitude: 0,
    deskripsi: """
Design meeting room yang sangat cozy & vintage ini dapat membuat aktifitas rapat bisnis anda semakin produktif.

Fasilitas :
- Ergonomic Chair
- TV Screen
- White Board 
- Wifi

Kapasitas : 10 Orang

Pembayaran paling lambat 1 minggu sebelum penggunaan office

Alamat Lengkap : Jl. Kyai Maja No 39, Kebayoran Baru, Jakarta Selatan

Note : Harga yang tertera dihitung per jam
    """,
    nearby: [
      Nearby(
          nama: "Veranda Hotel at Pakubuwono",
          jarak: 300,
          latitude: 0.0,
          longitude: 0.0),
      Nearby(nama: "Pasar Mayestik", jarak: 200, latitude: 0.0, longitude: 0.0),
    ],
    imageUrl: [
      "https://s3-ap-southeast-1.amazonaws.com/xwork-gallery/rooms/images/201/1510807354.58/201_1510807354.58.lg.JPEG",
      "https://kekantor.com/wp-content/uploads/2021/04/cohive-the-maja7-800x600.jpeg",
      "https://kekantor.com/wp-content/uploads/2021/04/cohive-the-breeze6-800x600.jpeg",
    ],
  ),
  GedungModel(
    nama: "Grand Ballroom Ambhara",
    jenis: "Hotel",
    lokasi: "Jakarta Selatan",
    hargaBooking: "2.500.000",
    latitude: 0,
    longitude: 0,
    deskripsi: """
Grand Ballroom Ambhara merupakan ruang multi fungsi yang didesain khusus sehingga dapat dimodifikasi menjadi 4 ruang pertemuan terpisah.
Bahkan ruang multifungsi ini dapat digunakan untuk mengadakan pertemuan khusus seperti konferensi, seminar, pernikahan dan lain-lain.

Fasilitas : Flexibel (sesuai kebutuhan)

Pembayaran paling lambat 1 minggu sebelum penggunaan office

Note : tanyakan terlebih dahulu terkait ketersediaan fasilitas yang dibutuhkan.
    """,
    nearby: [
      Nearby(
          nama: "Stube Platz by Stube Group - Restoran Jerman",
          jarak: 100,
          latitude: 0.0,
          longitude: 0.0),
      Nearby(
          nama: "McDOnals Hasanudin Blok M",
          jarak: 500,
          latitude: 0.0,
          longitude: 0.0),
    ],
    imageUrl: [
      "https://ambharahotel.com/wp-content/uploads/2020/02/Grand-Ballroom-1-1.jpeg",
      "https://eventopediacdn.azureedge.net//content/Ambhara-Hotel-1.jpg",
      "https://weddingmarket.com/storage/images_venue/2881596097073526_DSL_0721.JPG",
    ],
  ),
  GedungModel(
    nama: "The Ritz-Carlton Jakarta Pacific Place",
    jenis: "Hotel",
    lokasi: "Jakarta Pusat",
    hargaBooking: "4.500.000",
    latitude: 0,
    longitude: 0,
    deskripsi: """
Akomodasi dengan sertifikat CHSE yang memenuhi protokol kebersihan dari Kemenparekraf.
The Ritz-Carlton Jakarta, Hotel yang menawarkan ruang pertemuan utama untuk pertemuan bisnis dari semua ukuran.
Hubungi keahlian spesialis Layanan Rapat khusus hotel kami yang berkembang dalam menciptakan konferensi yang sempurna dalam skala apa pun.
Tempat pertemuan kami mendukung masa depan yang berkelanjutan dengan menawarkan pilihan layanan air, 
makanan organik dan lokal dan pilihan makanan laut yang berkelanjutan.

Fasilitas :
- Free flow gourmet coffee and tea
- Cozy yet professional interior design
- 50" HD TV
- HDMI Converter
- Whiteboard
- High Speed Wi-Fi
- Flip Chart (By Request)
- Infocus & Projector Screen (By Request)
- Snack Box & Lunch Box (By Request)*
- Administrative and event organizing services
- Access to business center for all guests
- Flexible Space Layout. View our capacity chart.

Layanan:
- Controlling AC
- Layanan Dekorasi Tempat
- Layanan Katering dan Konferensi
- Custom Tema Kreatif
- Teknisi Audio Visual

Lokasi: Jl. Jendral Sudirman Kav 52-53, Sudirman Central Business District, Jakarta Selatan, Jakarta, Indonesia, 12190

Note : Tanyakan kepada tim Penjualan kami untuk informasi lebih rinci tentang berbagai program yang diselenggarakan untuk melayani anda dan membantu melindungi lingkungan.
    """,
    nearby: [
      Nearby(
          nama: "Tanamera Coffee - Pacific Place",
          jarak: 52,
          latitude: 0.0,
          longitude: 0.0),
      Nearby(
          nama: "Stasiun MRT Istora",
          jarak: 258,
          latitude: 0.0,
          longitude: 0.0),
    ],
    imageUrl: [
      "https://foto.hrsstatic.com/fotos/0/3/545/350/80/000000/http%3A%2F%2Ffoto-origin.hrsstatic.com%2Ffoto%2F3%2F9%2F6%2F7%2F396713%2F396713_rt_24614409.jpg/%2Bx6t3eLULEkyhcAWeuSQGA%3D%3D/2048,1366/6/Pacific_Place_The_Ritz-Carlton_Jakarta-Jakarta-Restaurant-4-396713.jpg",
      "https://ik.imgkit.net/3vlqs5axxjf/external/http://www.cfmedia.vfmleonardo.com/imageRepo/7/0/147/773/772/jktrt-meeting-0014-hor-clsc_O.jpg?tr=w-922%2Ch-519%2Cfo-auto",
      "https://venuemagz.com/wp-content/uploads/2017/10/Ritz-Carlton-Pacific-Place-800x480_c.jpg",
    ],
  ),
  GedungModel(
    nama: "Raffles Hotel Meeting Room",
    jenis: "Hotel",
    lokasi: "Jakarta Pusat",
    hargaBooking: "3.500.000",
    latitude: 0,
    longitude: 0,
    deskripsi: """
Fasilitas :
Selama lebih dari satu abad, Raffles telah dikenal sebagai tempat pertemuan para pemikir hebat,
selalu profesional, dengan layanan yang menyesuaikan dengan tujuan acara Anda dan memastikan pengalaman yang tak terlupakan.
Dengan pilihan pertemuan & perayaan yang beragam dan unik, kami akan membuat acara spesial Anda tak terlupakan.

- A-V Equipment
- Business Center
- Administrative Services

Lokasi : Ciputra World 1, Jl Prof Dr Satrio Kav 3 5, Kuningan, Setiabudi, Jakarta, Indonesia, 12940

Note : - 
More Info : www.raffles.com/jakarta/

    """,
    nearby: [
      Nearby(
          nama: "Pizza Marzano - Lotte Shopping Avenue",
          jarak: 22,
          latitude: 0.0,
          longitude: 0.0),
      Nearby(
          nama: "MRCCC Siloam Hospital",
          jarak: 969,
          latitude: 0.0,
          longitude: 0.0),
    ],
    imageUrl: [
      "https://www.rafflesjakarta.com/wp-content/uploads/sites/206/2019/10/eventspage-1200xboardroom.jpg",
      "https://www.raffles.com/assets/0/72/719/720/1472/49c04fbb-8236-4253-8b84-8bf1f97f9c93.jpg",
      "https://www.rafflesjakarta.com/wp-content/uploads/sites/206/2021/09/eventspage-1200xlondon2-600x321.jpg",
    ],
  ),
  GedungModel(
    nama: "Blue Sky Hotel Kemayoran - Meeting Room",
    jenis: "Hotel",
    lokasi: "Jakarta Pusat",
    hargaBooking: "2.000.000",
    latitude: 0,
    longitude: 0,
    deskripsi: """
Blue Sky Hotel Petamburan menyediakan 3 tempat meeting room dengan desain elegan dalam berbagai ukuran untuk mengakomodasi acara apapun. 
Dari pertemuan bisnis hingga acara pribadi, kami menyediakan pengaturan yang ideal untuk pertemuan Anda dengan fasilitas modern yang didukung oleh tim staf yang cakap dan siap mendukung keberhasilan semua pertemuan Anda.

Fasilitas :
- Microphones / Wireless Microphones
- LED Projector + Screen
- Flipchart Board + Spidol
- Memo Pad + Pencil
- Standart Sound System
- Candy + Free Flow Mineral Water
- Reception Table
- Wi-Fi Connection
- Mask & Hand Sainitazer


Note : tanyakan terlebih dahulu ketersediaan meeting room yang tersedia
    """,
    nearby: [
      Nearby(
          nama: "Rose Garden International Restaurant - Slipi",
          jarak: 202,
          latitude: 0.0,
          longitude: 0.0),
      Nearby(
          nama: "Stasiun Juanda", jarak: 4500, latitude: 0.0, longitude: 0.0),
    ],
    imageUrl: [
      "https://cdn.1001malam.com/uploads/hotels/blueskyhotelpetamburan_meetingroom_1251181.jpg",
      "https://cdn.1001malam.com/uploads/hotels/blueskyhotelpetamburan_meetingroom_1251184.jpg",
      "https://static51.com-hotel.com/uploads/hotel/60612/photo/lg_blue-sky-hotel-petamburan_155747787343.jpg",
      "https://img.hotelmurah.com/hotel/myhm_1236_5.jpg",
    ],
  ),
];
