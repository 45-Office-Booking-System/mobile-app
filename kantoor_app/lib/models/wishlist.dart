class Wishlist {
  String status;
  double rating;
  String amountReviews;
  String nama;
  String kota;
  String image;

  Wishlist({
    required this.status,
    required this.rating,
    required this.amountReviews,
    required this.nama,
    required this.kota,
    required this.image,
  });
}

//EXAMPLE CHATS ON HOME SCREEN
List<Wishlist> cards = [
  Wishlist(
    status: "Fully Booking",
    rating: 4.5,
    amountReviews: "112",
    nama: "Meeting Room Hotel Madina Syariah",
    kota: "Surabaya",
    image: "assets/images/kantor1.jpg",
  ),
  Wishlist(
    status: "New",
    rating: 3.5,
    amountReviews: "50",
    nama: "Meeting Room Juanda",
    kota: "Probolinggo",
    image: "assets/images/kantor2.jpg",
  ),
  Wishlist(
    status: "New",
    rating: 3.5,
    amountReviews: "50",
    nama: "Meeting Room Juanda",
    kota: "Probolinggo",
    image: "assets/images/kantor2.jpg",
  ),
  Wishlist(
    status: "New",
    rating: 3.5,
    amountReviews: "50",
    nama: "Meeting Room Juanda",
    kota: "Probolinggo",
    image: "assets/images/kantor2.jpg",
  ),
];
