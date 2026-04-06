import 'package:shared_preferences/shared_preferences.dart';
import '../models/user_model.dart';

class AuthService {
  static final AuthService _instance = AuthService._internal();

  factory AuthService() {
    return _instance;
  }

  AuthService._internal();

  User? _currentUser;
  bool _isLoggedIn = false;

  User? get currentUser => _currentUser;
  bool get isLoggedIn => _isLoggedIn;

  Future<bool> login(String email, String password) async {
    try {
      if (email.isEmpty || password.isEmpty) return false;
      if (!email.contains('@')) return false;
      if (password.length < 6) return false;

      _currentUser = User(
        id: 'user_${DateTime.now().millisecondsSinceEpoch}',
        username: 'ProGamer2024',
        email: email,
        title: '[Mestre dos Desafios]',
        level: 45,
        currentXp: 7500,
        maxXp: 10000,
        bio: 'Jogador competitivo focado em Valorant e League of Legends. Sempre em busca de novos desafios!',
        avatar: 'https://via.placeholder.com/150',
        memberSince: DateTime(2023, 3, 15),
        connectedGames: ['Valorant', 'League of Legends', 'CS:GO'],
        totalMatches: 1250,
        winRate: 52.3,
        kdRatio: 1.45,
        winrate: 52.3,
        activeTitles: ['[Mestre dos Desafios]'],
        achievements: ['first_win', 'comprador', 'socialite', 'vencedor_10'],
        credits: 5000,
      );

      _isLoggedIn = true;

      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool('isLoggedIn', true);
      await prefs.setString('userEmail', email);

      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> register(String username, String email, String password) async {
    try {
      if (username.isEmpty || email.isEmpty || password.isEmpty) return false;
      if (username.length < 3) return false;
      if (!email.contains('@')) return false;
      if (password.length < 6) return false;

      _currentUser = User(
        id: 'user_${DateTime.now().millisecondsSinceEpoch}',
        username: username,
        email: email,
        title: '[Iniciante]',
        level: 1,
        currentXp: 0,
        maxXp: 1000,
        bio: 'Novo jogador no GameLink!',
        avatar: 'https://via.placeholder.com/150',
        memberSince: DateTime.now(),
        connectedGames: [],
        totalMatches: 0,
        winRate: 0,
        kdRatio: 0,
        winrate: 0,
        activeTitles: ['[Iniciante]'],
        achievements: [],
        credits: 100,
      );

      _isLoggedIn = true;

      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool('isLoggedIn', true);
      await prefs.setString('userEmail', email);

      return true;
    } catch (e) {
      return false;
    }
  }

  Future<void> logout() async {
    _currentUser = null;
    _isLoggedIn = false;

    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLoggedIn', false);
    await prefs.remove('userEmail');
  }

  Future<void> checkLoginStatus() async {
    final prefs = await SharedPreferences.getInstance();
    _isLoggedIn = prefs.getBool('isLoggedIn') ?? false;
  }
}
