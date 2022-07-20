import 'package:flutter/material.dart';
import 'package:kantoor_app/utils/theme.dart';

class HistoryChat extends StatefulWidget {
  const HistoryChat({Key? key}) : super(key: key);

  @override
  State<HistoryChat> createState() => HistoryChatState();
}

class HistoryChatState extends State<HistoryChat> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: const Icon(
              Icons.arrow_back,
              color: colorBlack,
            ),
          ),
          title: Text(
            "History Chat",
            style: titleTextStyle.copyWith(fontSize: 18),
          ),
          backgroundColor: colorWhite,
          centerTitle: true,
          elevation: 0.0,
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: _buildGedungCard(),
        ),
      ),
    );
  }

  Widget _buildGedungCard() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(2),
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(40)),
                border: Border.all(
                  //memberikan border di sekeliling circle
                  width: 2,
                  color: Theme.of(context).primaryColor,
                ),
                //shape: BoxShape.circle, //digunakan untuk menentukan bentuk bayangan, jika tidak ada, maka bentuknya kotak
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                  )
                ]),
            child: const CircleAvatar(
              radius: 38,
              backgroundImage: AssetImage("assets/images/bg_detail.png"),
            ),
          ),
          Container(
            height: 100,
            width: MediaQuery.of(context).size.width - 125,
            padding: const EdgeInsets.only(
              left: 20,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Office Meeting Room Montana Building lt 7',
                  style: titleTextStyle.copyWith(
                    fontSize: 12,
                    color: colorBlack,
                  ),
                  overflow: TextOverflow
                      .ellipsis, //digunakan apabila pesan terlalu panjang
                  maxLines: 2,
                ),
                Text(
                  "Kota Surabaya",
                  style: subtitleTextStyle.copyWith(
                    fontSize: 12,
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                  ),
                  overflow: TextOverflow
                      .ellipsis, //digunakan apabila pesan terlalu panjang
                  maxLines: 2, //maksimal baris pesan adalah 2 baris
                ),
                const SizedBox(
                  height: 3,
                ),
                Text(
                  "Saya sudah booking ruangnya di tanggal 12 Agustus, terkait fasilitas yang diperlukan membutuhkan : proyektor, lcd, dll",
                  style: subtitleTextStyle.copyWith(
                    fontSize: 10,
                  ),
                  overflow: TextOverflow
                      .ellipsis, //digunakan apabila pesan terlalu panjang
                  maxLines: 2, //maksimal baris pesan adalah 2 baris
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
