import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  final String nome;
  const ChatScreen({super.key, required this.nome});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {

  final TextEditingController controller = TextEditingController();
  final List<Map<String, dynamic>> mensagens = [];

  void enviarMensagem() {
    if (controller.text.trim().isEmpty) return;

    setState(() {
      mensagens.add({
        "texto": controller.text,
        "isMe": true,
      });
    });

    controller.clear();

    // resposta fake automática (simula outro jogador)
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        mensagens.add({
          "texto": "Boa jogada! 🔥",
          "isMe": false,
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0D0D0D),

      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text("Chat Gamer"),
      ),

      body: Column(
        children: [

          // LISTA DE MENSAGENS
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(10),
              itemCount: mensagens.length,
              itemBuilder: (context, index) {
                final msg = mensagens[index];

                return Align(
                  alignment: msg["isMe"]
                      ? Alignment.centerRight
                      : Alignment.centerLeft,

                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 5),
                    padding: const EdgeInsets.all(12),
                    constraints: const BoxConstraints(maxWidth: 250),

                    decoration: BoxDecoration(
                      color: msg["isMe"]
                          ? Colors.purpleAccent
                          : Colors.grey[800],
                      borderRadius: BorderRadius.circular(12),
                    ),

                    child: Text(
                      msg["texto"],
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                );
              },
            ),
          ),

          // INPUT
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            color: Colors.black,

            child: Row(
              children: [

                Expanded(
                  child: TextField(
                    controller: controller,
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      hintText: "Digite uma mensagem...",
                      hintStyle: const TextStyle(color: Colors.grey),
                      filled: true,
                      fillColor: Colors.grey[900],
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),

                const SizedBox(width: 10),

                GestureDetector(
                  onTap: enviarMensagem,
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    decoration: const BoxDecoration(
                      color: Colors.purple,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.send, color: Colors.white),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}