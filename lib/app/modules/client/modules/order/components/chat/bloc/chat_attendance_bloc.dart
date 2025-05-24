import 'dart:async';

import 'package:new_marketplace_web/app/models/current_user.dart';
import 'package:new_marketplace_web/app/modules/client/modules/order/components/chat/model/conversation.dart';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:rxdart/rxdart.dart';

extension ListExtension<T> on List<T> {
  bool _containsElement(T e) {
    for (T element in this) {
      if (element.toString().compareTo(e.toString()) == 0) return true;
    }
    return false;
  }

  List<T> removeDuplicates() {
    List<T> tempList = [];

    this.forEach((element) {
      if (!tempList._containsElement(element)) tempList.add(element);
    });

    return tempList;
  }
}

class ChatAttendanceBloc extends Disposable {
  var conversation = BehaviorSubject<List<Conversation>>.seeded(
      [Conversation(sender: CurrentUser(), isMe: false, body: "oi")
        ,Conversation(sender: CurrentUser(), isMe: true, body: "Olá")]);
  var countQtdNotRead = BehaviorSubject<int>();

  ScrollController scrollController =
      new ScrollController(initialScrollOffset: 0);
  var focusNode = new FocusNode();
  Timer? timer;

  clearChat() {}

  void sendMessage(BuildContext context, String text) async {}

  void scrollToBottom(BuildContext context) {
    if (scrollController.hasClients) {
      Future.delayed(Duration(milliseconds: 600), () {
        final bottomOffset = scrollController.position.maxScrollExtent;
        scrollController.animateTo(
          bottomOffset,
          duration: Duration(milliseconds: 600),
          curve: Curves.easeInOut,
        );
      });
    }
  }

  //dispose will be called automatically by closing its streams
  @override
  void dispose() {
    timer?.cancel();
    countQtdNotRead.drain();
    conversation.drain();
  }

  Future<void> reSend(BuildContext context, Conversation resent) async {}
}
