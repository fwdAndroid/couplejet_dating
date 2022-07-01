import 'package:couple_jet/ui/screens/chat_screen/widgets/chat_app_bar.dart';
import 'package:couple_jet/ui/screens/chat_screen/widgets/chat_list_view.dart';
import 'package:flutter/material.dart';

import 'widgets/comment_input_container.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {

  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final double widthScale = MediaQuery.of(context).size.width / 414;
    final double heightScale = MediaQuery.of(context).size.height / 896;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ChatAppBar(
            title: 'Elisa, 20',
            subTitle: 'from Essme,DE',
            onBackPress: (){Navigator.pop(context);},
            profileImg: 'images/dummy_profile3.png',
            leftMsg: '17 messages left',
            onAddPress: (){},
            onMorePress: (){},
          ),
          Expanded(
            child: ChatListView(),
          ),
        ],
      ),
    );
  }
}
