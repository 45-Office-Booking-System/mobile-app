class User {
  String id;
  String email;
  String name;
  String fullname;
  String alamat;
  String phone;
  String password;

  User({
    required this.id,
    required this.email,
    required this.name,
    required this.fullname,
    required this.alamat,
    required this.phone,
    required this.password,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        email: json["email"],
        name: json["name"],
        fullname: json["fullname"],
        alamat: json["alamat"],
        phone: json["phone"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "name": name,
        "fullname": fullname,
        "alamat": alamat,
        "phone": phone,
        "password": password,
      };
}

class UserPreferences {
  static User myUser = User(
    id: '1',
    email: 'indahhhptr@gmail.com',
    name: 'Indah Putri',
    fullname: 'Indah Putri',
    alamat: 'Jl. Ir. H. Juanda No.296, Patokan - Kraksaan',
    phone: '089627839485',
    password: '123456',
  );
}
