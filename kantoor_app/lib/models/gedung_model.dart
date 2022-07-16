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
      Nearby(nama: "Masjid Istiqlal", jarak: 800, latitude: 0.0, longitude: 0.0),
      Nearby(nama: "Lapangan lari sudirman", jarak: 500, latitude: 0.0, longitude: 0.0),
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
      Nearby(nama: "Restoran Shabu&Agemono", jarak: 800, latitude: 0.0, longitude: 0.0),
      Nearby(nama: "Masjid Istiqlal", jarak: 300, latitude: 0.0, longitude: 0.0),
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
      Nearby(nama: "Masjid Abdurrahman", jarak: 400, latitude: 0.0, longitude: 0.0),
      Nearby(nama: "Rumah Makan Ampera", jarak: 1000, latitude: 0.0, longitude: 0.0),
    ],
    imageUrl: [
      "https://www.uinjkt.ac.id/wp-content/uploads/2018/06/halal-1.jpg",
      "http://www.uinjkt.ac.id/wp-content/uploads/2016/11/14906945_2019133414979608_7604633589399443612_n.jpg",
      "https://1.bp.blogspot.com/-HDRln0e3ZbU/WDy0_SJGqjI/AAAAAAAAAQs/mM176uvnkUkzosqc41ixltK5nxmR6xiIQCLcB/s640/UIN102%2BBACK%2BBURN.jpg",
    ],
  ),
];
