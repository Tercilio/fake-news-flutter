import 'package:basearch/src/features/theme/theme_config.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

// ignore: use_key_in_widget_constructors
class ChatbotPage extends StatelessWidget {
  final messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    bool isDark = Provider.of<ThemeChanger>(context, listen: false).isDark;

    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          title: const Text("FakeBot"),
          backgroundColor: isDark
              ? ThemeData.dark().backgroundColor
              : const Color.fromARGB(255, 135, 151, 178),
          iconTheme: const IconThemeData(color: Colors.black),
        ),
        body: Container(
            child: Column(
          children: [
            Center(
              child: Container(
                padding: const EdgeInsets.only(top: 15, bottom: 10),
                child: Text(
                  "Today, ${DateFormat("Hm").format(DateTime.now())}",
                  style: const TextStyle(fontSize: 20),
                ),
              ),
            ),
            Flexible(
              child: ListView.builder(
                reverse: true,
                itemCount: 0,
                itemBuilder: (context, index) {
                  return build(context);
                },
              ),
            ),
            const Divider(
              height: 5,
              color: Colors.greenAccent,
            ),
            Container(
              child: ListTile(
                leading: IconButton(
                  icon: const Icon(
                    Icons.camera_alt,
                    color: Color.fromARGB(255, 5, 5, 5),
                    size: 35,
                  ),
                  onPressed: () {},
                ),
                title: Container(
                  height: 35,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      color: Color.fromRGBO(220, 220, 220, 1)),
                  padding: const EdgeInsets.only(left: 15),
                  child: TextFormField(
                    controller: messageController,
                    decoration: const InputDecoration(
                      hintText: "Escreva sua mensagem",
                      hintStyle: TextStyle(color: Colors.black26),
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                    ),
                    style: const TextStyle(fontSize: 16, color: Colors.black),
                  ),
                ),
                trailing: IconButton(
                  icon: const Icon(
                    Icons.send,
                    size: 30,
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                  onPressed: () {
                    if (messageController.text.isEmpty) {
                      // ignore: avoid_print
                      print("Mensagem vazia!");
                    } else {
                      setState(() {});
                    }
                  },
                ),
              ),
            ),
          ],
        )));
  }

  void setState(Null Function() param0) {}
}
