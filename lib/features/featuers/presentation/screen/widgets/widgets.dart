import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/utils/AssetsClass.dart';
import '../../Cubits/Controller_Bloc_Methods/Controller_Bloc.dart';
import '../../Cubits/MyCubit/my_cubit_cubit.dart';

BlocConsumer<MyCubitCubit, MyCubitState> Bodyofscreen() {
  return BlocConsumer<MyCubitCubit, MyCubitState>(
    listener: (context, state) {
      // TODO: implement listener
    },
    builder: (context, state) {
      return Stack(
        children: [
          Background_logo(),
          ExpndedChat(context),
        ],
      );
    },
  );
}

DashChat ExpndedChat(BuildContext context) {
  return DashChat(
      messageOptions: MessageOptions(
          avatarBuilder: (p0, onPressAvatar, onLongPressAvatar) {
            return Padding(
              padding: const EdgeInsets.all(5),
              child: CircleAvatar(
                backgroundColor: Colors.black,
                radius: 15,
                backgroundImage: AssetImage("${Asset.LogoImage}"),
              ),
            );
          },
          currentUserTextColor: Colors.white.withOpacity(0.8),
          currentUserContainerColor: Colors.black.withOpacity(0.3),
          containerColor: Colors.black.withOpacity(0.8),
          textColor: Colors.white.withOpacity(0.7)),
      inputOptions: InputOptions(inputDecoration: TextFeild()),
      typingUsers: myController(context).typing,
      currentUser: myController(context).users[0],
      onSend: (ChatMessage message) {
        myController(context)
            .PostmsgeToAiAndGetResponeWithInsrtToMAsgesList(message);
      },
      messages: myController(context).MAsegs);
}

InputDecoration TextFeild() {
  return InputDecoration(
      enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey.withOpacity(0.3)),
          borderRadius: BorderRadius.circular(18)),
      focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey.withOpacity(0.8)),
          borderRadius: BorderRadius.circular(18)),
      hintText: "  Enter Massege .....",
      hintStyle: TextStyle(fontSize: 14, color: Colors.white.withOpacity(0.5)));
}

AppBar Appbar() {
  return AppBar(
    backgroundColor: Colors.transparent,
    elevation: 0,
    centerTitle: true,
    leading: Icon(Icons.sort_rounded),
    title: Container(
      padding: EdgeInsets.only(top: 7),
      width: 120,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircleAvatar(
              radius: 21,
              backgroundColor: Colors.transparent,
              backgroundImage: AssetImage("${Asset.LogoImage}")),
          Text("ChatGPT"),
        ],
      ),
    ),
  );
}

class Background_logo extends StatelessWidget {
  const Background_logo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: myController(context).MAsegs.isEmpty ? 0.2 : 0.05,
      child: Padding(
        padding: const EdgeInsets.all(110),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("${Asset.LogoImage}"),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Open Ai Bot",
                  style: TextStyle(fontSize: 25),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
