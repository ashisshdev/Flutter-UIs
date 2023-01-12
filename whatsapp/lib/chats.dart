import 'package:flutter/material.dart';
import 'package:whatsapp/archived.dart';

class ChatsList extends StatelessWidget {
  const ChatsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding:
          const EdgeInsets.only(top: 0, bottom: 5),
      physics: const BouncingScrollPhysics(),
      children: [
        InkWell(
          onTap: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) {
              return const Archived();
            }));
          },
          child: Padding(
            padding: const EdgeInsets.only(
                top: 15, bottom: 10),
            child: Row(
              crossAxisAlignment:
                  CrossAxisAlignment.center,
              children: const [
                SizedBox(
                  width: 25,
                ),
                Icon(
                  Icons.archive_outlined,
                  color: Color(0XFF075E54),
                ),
                SizedBox(
                  width: 20,
                ),
                Text(
                  "Archived",
                  textScaleFactor: 1.3,
                ),
                Spacer(),
                Text(
                  "2   ",
                  style: TextStyle(
                      color: Color(0XFF075E54)),
                )
              ],
            ),
          ),
        ),
        ListView.builder(
            padding: const EdgeInsets.only(top: 0),
            physics:
                const NeverScrollableScrollPhysics(),
            itemCount: dummyChats.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return ListTile(
                leading: CircleAvatar(
                  backgroundImage: AssetImage(
                      dummyChats[index].imagePath),
                ),
                title: Row(children: [
                  Text(dummyChats[index].name),
                  const Spacer(),
                  Text(
                    dummyChats[index].lastMessageTime,
                    textScaleFactor: 0.85,
                  )
                ]),
                subtitle: Row(
                  children: [
                    const Icon(
                      Icons.done_all,
                      size: 16,
                    ),
                    Flexible(
                        child: Text(
                      "  ${dummyChats[index].lastMessage}",
                      overflow: TextOverflow.ellipsis,
                    ))
                  ],
                ),
              );
            }),
        Container(
          padding: const EdgeInsets.only(
              bottom: 80, top: 15),
          alignment: Alignment.center,
          child: Text(
              "Tap and hold on a chat for more options",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color:
                      Colors.black.withOpacity(0.6)),
              textScaleFactor: 0.8),
        ),
      ],
    );
  }
}

// generating a list of Dummy Chat Models
List<ChatModel> dummyChats =
    List<ChatModel>.generate(15, (i) {
  return ChatModel(
      names[i],
      "assets/people/${i + 1}.jfif",
      "some Last Message",
      "12:45 PM");
});

List names = [
  "Sam",
  "John",
  "Christine",
  "Lily",
  "Charlie",
  "Jhonny",
  "Thomas",
  "Samuel",
  "Harry",
  "Strange",
  "Tony",
  "Steve",
  "Natasha",
  "Edward",
  "Karl"
];

class ChatModel {
  late String name;
  late String imagePath;
  late String lastMessage;
  late String lastMessageTime;

  ChatModel(this.name, this.imagePath,
      this.lastMessage, this.lastMessageTime);
}
