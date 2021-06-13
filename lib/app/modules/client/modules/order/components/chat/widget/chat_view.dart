import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:marketplace_store_web/app/components/divider/line_view_widget.dart';
import 'package:marketplace_store_web/app/models/current_user.dart';
import 'package:marketplace_store_web/app/modules/client/modules/order/components/chat/bloc/chat_attendance_bloc.dart';
import 'package:marketplace_store_web/app/modules/client/modules/order/components/chat/model/conversation.dart';
import 'package:marketplace_store_web/app/utils/date_utils.dart';
import 'package:flutter/material.dart';
import 'package:marketplace_store_web/app/utils/theme/app_theme_utils.dart';

import 'chat_ballon.dart';

class ChatView extends StatefulWidget {
  final CurrentUser currentUser;

  ChatView(this.currentUser);

  @override
  _ChatViewState createState() => _ChatViewState();
}

class _ChatViewState extends State<ChatView> {
  final controler = TextEditingController();
  final chatAttendanceBloc = Modular.get<ChatAttendanceBloc>();

  bool onScrollBottom = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (mounted) {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[

          Expanded(
              child: Container(
                  color: Colors.white,
                  child: StreamBuilder<List<Conversation>>(
                      stream: chatAttendanceBloc.conversation,
                      initialData: [],
                      builder: (context, snapshot) => GroupedListView(
                            elements: (snapshot.data ?? []),
                            groupBy: (element) =>
                                MyDateUtils.convertStringToDateTime(
                                    element.sendAt,
                                    format: "dd/MM/yyyy HH") ??
                                "",
                            controller: chatAttendanceBloc.scrollController,
                            padding: EdgeInsets.only(bottom: 10),
                            groupSeparatorBuilder: _buildGroupSeparator,
                            itemBuilder: (context, element) =>
                                BubbleClient(conversation: element),
                            order: GroupedListOrder.ASC,
                          )))),
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(color: Colors.white, boxShadow: [
              BoxShadow(
                color: Colors.grey[300],
                offset: Offset(-2, 0),
                blurRadius: 5,
              ),
            ]),
            child: Row(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(left: 15),
                ),
                Expanded(
                  child: TextFormField(
                    focusNode: chatAttendanceBloc.focusNode,
                    keyboardType: TextInputType.text,
                    controller: controler,
                    onFieldSubmitted: (value) {
                      if (controler.text.length > 0) {
                        chatAttendanceBloc.sendMessage(context, controler.text);
                        controler.clear();
                      }
                    },
                    decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                      hintText: 'Digite a mensagem',
                      border: InputBorder.none,
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    if (controler.text.length > 0) {
                      chatAttendanceBloc.sendMessage(context, controler.text);
                      controler.clear();
                    }
                  },
                  icon: Icon(
                    Icons.send,
                    color: AppThemeUtils.colorPrimary,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildGroupSeparator(dynamic groupByValue) {
    return Container(
        margin: EdgeInsets.all(15),
        child: Text("",
          textAlign: TextAlign.center,
          maxLines: 1,
          style: AppThemeUtils.normalBoldSize(fontSize: 12),
        ));
  }
}
