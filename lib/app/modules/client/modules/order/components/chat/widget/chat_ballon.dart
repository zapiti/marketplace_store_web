import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marketplace_store_web/app/modules/client/modules/order/components/chat/bloc/chat_attendance_bloc.dart';
import 'package:marketplace_store_web/app/modules/client/modules/order/components/chat/model/conversation.dart';
import 'package:marketplace_store_web/app/utils/date_utils.dart';
import 'package:marketplace_store_web/app/utils/theme/app_theme_utils.dart';

String removeAllHtmlTags(String htmlText) {
  RegExp exp = RegExp(r"<[^>]*>", multiLine: true, caseSensitive: true);

  return htmlText.replaceAll(exp, '');
}

class BubbleClient extends StatelessWidget {
  final conversationBloc = Modular.get<ChatAttendanceBloc>();
  final Conversation conversation;

  BubbleClient({
    this.conversation,
  });

  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5, vertical: 3),
      padding: conversation.isMe
          ? EdgeInsets.only(left: 80)
          : EdgeInsets.only(right: 80),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Column(
            mainAxisAlignment: conversation.isMe
                ? MainAxisAlignment.end
                : MainAxisAlignment.start,
            crossAxisAlignment: conversation.isMe
                ? CrossAxisAlignment.end
                : CrossAxisAlignment.start,
            children: <Widget>[
              // Padding(
              //     padding: EdgeInsets.symmetric(horizontal: 10),
              //     child: Align(
              //       child: Text(
              //         conversation.sender?.name ?? "--",
              //         textAlign:
              //         conversation.isMe ? TextAlign.end : TextAlign.start,
              //         style: TextStyle(fontSize: 12),
              //       ),
              //       alignment: conversation.isMe
              //           ? Alignment.centerRight
              //           : Alignment.centerLeft,
              //     )),
              Container(
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  gradient: conversation.isMe
                      ? LinearGradient(
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,
                          stops: [
                              0.1,
                              1
                            ],
                          colors: [
                              AppThemeUtils.colorPrimaryDark,
                              AppThemeUtils.colorPrimary,
                            ])
                      : LinearGradient(
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,
                          stops: [
                              0.1,
                              1
                            ],
                          colors: [
                              Color(0xFFEBF5FC),
                              Color(0xFFEBF5FC),
                            ]),
                  borderRadius: conversation.isMe
                      ? BorderRadius.only(
                          topRight: Radius.circular(15),
                          topLeft: Radius.circular(15),
                          bottomRight: Radius.circular(0),
                          bottomLeft: Radius.circular(15),
                        )
                      : BorderRadius.only(
                          topRight: Radius.circular(15),
                          topLeft: Radius.circular(15),
                          bottomRight: Radius.circular(15),
                          bottomLeft: Radius.circular(0),
                        ),
                ),
                child: Column(
                  crossAxisAlignment: conversation.isMe
                      ? CrossAxisAlignment.end
                      : CrossAxisAlignment.start,
                  children: <Widget>[
                    RichText(
                        text: TextSpan(
                      text: "",
                      style: AppThemeUtils.normalSize(
                          color: Theme.of(context).textTheme.bodyText2.color,
                          fontSize: MediaQuery.of(context).size.height < 600
                              ? 16
                              : 18),
                      children: [
                        TextSpan(
                            text: conversation.body,
                            style: AppThemeUtils.normalSize(
                                color: conversation.isMe
                                    ? AppThemeUtils.whiteColor
                                    : AppThemeUtils.colorPrimary,
                                fontSize: 16)),
                        TextSpan(
                            text: "  " +
                                (conversation.sendAt == null
                                    ? ""
                                    : MyDateUtils.parseDateTimeFormat(
                                        MyDateUtils.convertStringToDateTime(
                                            conversation.sendAt,
                                            format: "dd/MM/yyyy HH:mm"),
                                        format: "HH:mm")),
                            style: AppThemeUtils.normalSize(
                                color: conversation.isMe
                                    ? AppThemeUtils.whiteColor
                                    : AppThemeUtils.black,
                                fontSize: 8)),
                        // WidgetSpan(
                        //   child:     Icon(
                        //     (conversation.readAt ?? "").isNotEmpty
                        //         ? Icons.done_all
                        //         : Icons.access_time,
                        //     size: 12,
                        //     color: (conversation.readAt ?? "").isNotEmpty
                        //         ?  AppThemeUtils.whiteColor
                        //         : AppThemeUtils.darkGrey,
                        //   ),
                        // ),
                      ],
                    ))
                    // Container(
                    //   child: Text(
                    //     conversation.body,
                    //     style: AppThemeUtils.normalSize(
                    //         color: conversation.isMe
                    //             ? AppThemeUtils.whiteColor
                    //             : AppThemeUtils.colorPrimary,decoration:  conversation.sendAt == null ? TextDecoration.lineThrough : TextDecoration.none),
                    //   ),
                    // ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
