import 'package:flutter/material.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'package:kantoor_app/models/gedung.dart';
import 'package:kantoor_app/models/message.dart';
import 'package:kantoor_app/utils/theme.dart';
import 'package:kantoor_app/viewModels/livechat_provider.dart';
import 'package:provider/provider.dart';

class LiveChatScreen extends StatefulWidget {
  final Data gedung;
  const LiveChatScreen({
    Key? key,
    required this.gedung,
  }) : super(key: key);

  @override
  State<LiveChatScreen> createState() => _LiveChatScreenState();
}

class _LiveChatScreenState extends State<LiveChatScreen> {
  final _chatController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _chatController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final livechatApi = Provider.of<LivechatProvider>(context, listen: false).getAllMessages();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        automaticallyImplyLeading: false,
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: colorBlack,
          ),
        ),
        title: Text(
          'Live Chat',
          style: titleTextStyle.copyWith(fontSize: 20.0),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(12.0, 12.0, 12.0, 80.0),
        child: Column(
          children: [
            _buildGedungCard(),
            _buildMessageList(livechatApi),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterFloat,
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(
            width: 12.0,
          ),
          Expanded(
            child: TextField(
              maxLines: 4,
              minLines: 1,
              controller: _chatController,
              decoration: InputDecoration(
                hintText: 'Ketik pesan',
                hintStyle: subtitleTextStyle.copyWith(fontSize: 15),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: const BorderSide(
                    width: 1,
                    color: primaryColor500,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: const BorderSide(
                    width: 1,
                    color: primaryColor500,
                  ),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: const BorderSide(
                    width: 1,
                    color: primaryColor500,
                  ),
                ),
                fillColor: colorWhite,
                filled: true,
              ),
              cursorColor: Colors.green[300],
              keyboardType: TextInputType.multiline,
            ),
          ),
          const SizedBox(
            width: 12.0,
          ),
          // Container(
          //   width: MediaQuery.of(context).size.width * 0.7,
          //   alignment: Alignment.centerLeft,
          //   decoration: BoxDecoration(
          //     color: colorWhite,
          //     border: Border.all(color: primaryColor500),
          //     borderRadius: BorderRadius.circular(30.0),
          //   ),
          //   child: TextFormField(
          //     cursorColor: Colors.black,
          //     keyboardType: TextInputType.multiline,
          //     maxLines: 3,
          //     minLines: 1,
          //     decoration: const InputDecoration(
          //       border: InputBorder.none,
          //       focusedBorder: InputBorder.none,
          //       enabledBorder: InputBorder.none,
          //       errorBorder: InputBorder.none,
          //       disabledBorder: InputBorder.none,
          //       hintText: "Ketikkan Pesan",
          //     ),
          //     style: subtitleTextStyle,
          //   ),
          // ),
          Container(
            decoration: const BoxDecoration(
              color: primaryColor500,
              shape: BoxShape.circle,
            ),
            child: IconButton(
              onPressed: () {
                _chatController.clear();
              },
              icon: const Icon(
                Icons.send,
                color: colorWhite,
              ),
            ),
          ),
          const SizedBox(
            width: 12.0,
          ),
        ],
      ),
    );
  }

  Widget _buildGedungCard() {
    return Card(
      elevation: 3.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25.0),
        side: BorderSide(color: colorBlack.withOpacity(0.2)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 110,
              width: 110,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                image: const DecorationImage(
                  image: AssetImage('assets/images/bg_detail.png'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            const SizedBox(
              width: 12.0,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
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
                        starSize: 15,
                        maxValue: 5,
                        starSpacing: 2,
                        animationDuration: const Duration(milliseconds: 1000),
                        valueLabelPadding: const EdgeInsets.symmetric(vertical: 1, horizontal: 8),
                        valueLabelMargin: const EdgeInsets.only(right: 8),
                        starOffColor: const Color(0xffe7e8ea),
                        starColor: Colors.yellow,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 12.0, top: 12.0),
                        child: Text(
                          '(3.5/5)',
                          style: subtitleTextStyle.copyWith(
                            color: colorBlack,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Text(
                    widget.gedung.name!,
                    style: titleTextStyle.copyWith(
                      fontSize: 16,
                      color: colorBlack,
                    ),
                    overflow: TextOverflow.clip,
                    maxLines: 2,
                  ),
                  Text(
                    'Rp. ${widget.gedung.price}',
                    style: titleTextStyle.copyWith(
                      fontSize: 20.0,
                      color: primaryColor500,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  _buildMessageList(Stream<List<Messages>> livechatApi) {
    return StreamBuilder<List<Messages>>(
      stream: livechatApi,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const AlertDialog(
            title: Text('Connection Timed Out'),
          );
        }
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return const Expanded(
                child: Center(
              child: CircularProgressIndicator(),
            ));
          case ConnectionState.active:
            return Expanded(
              child: ListView.builder(
                reverse: true,
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  final data = snapshot.data!.reversed.toList();

                  if (data[index].body == '') {
                    return const SizedBox();
                  }

                  if (data[index].userName == 'Admin' || data[index].userName == 'admin') {
                    return Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Container(
                          constraints: const BoxConstraints(maxWidth: 250),
                          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 6.0),
                          decoration: BoxDecoration(
                            color: primaryColor100,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                data[index].body,
                                style: subtitleTextStyle.copyWith(fontSize: 14),
                              ),
                              Text(
                                data[index].timestamp,
                                style: subtitleTextStyle,
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  } else {
                    return Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Container(
                          constraints: const BoxConstraints(maxWidth: 250),
                          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 6.0),
                          decoration: BoxDecoration(
                            color: primaryColor500,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                data[index].body,
                                style: subtitleTextStyle.copyWith(fontSize: 15),
                              ),
                              Text(
                                data[index].timestamp,
                                style: subtitleTextStyle.copyWith(fontSize: 10),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }
                },
              ),
            );
          default:
            return const SizedBox();
        }
      },
    );
  }
}
