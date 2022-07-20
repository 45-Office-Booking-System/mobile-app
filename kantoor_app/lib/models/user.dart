class User {
  int id;
  String email;
  String password;
  String name;
  String fullname;
  String alamat;
  String phone;

  User({
    required this.id,
    required this.email,
    required this.password,
    required this.name,
    required this.fullname,
    required this.alamat,
    required this.phone,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json['id'],
        email: json['email'],
        password: json['password'],
        name: json['name'],
        fullname: json['fullname'],
        alamat: json['alamat'],
        phone: json['phone'],
      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['fullname'] = fullname;
    data['password'] = password;
    data['email'] = email;
    data['alamat'] = alamat;
    data['phone'] = phone;
    return data;
  }
}

class UserPreferences {
  static User myUser = User(
    id: 1,
    email: 'indahhhptr@gmail.com',
    name: 'Indah Putri',
    fullname: 'Indah Putri',
    alamat: 'Jl. Ir. H. Juanda No.296, Patokan - Kraksaan',
    phone: '089627839485',
    password: '123456',
  );
}
