import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'Cubits/MyCubit/my_cubit_cubit.dart';
import 'package:dash_chat_2/dash_chat_2.dart';

class chatscreen extends StatelessWidget {
  chatscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 25,
        leading: Icon(Icons.chat),
        title: Text("ChatGPT"),
      ),
      body: BlocConsumer<MyCubitCubit, MyCubitState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return DashChat(
              typingUsers: MyCubitCubit.get(context).typing,
              currentUser: MyCubitCubit.get(context).users[0],
              onSend: (ChatMessage message) {
                MyCubitCubit.get(context).Postmsge(message);
              },
              messages: MyCubitCubit.get(context).MAsegs);

          // Padding(
          //   padding: const EdgeInsets.all(8.0),
          //   child: Container(
          //     padding: EdgeInsets.all(15),
          //     width: double.minPositive,
          //     decoration: BoxDecoration(color: Colors.blue),
          //     child: Text(
          //       MyCubitCubit.get(context).MAsegs.isEmpty
          //           ? ""
          //           : "${MyCubitCubit.get(context).MAsegs[index].textMSg}",
          //       textAlign: TextAlign.center,
          //     ),
          //   ),
          // ),
        },
      ),
    );
  }
}
