import 'package:flutter/material.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'package:kantoor_app/screens/main/home/live_chat_screen.dart';
import 'package:kantoor_app/utils/theme.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({Key? key}) : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(),
            _buildHargaText(),
            _buildTitleText(),
            const Divider(
              color: primaryColor100,
              thickness: 8,
            ),
            _buildLokasiText(),
            const Divider(
              color: primaryColor100,
              thickness: 8,
            ),
            _buildDeskripsiText(),
            const Divider(
              color: primaryColor100,
              thickness: 8,
            ),
            _buildPeta(),
            const Divider(
              color: primaryColor100,
              thickness: 8,
            ),
            _buildReviewText(),
          ],
        ),
      ),
      bottomNavigationBar: InkWell(
        onTap: () {
          Navigator.of(context).push(
            PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) {
                return const LiveChatScreen();
              },
              transitionsBuilder: (context, animation, secondaryAnimation, child) {
                const begin = Offset(0.0, 1.0);
                const end = Offset.zero;
                final tween = Tween(begin: begin, end: end);
                final offsetAnimation = animation.drive(tween);
                return SlideTransition(
                  position: offsetAnimation,
                  child: child,
                );
              },
              transitionDuration: const Duration(milliseconds: 500),
            ),
          );
        },
        child: Container(
          height: 60,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            color: primaryColor500,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.message,
                color: colorWhite,
                size: 30,
              ),
              const SizedBox(
                width: 8.0,
              ),
              Text(
                'Tanyakan Ketersediaan',
                style: titleTextStyle.copyWith(
                  color: colorWhite,
                  fontSize: 18.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Stack(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: 250,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/bg_detail.png'),
              fit: BoxFit.fill,
            ),
          ),
        ),
        SafeArea(
          child: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.only(left: 12.0, top: 12.0),
              height: 40,
              width: 40,
              decoration: const BoxDecoration(
                color: colorWhite,
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.arrow_back),
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 225),
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          width: MediaQuery.of(context).size.width,
          height: 50,
          decoration: BoxDecoration(
            color: colorWhite,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Row(
            children: [
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
              Padding(
                padding: const EdgeInsets.only(left: 8.0, top: 4.0),
                child: Text(
                  '(3.5/5)',
                  style: subtitleTextStyle.copyWith(
                    color: colorBlack,
                    fontSize: 15,
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget _buildHargaText() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Text(
        'Rp. 1.000.000,-',
        style: titleTextStyle.copyWith(
          fontSize: 20.0,
          color: primaryColor500,
        ),
      ),
    );
  }

  Widget _buildTitleText() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            flex: 8,
            child: Text(
              'Office Meeting Room Montana Building lt 7',
              style: titleTextStyle.copyWith(
                fontSize: 24,
                color: colorBlack,
              ),
              overflow: TextOverflow.clip,
            ),
          ),
          Flexible(
            flex: 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.bookmark_outline,
                  size: 30,
                ),
                Text(
                  'Add to Wishlist',
                  style: subtitleTextStyle.copyWith(
                    color: colorBlack,
                    fontSize: 10,
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 2,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLokasiText() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Lokasi',
            style: titleTextStyle.copyWith(
              fontSize: 18.0,
              color: colorBlack,
            ),
          ),
          Text(
            'Jakarta',
            style: subtitleTextStyle.copyWith(
              fontSize: 16,
              color: colorBlack,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDeskripsiText() {
    String deskripsi = """
Fasilitas :
- AC
- TV
- Kulkas
- Wifi

Free: Konsumsi untuk rapat selama 7 hari

Pembayaran paling lambat 1 minggu sebelum penggunaan office

Note : tanyakan terlebih dahulu ketersediaan office sebelum melakukan transaksi""";
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Deskripsi',
            style: titleTextStyle.copyWith(
              fontSize: 18.0,
              color: colorBlack,
            ),
          ),
          Text(
            deskripsi,
            style: subtitleTextStyle.copyWith(
              fontSize: 14,
              color: colorBlack,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPeta() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
      child: Column(
        children: [
          Text(
            'Peta',
            style: titleTextStyle.copyWith(
              fontSize: 18.0,
              color: colorBlack,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildReviewText() {
    const item = 4;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Review',
            style: titleTextStyle.copyWith(
              fontSize: 18.0,
              color: colorBlack,
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            itemCount: item > 3 ? 3 : item,
            itemBuilder: (context, index) {
              if (index > 1) {
                return TextButton(
                  onPressed: () {},
                  child: Text(
                    'Lihat Lainnya',
                    style: titleTextStyle.copyWith(
                      fontSize: 14.0,
                      color: Colors.blue,
                    ),
                  ),
                );
              } else {
                return ListTile(
                  leading: CircleAvatar(
                    child: Text(index.toString()),
                  ),
                  title: Text(
                    'Review',
                    style: titleTextStyle.copyWith(
                      fontSize: 16.0,
                      color: colorBlack,
                    ),
                  ),
                  subtitle: Text(
                    'Bagus banget nih, rekomended! yang penting dijaga kepercayaan konsumen biar terus jadi langganan',
                    style: subtitleTextStyle.copyWith(
                      fontSize: 14,
                      color: colorBlack,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
