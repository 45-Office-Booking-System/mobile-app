import 'package:flutter/cupertino.dart';
import 'package:kantoor_app/models/message.dart';
import 'package:kantoor_app/services/livechat_api.dart';

enum LivechatState { none, loading, error }

class LivechatProvider extends ChangeNotifier {
  final LivechatApi livechatApi = LivechatApi();

  LivechatState _liveState = LivechatState.none;
  LivechatState get liveState => _liveState;

  changeState(LivechatState state) {
    _liveState = state;
    notifyListeners();
  }

  Stream<List<Messages>> getAllMessages() =>
      Stream.periodic(const Duration(seconds: 1)).asyncMap((_) => livechatApi.getAllMessages());

  // Future<void> getAllMessages() async {
  //   try {
  //     changeState(LivechatState.loading);
  //     _messages = await livechatApi.getAllMessages();
  //     changeState(LivechatState.none);
  //   } catch (e) {
  //     if (e is DioError) {
  //       debugPrint('bossss ${e.response!.statusCode.toString()}');
  //     }
  //     changeState(LivechatState.error);
  //     debugPrint('bossss ${e.toString()}');
  //   }
  // }

}
