import 'package:flutter/material.dart';
import 'package:kantoor_app/models/gedung_model.dart';
import 'package:kantoor_app/utils/theme.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';

class WishlistScreen extends StatefulWidget {
  const WishlistScreen({Key? key}) : super(key: key);

  @override
  State<WishlistScreen> createState() => _WishlistScreenState();
}

class _WishlistScreenState extends State<WishlistScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Wishlist",
          style: titleTextStyle.copyWith(fontSize: 18),
        ),
        backgroundColor: colorWhite,
        centerTitle: true,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              ..._buildCarouselListView(),
            ],
          )),
    );
  }

  _buildCarouselListView() {
    return listGedung.map((item) {
      return Builder(
        builder: (BuildContext context) {
          return InkWell(
            onTap: () {
              // Navigator.of(context).push(
              //   PageRouteBuilder(
              //     pageBuilder: (context, animation, secondaryAnimation) {
              //       // return DetailScreen(id: item);
              //     },
              //     transitionsBuilder:
              //         (context, animation, secondaryAnimation, child) {
              //       const begin = Offset(0.0, 1.0);
              //       const end = Offset.zero;
              //       final tween = Tween(begin: begin, end: end);
              //       final offsetAnimation = animation.drive(tween);
              //       return SlideTransition(
              //         position: offsetAnimation,
              //         child: child,
              //       );
              //     },
              //     transitionDuration: const Duration(milliseconds: 500),
              //   ),
              // );
            },
            child: Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 160,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      image: DecorationImage(
                        image: NetworkImage(item.imageUrl[0]),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 5.0,
                  ),
                  RatingStars(
                    valueLabelVisibility: false,
                    value: 3.5,
                    onValueChanged: (v) {},
                    starBuilder: (index, color) => Icon(
                      Icons.star,
                      color: color,
                    ),
                    starCount: 5,
                    starSize: 20,
                    maxValue: 5,
                    starSpacing: 2,
                    animationDuration: const Duration(milliseconds: 1000),
                    valueLabelPadding: const EdgeInsets.symmetric(vertical: 1, horizontal: 8),
                    valueLabelMargin: const EdgeInsets.only(right: 8),
                    starOffColor: const Color(0xffe7e8ea),
                    starColor: Colors.yellow,
                  ),
                  const SizedBox(
                    height: 5.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 4.0),
                    child: Text(
                      item.nama,
                      style: titleTextStyle.copyWith(
                        color: colorBlack,
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 4.0),
                    child: Text(
                      item.lokasi,
                      style: subtitleTextStyle.copyWith(
                        color: colorBlack,
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      );
    });
  }
  //   Widget _buildDetailGedung(nama, kota) {
  //   return Column(
  //     mainAxisAlignment: MainAxisAlignment.start,
  //     children: [
  //       Text(
  //         nama,
  //         style: titleTextStyle.copyWith(
  //           color: colorBlack,
  //           fontSize: 14,
  //         ),
  //       ),
  //       Text(
  //         kota,
  //         style: subtitleTextStyle.copyWith(
  //           color: colorBlack,
  //           fontSize: 12,
  //         ),
  //       ),
  //     ],
  //   );
  // }

  // Widget _buildStatusGedung(status) {
  //   return ClipPath(
  //     clipper: ClipClipper(),
  //     child: Container(
  //       margin: const EdgeInsets.all(10),
  //       height: 30,
  //       width: 125,
  //       color: Colors.red,
  //       child: Text(
  //         status,
  //         style: subtitleTextStyle.copyWith(
  //           color: colorWhite,
  //         ),
  //         textAlign: TextAlign.center,
  //       ),
  //     ),
  //   );
  // }
}

// class ClipClipper extends CustomClipper<Path> {
//   @override
//   Path getClip(Size size) {
//     Path path = Path();
//     path.lineTo(0, size.height); //buat garis ke bawah
//     path.lineTo(size.width, size.height); //garis ke samping
//     path.lineTo(size.width - 20, size.height / 2);
//     path.lineTo(size.width, 0);
//     return path;
//   }

//   @override
//   bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
// }

// Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Padding(
//               padding: const EdgeInsets.all(15.0),
//               child: SizedBox(
//                 height: MediaQuery.of(context).size.height,
//                 child: ListView.builder(
//                   itemCount: cards.length,
//                   itemBuilder: (BuildContext context, index) {
//                     final Wishlist card = cards[index];
//                     String rtng = card.rating.toString();
//                     return Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Column(
//                         children: [
//                           InkWell(
//                             onTap: () {},
//                             child: Container(
//                               decoration: BoxDecoration(
//                                 boxShadow: [
//                                   BoxShadow(
//                                     color: Colors.black.withOpacity(0.2),
//                                   )
//                                 ],
//                                 borderRadius: BorderRadius.circular(20),
//                               ),
//                               child: Stack(
//                                 children: [
//                                   Container(
//                                     decoration: BoxDecoration(
//                                       borderRadius: BorderRadius.circular(20),
//                                       color: colorWhite,
//                                       boxShadow: [
//                                         BoxShadow(
//                                           color: Colors.black.withOpacity(0.2),
//                                           spreadRadius: 0,
//                                           blurRadius: 1.5,
//                                           offset: const Offset(0, 0),
//                                         )
//                                       ],
//                                     ),
//                                     child: Padding(
//                                       padding: const EdgeInsets.all(8.0),
//                                       child: Column(
//                                         children: [
//                                           Container(
//                                             height: 150,
//                                             width: MediaQuery.of(context)
//                                                 .size
//                                                 .width,
//                                             decoration: BoxDecoration(
//                                               image: const DecorationImage(
//                                                 image: NetworkImage(
//                                                     "https://media.istockphoto.com/photos/jakarta-skycrapers-picture-id1371966285?b=1&k=20&m=1371966285&s=170667a&w=0&h=cyxDR2diZuBMf2KnkxHtGzpeGc6tpZH_40nyPkwzi0M="),
//                                                 fit: BoxFit.cover,
//                                               ),
//                                               borderRadius:
//                                                   BorderRadius.circular(20),
//                                             ),
//                                           ),
//                                           const SizedBox(
//                                             height: 5.0,
//                                           ),
//                                           Row(
//                                             children: [
//                                               RatingStars(
//                                                 valueLabelVisibility: false,
//                                                 value: card.rating,
//                                                 onValueChanged: (v) {},
//                                                 starBuilder: (index, color) =>
//                                                     Icon(
//                                                   Icons.star,
//                                                   color: color,
//                                                 ),
//                                                 starCount: 5,
//                                                 starSize: 20,
//                                                 maxValue: 5,
//                                                 starSpacing: 2,
//                                                 animationDuration:
//                                                     const Duration(
//                                                         milliseconds: 1000),
//                                                 valueLabelPadding:
//                                                     const EdgeInsets.symmetric(
//                                                         vertical: 1,
//                                                         horizontal: 8),
//                                                 valueLabelMargin:
//                                                     const EdgeInsets.only(
//                                                         right: 8),
//                                                 starOffColor:
//                                                     const Color(0xffe7e8ea),
//                                                 starColor: Colors.yellow,
//                                               ),
//                                               Text(
//                                                 rtng,
//                                                 style:
//                                                     subtitleTextStyle.copyWith(
//                                                   fontSize: 11,
//                                                   color: colorBlack,
//                                                   fontWeight: FontWeight.bold,
//                                                 ),
//                                               ),
//                                               Text(
//                                                 ' ( ' +
//                                                     card.amountReviews +
//                                                     ' Reviews )',
//                                                 style:
//                                                     subtitleTextStyle.copyWith(
//                                                   color: colorBlack,
//                                                   fontWeight: FontWeight.bold,
//                                                 ),
//                                               ),
//                                             ],
//                                           ),
//                                           const SizedBox(
//                                             height: 5.0,
//                                           ),
//                                           _buildDetailGedung(
//                                               card.nama, card.kota),
//                                           const SizedBox(
//                                             height: 5.0,
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                   ),
//                                   _buildStatusGedung(card.status),
//                                 ],
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     );
//                   },
//                 ),
//               ),
//             ),
//           ],
//         ),