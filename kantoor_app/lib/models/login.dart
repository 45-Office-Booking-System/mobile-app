class Login {
  final int idUser;
  final String token;

  Login({required this.idUser, required this.token});

  factory Login.fromJson(Map<String, dynamic> json) => Login(
        idUser: json["id_user"],
        token: json["token"],
      );

  Map<String, dynamic> toJson(Login login) => {
        "id_user": login.idUser,
        "token": login.token,
      };
}
