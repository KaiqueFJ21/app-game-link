import 'package:shared_preferences/shared_preferences.dart';
import '../models/user_model.dart';

/// Serviço de Autenticação para GameLink
/// 
/// Gerencia a autenticação de usuários com sistema fake (sem backend real)
/// Armazena dados localmente usando SharedPreferences

class AuthService {
  static final AuthService _instance = AuthService._internal();
  
  late SharedPreferences _prefs;
  UserModel? _currentUser;
  
  // Chaves para armazenamento local
  static const String _userKey = 'gamelink_user';
  static const String _tokenKey = 'gamelink_token';
  static const String _isLoggedInKey = 'gamelink_is_logged_in';

  AuthService._internal();

  /// Obtém a instância singleton do AuthService
  factory AuthService() {
    return _instance;
  }

  /// Inicializa o serviço
  Future<void> initialize() async {
    _prefs = await SharedPreferences.getInstance();
    _loadUserFromStorage();
  }

  /// Carrega o usuário armazenado localmente
  void _loadUserFromStorage() {
    final userJson = _prefs.getString(_userKey);
    if (userJson != null) {
      try {
        // Simular desserialização (em produção seria JSON real)
        _currentUser = _parseUserFromStorage(userJson);
      } catch (e) {
        print('Erro ao carregar usuário: $e');
      }
    }
  }

  /// Realiza login fake com email e senha
  /// 
  /// Simula autenticação sem backend real
  Future<bool> login(String email, String password) async {
    try {
      // Validações básicas
      if (email.isEmpty || password.isEmpty) {
        throw Exception('Email e senha são obrigatórios');
      }

      if (!email.contains('@')) {
        throw Exception('Email inválido');
      }

      if (password.length < 6) {
        throw Exception('Senha deve ter pelo menos 6 caracteres');
      }

      // Simular delay de rede
      await Future.delayed(const Duration(milliseconds: 800));

      // Criar usuário fake baseado no email
      _currentUser = _createFakeUser(email);

      // Salvar no armazenamento local
      await _saveUserToStorage(_currentUser!);

      // Salvar token fake
      await _prefs.setString(_tokenKey, 'fake_token_${DateTime.now().millisecondsSinceEpoch}');
      await _prefs.setBool(_isLoggedInKey, true);

      return true;
    } catch (e) {
      print('Erro no login: $e');
      return false;
    }
  }

  /// Realiza registro fake de novo usuário
  Future<bool> register(String username, String email, String password) async {
    try {
      // Validações
      if (username.isEmpty || email.isEmpty || password.isEmpty) {
        throw Exception('Todos os campos são obrigatórios');
      }

      if (username.length < 3) {
        throw Exception('Username deve ter pelo menos 3 caracteres');
      }

      if (!email.contains('@')) {
        throw Exception('Email inválido');
      }

      if (password.length < 6) {
        throw Exception('Senha deve ter pelo menos 6 caracteres');
      }

      // Simular delay de rede
      await Future.delayed(const Duration(milliseconds: 1000));

      // Criar novo usuário fake
      _currentUser = UserModel(
        id: 'user_${DateTime.now().millisecondsSinceEpoch}',
        username: username,
        email: email,
        level: 1,
        points: 0,
        avatar: _getRandomAvatar(),
        totalWins: 0,
        totalLosses: 0,
        winRate: 0.0,
        rankPosition: 9999,
        friendsCount: 0,
        clanId: null,
        createdAt: DateTime.now(),
        lastActive: DateTime.now(),
        isOnline: true,
        bio: 'Novo jogador no GameLink!',
        credits: 100, // Créditos iniciais
      );

      // Salvar no armazenamento local
      await _saveUserToStorage(_currentUser!);

      // Salvar token fake
      await _prefs.setString(_tokenKey, 'fake_token_${DateTime.now().millisecondsSinceEpoch}');
      await _prefs.setBool(_isLoggedInKey, true);

      return true;
    } catch (e) {
      print('Erro no registro: $e');
      return false;
    }
  }

  /// Realiza logout
  Future<void> logout() async {
    _currentUser = null;
    await _prefs.remove(_userKey);
    await _prefs.remove(_tokenKey);
    await _prefs.setBool(_isLoggedInKey, false);
  }

  /// Obtém o usuário atual
  UserModel? get currentUser => _currentUser;

  /// Verifica se o usuário está autenticado
  bool get isAuthenticated => _prefs.getBool(_isLoggedInKey) ?? false;

  /// Obtém o token de autenticação
  String? get token => _prefs.getString(_tokenKey);

  /// Atualiza o perfil do usuário
  Future<bool> updateProfile({
    String? username,
    String? bio,
    String? avatar,
  }) async {
    if (_currentUser == null) return false;

    try {
      _currentUser = _currentUser!.copyWith(
        username: username ?? _currentUser!.username,
        bio: bio ?? _currentUser!.bio,
        avatar: avatar ?? _currentUser!.avatar,
      );

      await _saveUserToStorage(_currentUser!);
      return true;
    } catch (e) {
      print('Erro ao atualizar perfil: $e');
      return false;
    }
  }

