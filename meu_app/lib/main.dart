// =========================
// MAIN.DART (ATUALIZADO)
// =========================

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'screens/login_screen.dart';
import 'screens/chat_screen.dart';

void main() {
  runApp(const GameLinkApp());
}

class GameLinkApp extends StatelessWidget {
  const GameLinkApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'GameLink',
      theme: ThemeData.dark(),
      home: const SplashScreen(),
    );
  }
}

// =========================
// SPLASH SCREEN
// =========================

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    verificarLogin();
  }

  void verificarLogin() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString("token");

    await Future.delayed(const Duration(seconds: 2));

    if (token != null) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const MainScreen()),
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const LoginScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text("GameLink")),
    );
  }
}


// =========================
// NAVEGAÇÃO PRINCIPAL
// =========================

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int paginaAtual = 0;

  final List<Widget> paginas = [
    const HomeScreen(),
    const RankingScreen(),
    const AmigosScreen(),
    const LojaScreen(),
    const PerfilScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: paginas[paginaAtual],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: paginaAtual,
        onTap: (index) {
          setState(() {
            paginaAtual = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.black,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.emoji_events), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.people), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.store), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: ""),
        ],
      ),
    );
  }
}

// =========================
// HOME (TELA PRINCIPAL BONITA)
// =========================

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xFF0D0D0D),
            Color(0xFF1A1A2E),
            Color(0xFF2A0F1F),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            const Center(
              child: Text(
                "MENU",
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
              ),
            ),

            const SizedBox(height: 20),

            // =========================
            // JOGOS RECENTES
            // =========================
            const SectionTitle("JOGOS RECENTES"),

            SizedBox(
              height: 140,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 3,
                itemBuilder: (context, index) {
                  return GameCard();
                },
              ),
            ),

            const SizedBox(height: 20),

            // =========================
            // PROGRESSO
            // =========================
            const SectionTitle("PROGRESSO DIÁRIO"),

            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.4),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.blueAccent),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("PROGRESSO DIÁRIO"),
                  const SizedBox(height: 10),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: LinearProgressIndicator(
                      value: 0.51,
                      minHeight: 10,
                      backgroundColor: Colors.grey,
                      valueColor: AlwaysStoppedAnimation(Colors.purpleAccent),
                    ),
                  ),
                  const SizedBox(height: 5),
                  const Text("51%"),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // =========================
            // ATIVIDADES
            // =========================
            const SectionTitle("ATIVIDADES RECENTES"),

            Column(
              children: const [
                ActivityItem("Jogou Assassin’s Creed", "Há 5 horas"),
                ActivityItem("Subiu de ranking no CS2", "Há 1 dia"),
                ActivityItem("Adicionou novo amigo", "Há 2 dias"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// =========================
// COMPONENTES REUTILIZÁVEIS
// =========================

class SectionTitle extends StatelessWidget {
  final String texto;

  const SectionTitle(this.texto, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          texto,
          style: const TextStyle(
            color: Colors.redAccent,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class GameCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      margin: const EdgeInsets.only(right: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.grey[900],
        boxShadow: [
          BoxShadow(
            color: Colors.purple.withOpacity(0.5),
            blurRadius: 10,
          )
        ],
      ),
      child: const Center(
        child: Icon(Icons.videogame_asset, size: 40),
      ),
    );
  }
}

class ActivityItem extends StatelessWidget {
  final String titulo;
  final String tempo;

  const ActivityItem(this.titulo, this.tempo, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.4),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          const Icon(Icons.circle, size: 12),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(titulo),
                Text(
                  tempo,
                  style: const TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

// =========================
// RANKING
// =========================

class RankingScreen extends StatelessWidget {
  const RankingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBackground(
      child: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Center(
            child: Text("RANKING", style: TextStyle(fontSize: 24)),
          ),
          const SizedBox(height: 20),

          ...List.generate(10, (index) {
            return Container(
              margin: const EdgeInsets.only(bottom: 12),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.4),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.purpleAccent),
              ),
              child: Row(
                children: [
                  Text("#${index + 1}",
                      style: const TextStyle(color: Colors.white)),
                  const SizedBox(width: 10),
                  const CircleAvatar(
                    backgroundColor: Colors.purple,
                    child: Icon(Icons.person),
                  ),
                  const SizedBox(width: 10),
                  const Expanded(
                    child: Text("Player Gamer"),
                  ),
                  const Text("2500 pts",
                      style: TextStyle(color: Colors.pinkAccent))
                ],
              ),
            );
          })
        ],
      ),
    );
  }
}

// =========================
// AMIGOS
// =========================

class AmigosScreen extends StatelessWidget {
  const AmigosScreen({super.key});

  

  @override
  Widget build(BuildContext context) {
    return AppBackground(
      child: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Center(child: Text("AMIGOS", style: TextStyle(fontSize: 24))),
          const SizedBox(height: 20),

          ...List.generate(8, (index) {
  return GestureDetector(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => ChatScreen(nome: "Amigo Gamer"),
        ),
      );
    },
    child: Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.4),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          const CircleAvatar(
            backgroundColor: Colors.blue,
            child: Icon(Icons.person),
          ),
          const SizedBox(width: 10),
          const Expanded(child: Text("Amigo Gamer")),
          Icon(Icons.circle,
              size: 10,
              color: index % 2 == 0
                  ? Colors.green
                  : Colors.grey)
        ],
      ),
    ),
  );
})
        ],
      ),
    );
  }
}


// =========================
// LOJA
// =========================

class LojaScreen extends StatelessWidget {
  const LojaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBackground(
      child: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Center(child: Text("LOJA", style: TextStyle(fontSize: 24))),
          const SizedBox(height: 20),

          ...["100 Créditos", "500 Créditos", "1000 Créditos"].map((item) {
            return Container(
              margin: const EdgeInsets.only(bottom: 12),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                gradient: const LinearGradient(
                  colors: [Colors.purple, Colors.pink],
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(item),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text("Comprar"),
                  )
                ],
              ),
            );
          })
        ],
      ),
    );
  }
}

// =========================
// PERFIL
// =========================

class PerfilScreen extends StatelessWidget {
  const PerfilScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBackground(
      child: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Center(child: Text("PERFIL", style: TextStyle(fontSize: 24))),
          const SizedBox(height: 20),

          const CircleAvatar(
            radius: 40,
            backgroundColor: Colors.purple,
            child: Icon(Icons.person, size: 40),
          ),

          const SizedBox(height: 10),

          const Center(child: Text("PlayerX")),
          const SizedBox(height: 20),

          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.4),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Estatísticas"),
                SizedBox(height: 10),
                Text("K/D: 1.8"),
                Text("Winrate: 62%"),
                Text("Ranking: Diamante"),
              ],
            ),
          )
        ],
      ),
    );
  }
}


// =========================
// BACKGROUND PADRÃO (REUTILIZÁVEL)
// =========================

class AppBackground extends StatelessWidget {
  final Widget child;

  const AppBackground({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xFF0D0D0D),
            Color(0xFF1A1A2E),
            Color(0xFF2A0F1F),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: SafeArea(child: child),
    );
  }
}

