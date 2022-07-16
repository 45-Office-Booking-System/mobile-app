import 'package:uuid/uuid.dart';

class Nearby {
  late String id;
  String nama;
  int jarak;
  double latitude;
  double longitude;

  Nearby({
    required this.nama,
    required this.jarak,
    required this.latitude,
    required this.longitude,
  }) {
    id = const Uuid().v1();
  }
}