  /// Adiciona créditos ao usuário
  Future<bool> addCredits(int amount) async {
    if (_currentUser == null) return false;

    try {
      _currentUser = _currentUser!.copyWith(
        credits: _currentUser!.credits + amount,
      );

      await _saveUserToStorage(_currentUser!);
      return true;
    } catch (e) {
      print('Erro ao adicionar créditos: $e');
      return false;
    }
  }

  /// Remove créditos do usuário
  Future<bool> removeCredits(int amount) async {
    if (_currentUser == null) return false;

    if (_currentUser!.credits < amount) {
      throw Exception('Créditos insuficientes');
    }

    try {
      _currentUser = _currentUser!.copyWith(
        credits: _currentUser!.credits - amount,
      );

      await _saveUserToStorage(_currentUser!);
      return true;
    } catch (e) {
      print('Erro ao remover créditos: $e');
      return false;
    }
  }

  /// Adiciona experiência ao usuário
  Future<bool> addExperience(int amount) async {
    if (_currentUser == null) return false;

    try {
      int newPoints = _currentUser!.points + amount;
      int newLevel = _currentUser!.level;

      // Calcula novo nível (100 pontos por nível)
      newLevel = (newPoints ~/ 100) + 1;

      _currentUser = _currentUser!.copyWith(
        points: newPoints,
        level: newLevel,
      );

      await _saveUserToStorage(_currentUser!);
      return true;
    } catch (e) {
      print('Erro ao adicionar experiência: $e');
      return false;
    }
  }

  /// Atualiza estatísticas de vitória/derrota
  Future<bool> updateStats({
    required bool isWin,
  }) async {
    if (_currentUser == null) return false;

    try {
      int newWins = _currentUser!.totalWins;
      int newLosses = _currentUser!.totalLosses;

      if (isWin) {
        newWins++;
      } else {
        newLosses++;
      }

      double winRate = newWins / (newWins + newLosses) * 100;

      _currentUser = _currentUser!.copyWith(
        totalWins: newWins,
        totalLosses: newLosses,
        winRate: winRate,
      );

      await _saveUserToStorage(_currentUser!);
      return true;
    } catch (e) {
      print('Erro ao atualizar estatísticas: $e');
      return false;
    }
  }

  /// Cria um usuário fake baseado no email
  UserModel _createFakeUser(String email) {
    final username = email.split('@')[0];
    final now = DateTime.now();

    return UserModel(
      id: 'user_${now.millisecondsSinceEpoch}',
      username: username,
      email: email,
      level: 15 + (now.millisecond % 30),
      points: 1500 + (now.millisecond % 1000),
      avatar: _getRandomAvatar(),
      totalWins: 50 + (now.millisecond % 100),
      totalLosses: 20 + (now.millisecond % 50),
      winRate: 70.0 + (now.millisecond % 20),
      rankPosition: 100 + (now.millisecond % 500),
      friendsCount: 10 + (now.millisecond % 50),
      clanId: now.millisecond % 2 == 0 ? 'clan_123' : null,
      createdAt: now.subtract(Duration(days: 30 + (now.millisecond % 300))),
      lastActive: now,
      isOnline: true,
      bio: 'Jogador competitivo no GameLink!',
      credits: 500 + (now.millisecond % 1000),
    );
  }

  /// Retorna um avatar aleatório
  String _getRandomAvatar() {
    final avatars = [
      'https://api.dicebear.com/7.x/avataaars/svg?seed=1',
      'https://api.dicebear.com/7.x/avataaars/svg?seed=2',
      'https://api.dicebear.com/7.x/avataaars/svg?seed=3',
      'https://api.dicebear.com/7.x/avataaars/svg?seed=4',
      'https://api.dicebear.com/7.x/avataaars/svg?seed=5',
    ];
    return avatars[DateTime.now().millisecond % avatars.length];
  }

  /// Salva o usuário no armazenamento local
  Future<void> _saveUserToStorage(UserModel user) async {
    // Simular serialização JSON
    final userJson = _userToStorageString(user);
    await _prefs.setString(_userKey, userJson);
  }

  /// Converte usuário para string de armazenamento
  String _userToStorageString(UserModel user) {
    return '${user.id}|${user.username}|${user.email}|${user.level}|${user.points}|${user.avatar}|${user.totalWins}|${user.totalLosses}|${user.winRate}|${user.rankPosition}|${user.friendsCount}|${user.clanId}|${user.createdAt.toIso8601String()}|${user.lastActive.toIso8601String()}|${user.isOnline}|${user.bio}|${user.credits}';
  }

  /// Converte string de armazenamento para usuário
  UserModel _parseUserFromStorage(String userString) {
    final parts = userString.split('|');
    return UserModel(
      id: parts[0],
      username: parts[1],
      email: parts[2],
      level: int.parse(parts[3]),
      points: int.parse(parts[4]),
      avatar: parts[5],
      totalWins: int.parse(parts[6]),
      totalLosses: int.parse(parts[7]),
      winRate: double.parse(parts[8]),
      rankPosition: int.parse(parts[9]),
      friendsCount: int.parse(parts[10]),
      clanId: parts[11] == 'null' ? null : parts[11],
      createdAt: DateTime.parse(parts[12]),
      lastActive: DateTime.parse(parts[13]),
      isOnline: parts[14] == 'true',
      bio: parts[15],
      credits: int.parse(parts[16]),
    );
  }
}
