class User {
  String id;
  String nama;
  String imgPath;
  String username;
  String jnsKelamin;
  String email;
  String noHP;
  String alamat;
  String password;

  User({
    required this.id,
    required this.nama,
    required this.imgPath,
    required this.username,
    required this.jnsKelamin,
    required this.email,
    required this.noHP,
    required this.alamat,
    required this.password,
  });
}

class UserPreferences {
  static User myUser = User(
    id: '1',
    nama: 'Indah Putri',
    jnsKelamin: 'Perempuan',
    imgPath:
        'https://images.unsplash.com/photo-1554151228-14d9def656e4?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=333&q=80',
    username: 'indahptr_',
    email: 'indahhhptr@gmail.com',
    alamat: 'Jl. Ir. H. Juanda No.296, Patokan - Kraksaan',
    password: '123456',
    noHP: '089627839485',
  );
}
