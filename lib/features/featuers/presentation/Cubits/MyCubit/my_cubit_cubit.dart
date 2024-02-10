import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import '../../../../../../core/Api_helper/api.dart';
import '../../../../../core/utils/Constants.dart';
part 'my_cubit_state.dart';

class MyCubitCubit extends Cubit<MyCubitState> {
  MyCubitCubit() : super(MyCubitInitial());

  static MyCubitCubit get(context) => BlocProvider.of(context);
  bool isloadiog = false;
  List<ChatUser> users = [
    ChatUser(id: "1", firstName: "User"),
    ChatUser(id: "2", firstName: "Bot Ai"),
  ];
  List<ChatMessage> MAsegs = [];
  List<ChatUser> typing = [];

  PostmsgeToAiAndGetResponeWithInsrtToMAsgesList(ChatMessage Message) async {
    if (Message != "") {
      ChatMessage msg = ChatMessage(
        text: Message.text,
        createdAt: DateTime.now(),
        user: users[0],
      );
      MAsegs.insert(0, msg);
      print(MAsegs.length);
      emit(insertedState());

      var IaMestog = await AiReponsMasge(Message);
      ChatMessage Aimsg = ChatMessage(
        user: users[1],
        createdAt: DateTime.now(),
        text: IaMestog["candidates"][0]["content"]["parts"][0]["text"],
      );
      typing.remove(users[1]);
      MAsegs.insert(0, Aimsg);
      print(MAsegs.length);
      emit(insertedState());
    }
    // String msg = await ApiHelper().post(url: url, body: body, token: token);
  }

  Future<dynamic> AiReponsMasge(ChatMessage aiMessage) async {
    typing.insert(0, users[1]);
    emit(Loading());
    var data = await ApiHelper().post(
      url: "${Consts.endPoint}",
      body: jsonEncode({
        "contents": [
          {
            "role": "user",
            "parts": [
              {"text": "${aiMessage.text}"}
            ]
          }
        ]
      }),
    );
    print(data.toString());
    return data;
  }
}
