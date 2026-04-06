import 'package:flutter/material.dart';
import '../models/message_model.dart';

class ChatScreen extends StatefulWidget {
  final String nome;

  const ChatScreen({super.key, required this.nome});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController controller = TextEditingController();

  List<Message> mensagens = [
    Message(
      texto: "Salve! Bora jogar hoje?",
      isMe: false,
      horario: DateTime.now(),
    ),
    Message(
      texto: "Bora sim 🔥",
      isMe: true,
      horario: DateTime.now(),
    ),
  ];

  void enviarMensagem() {
    if (controller.text.isEmpty) return;

    setState(() {
      mensagens.add(
        Message(
          texto: controller.text,
          isMe: true,
          horario: DateTime.now(),
        ),
      );
    });

    controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0D0D0D),
      appBar: AppBar(
        title: Text(widget.nome),
        backgroundColor: Colors.black,
      ),
      body: Column(
        children: [
          // LISTA DE MENSAGENS
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: mensagens.length,
              itemBuilder: (context, index) {
                final msg = mensagens[index];

                return Align(
                  alignment: msg.isMe
                      ? Alignment.centerRight
                      : Alignment.centerLeft,
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 4),
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: msg.isMe
                          ? Colors.purple
                          : Colors.grey[800],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(msg.texto),
                  ),
                );
              },
            ),
          ),

          // INPUT
          Container(
            padding: const EdgeInsets.all(10),
            color: Colors.black,
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: controller,
                    style: const TextStyle(color: Colors.white),
                    decoration: const InputDecoration(
                      hintText: "Digite uma mensagem...",
                      hintStyle: TextStyle(color: Colors.grey),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send, color: Colors.purple),
                  onPressed: enviarMensagem,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}