import '../models/chat_model.dart';
import '../models/clan_model.dart';
import '../models/challenge_model.dart';
import '../models/badge_model.dart';
import '../models/shop_model.dart';
import '../models/ranking_model.dart';
import '../models/friend_model.dart';
import '../models/notification_model.dart';

/// Serviço de Dados para GameLink
/// 
/// Fornece dados fake para a aplicação
/// Em produção, seria substituído por chamadas a um backend real

class DataService {
  static final DataService _instance = DataService._internal();

  DataService._internal();

  factory DataService() {
    return _instance;
  }

  /// Obtém lista de amigos fake
  List<FriendModel> getFakeFriends() {
    return [
      FriendModel(
        id: 'friend_1',
        name: 'João Silva',
        avatar: 'https://api.dicebear.com/7.x/avataaars/svg?seed=friend1',
        level: 25,
        mainGame: 'Valorant',
        status: 'online',
        lastSeen: DateTime.now(),
        clanName: 'Phoenix Squad',
        isFavorite: true,
        friendSince: DateTime.now().subtract(const Duration(days: 90)),
        unreadMessages: 2,
        statistics: FriendStatistics(
          totalWins: 150,
          totalLosses: 45,
          overallWinRate: 76.9,
          badgeCount: 12,
          clanCount: 2,
          totalHoursPlayed: 450,
          friendCount: 35,
          globalRanking: 245,
        ),
      ),
      FriendModel(
        id: 'friend_2',
        name: 'Maria Santos',
        avatar: 'https://api.dicebear.com/7.x/avataaars/svg?seed=friend2',
        level: 32,
        mainGame: 'League of Legends',
        status: 'away',
        lastSeen: DateTime.now().subtract(const Duration(minutes: 15)),
        clanName: 'Dragon Slayers',
        isFavorite: true,
        friendSince: DateTime.now().subtract(const Duration(days: 180)),
        unreadMessages: 0,
        statistics: FriendStatistics(
          totalWins: 220,
          totalLosses: 60,
          overallWinRate: 78.6,
          badgeCount: 18,
          clanCount: 3,
          totalHoursPlayed: 680,
          friendCount: 52,
          globalRanking: 156,
        ),
      ),
      FriendModel(
        id: 'friend_3',
        name: 'Pedro Costa',
        avatar: 'https://api.dicebear.com/7.x/avataaars/svg?seed=friend3',
        level: 18,
        mainGame: 'CS:GO',
        status: 'offline',
        lastSeen: DateTime.now().subtract(const Duration(hours: 3)),
        clanName: null,
        isFavorite: false,
        friendSince: DateTime.now().subtract(const Duration(days: 45)),
        unreadMessages: 5,
        statistics: FriendStatistics(
          totalWins: 85,
          totalLosses: 35,
          overallWinRate: 70.8,
          badgeCount: 8,
          clanCount: 1,
          totalHoursPlayed: 220,
          friendCount: 18,
          globalRanking: 512,
        ),
      ),
    ];
  }

  /// Obtém lista de ranking fake
  List<RankingModel> getFakeRanking() {
    return [
      RankingModel(
        position: 1,
        userId: 'user_rank_1',
        name: 'ProPlayer_X',
        avatar: 'https://api.dicebear.com/7.x/avataaars/svg?seed=rank1',
        level: 95,
        totalExperience: 450000,
        rankingPoints: 98500,
        mainGame: 'Valorant',
        wins: 1250,
        losses: 180,
        winRate: 87.4,
        clanName: 'Legends',
        title: 'Immortal',
        positionChange: 0,
        isCurrentUser: false,
      ),
      RankingModel(
        position: 2,
        userId: 'user_rank_2',
        name: 'ShadowKnight',
        avatar: 'https://api.dicebear.com/7.x/avataaars/svg?seed=rank2',
        level: 92,
        totalExperience: 420000,
        rankingPoints: 96200,
        mainGame: 'League of Legends',
        wins: 980,
        losses: 220,
        winRate: 81.7,
        clanName: 'Dragon Slayers',
        title: 'Challenger',
        positionChange: 1,
        isCurrentUser: false,
      ),
      RankingModel(
        position: 3,
        userId: 'user_rank_3',
        name: 'FrostByte',
        avatar: 'https://api.dicebear.com/7.x/avataaars/svg?seed=rank3',
        level: 88,
        totalExperience: 390000,
        rankingPoints: 94100,
        mainGame: 'CS:GO',
        wins: 850,
        losses: 250,
        winRate: 77.3,
        clanName: null,
        title: 'Elite',
        positionChange: -1,
        isCurrentUser: false,
      ),
    ];
  }

  /// Obtém lista de desafios fake
  List<ChallengeModel> getFakeChallenges() {
    final now = DateTime.now();
    return [
      ChallengeModel(
        id: 'challenge_1',
        title: 'Torneio 1v1 Valorant',
        description: 'Competição de 1v1 no mapa Ascent',
        game: 'Valorant',
        type: '1v1',
        status: 'active',
        reward: 500,
        experienceReward: 250,
        creatorId: 'user_1',
        creatorName: 'TournamentMaster',
        participants: [],
        maxParticipants: 16,
        startDate: now,
        endDate: now.add(const Duration(days: 7)),
        minLevel: 10,
        difficulty: 'hard',
        requirements: 'Nível mínimo 10, Rank Gold ou superior',
        rules: 'Melhor de 3 rodadas. Sem hacks ou cheats.',
      ),
      ChallengeModel(
        id: 'challenge_2',
        title: 'Desafio Cooperativo LoL',
        description: 'Derrote 5 times inimigos em sequência',
        game: 'League of Legends',
        type: 'team',
        status: 'active',
        reward: 300,
        experienceReward: 150,
        creatorId: 'user_2',
        creatorName: 'CoopLeader',
        participants: [],
        maxParticipants: 10,
        startDate: now.subtract(const Duration(days: 2)),
        endDate: now.add(const Duration(days: 5)),
        minLevel: 5,
        difficulty: 'medium',
        requirements: 'Nível mínimo 5',
        rules: 'Trabalho em equipe obrigatório',
      ),
    ];
  }

  /// Obtém lista de badges fake
  List<BadgeModel> getFakeBadges() {
    return [
      BadgeModel(
        id: 'badge_1',
        name: 'Primeira Vitória',
        description: 'Obtenha sua primeira vitória em qualquer jogo',
        icon: '🏆',
        color: '#FFD700',
        rarity: 'common',
        category: 'achievement',
        requirements: 'Vencer 1 partida',
        experienceReward: 50,
        creditReward: 100,
        isSecret: false,
        obtainedCount: 15420,
      ),
      BadgeModel(
        id: 'badge_2',
        name: 'Série de 10 Vitórias',
        description: 'Vença 10 partidas consecutivas',
        icon: '⭐',
        color: '#FF69B4',
        rarity: 'rare',
        category: 'milestone',
        requirements: 'Vencer 10 partidas seguidas',
        experienceReward: 500,
        creditReward: 1000,
        isSecret: false,
        obtainedCount: 1250,
      ),
      BadgeModel(
        id: 'badge_3',
        name: 'Lenda Oculta',
        description: 'Atinja o topo do ranking global',
        icon: '👑',
        color: '#FF1493',
        rarity: 'legendary',
        category: 'special',
        requirements: 'Posição #1 no ranking global',
        experienceReward: 5000,
        creditReward: 10000,
        isSecret: true,
        obtainedCount: 3,
      ),
    ];
  }

  /// Obtém lista de itens da loja fake
  List<ShopItemModel> getFakeShopItems() {
    return [
      ShopItemModel(
        id: 'item_1',
        name: 'Skin Neon Gamer',
        description: 'Skin exclusiva com efeito neon brilhante',
        image: 'https://via.placeholder.com/200x200?text=Neon+Skin',
        price: 500,
        diamondPrice: 50,
        category: 'cosmetic',
        rarity: 'epic',
        effects: 'Efeito neon ao usar habilidades',
        duration: 0, // Permanente
        isOnSale: true,
        discountPercent: 20,
        salesCount: 5420,
        rating: 4.8,
        isOwned: false,
      ),
      ShopItemModel(
        id: 'item_2',
        name: 'Booster de XP 2x',
        description: 'Dobra a experiência ganha por 7 dias',
        image: 'https://via.placeholder.com/200x200?text=XP+Booster',
        price: 200,
        diamondPrice: 20,
        category: 'booster',
        rarity: 'uncommon',
        effects: 'Experiência 2x por 7 dias',
        duration: 7,
        isOnSale: false,
        discountPercent: 0,
        salesCount: 12850,
        rating: 4.9,
        isOwned: false,
      ),
      ShopItemModel(
        id: 'item_3',
        name: 'Pet Dragão Cibernético',
        description: 'Companheiro virtual que o segue no jogo',
        image: 'https://via.placeholder.com/200x200?text=Cyber+Dragon',
        price: 800,
        diamondPrice: 80,
        category: 'pet',
        rarity: 'legendary',
        effects: 'Aumenta carisma em 10%',
        duration: 0, // Permanente
        isOnSale: true,
        discountPercent: 15,
        salesCount: 2100,
        rating: 4.7,
        isOwned: false,
      ),
    ];
  }

  /// Obtém lista de clãs fake
  List<ClanModel> getFakeClans() {
    return [
      ClanModel(
        id: 'clan_1',
        name: 'Phoenix Squad',
        description: 'Clã competitivo focado em Valorant',
        logo: 'https://via.placeholder.com/100x100?text=Phoenix',
        leaderId: 'user_leader_1',
        leaderName: 'PhoenixLord',
        memberCount: 45,
        members: [],
        level: 25,
        experience: 125000,
        rankingPoints: 45600,
        createdAt: DateTime.now().subtract(const Duration(days: 365)),
        isActive: true,
        minLevel: 15,
        requirements: 'Nível mínimo 15, Taxa de vitória 60%+',
      ),
      ClanModel(
        id: 'clan_2',
        name: 'Dragon Slayers',
        description: 'Clã dedicado a League of Legends',
        logo: 'https://via.placeholder.com/100x100?text=Dragons',
        leaderId: 'user_leader_2',
        leaderName: 'DragonMaster',
        memberCount: 52,
        members: [],
        level: 28,
        experience: 145000,
        rankingPoints: 52100,
        createdAt: DateTime.now().subtract(const Duration(days: 400)),
        isActive: true,
        minLevel: 12,
        requirements: 'Nível mínimo 12, Participação ativa',
      ),
    ];
  }

  /// Obtém lista de notificações fake
  List<NotificationModel> getFakeNotifications() {
    final now = DateTime.now();
    return [
      NotificationModel(
        id: 'notif_1',
        type: NotificationType.achievement,
        title: 'Conquista Desbloqueada!',
        description: 'Você desbloqueou "Primeira Vitória"',
        icon: '🏆',
        isRead: false,
        createdAt: now.subtract(const Duration(minutes: 5)),
        actionUrl: '/achievements',
        metadata: {'badgeId': 'badge_1'},
        priority: NotificationPriority.high,
      ),
      NotificationModel(
        id: 'notif_2',
        type: NotificationType.message,
        title: 'Nova Mensagem',
        description: 'João Silva: Quer jogar uma partida?',
        icon: '💬',
        isRead: false,
        createdAt: now.subtract(const Duration(minutes: 15)),
        actionUrl: '/chat/friend_1',
        metadata: {'senderId': 'friend_1'},
        priority: NotificationPriority.normal,
      ),
      NotificationModel(
        id: 'notif_3',
        type: NotificationType.challenge,
        title: 'Novo Desafio Disponível',
        description: 'Torneio 1v1 Valorant começou!',
        icon: '⚔️',
        isRead: true,
        createdAt: now.subtract(const Duration(hours: 2)),
        actionUrl: '/challenges/challenge_1',
        metadata: {'challengeId': 'challenge_1'},
        priority: NotificationPriority.normal,
      ),
    ];
  }

  /// Obtém lista de mensagens fake de um chat
  List<Message> getFakeChatMessages(String chatId) {
    final now = DateTime.now();
    return [
      Message(
        id: 'msg_1',
        senderId: 'friend_1',
        recipientId: 'current_user',
        texto: 'Opa, tudo bem?',
        horario: now.subtract(const Duration(minutes: 30)),
        isMe: false,
        isRead: true,
      ),
      Message(
        id: 'msg_2',
        senderId: 'current_user',
        recipientId: 'friend_1',
        texto: 'Tudo certo! Quer jogar?',
        horario: now.subtract(const Duration(minutes: 28)),
        isMe: true,
        isRead: true,
      ),
      Message(
        id: 'msg_3',
        senderId: 'friend_1',
        recipientId: 'current_user',
        texto: 'Claro! Bora no Valorant',
        horario: now.subtract(const Duration(minutes: 25)),
        isMe: false,
        isRead: true,
      ),
      Message(
        id: 'msg_4',
        senderId: 'current_user',
        recipientId: 'friend_1',
        texto: 'Ótimo! Já estou online',
        horario: now.subtract(const Duration(minutes: 20)),
        isMe: true,
        isRead: true,
      ),
    ];
  }

  /// Obtém lista de chats fake
  List<ChatModel> getFakeChats() {
    final now = DateTime.now();
    return [
      ChatModel(
        id: 'chat_1',
        userId: 'current_user',
        otherUserId: 'friend_1',
        otherUserName: 'João Silva',
        otherUserAvatar: 'https://api.dicebear.com/7.x/avataaars/svg?seed=friend1',
        lastMessage: 'Ótimo! Já estou online',
        lastMessageTime: now.subtract(const Duration(minutes: 20)),
        unreadCount: 0,
        isOnline: true,
        messages: [],
      ),
      ChatModel(
        id: 'chat_2',
        userId: 'current_user',
        otherUserId: 'friend_2',
        otherUserName: 'Maria Santos',
        otherUserAvatar: 'https://api.dicebear.com/7.x/avataaars/svg?seed=friend2',
        lastMessage: 'Vamos fazer um 5v5?',
        lastMessageTime: now.subtract(const Duration(hours: 2)),
        unreadCount: 2,
        isOnline: false,
        messages: [],
      ),
    ];
  }

  /// Obtém solicitações de amizade fake
  List<FriendRequest> getFakeFriendRequests() {
    final now = DateTime.now();
    return [
      FriendRequest(
        id: 'req_1',
        senderId: 'user_req_1',
        senderName: 'Lucas Oliveira',
        senderAvatar: 'https://api.dicebear.com/7.x/avataaars/svg?seed=req1',
        senderLevel: 22,
        senderMainGame: 'Valorant',
        status: 'pending',
        sentAt: now.subtract(const Duration(hours: 3)),
        message: 'Adorei seu gameplay! Quer ser amigo?',
      ),
      FriendRequest(
        id: 'req_2',
        senderId: 'user_req_2',
        senderName: 'Ana Silva',
        senderAvatar: 'https://api.dicebear.com/7.x/avataaars/svg?seed=req2',
        senderLevel: 28,
        senderMainGame: 'League of Legends',
        status: 'pending',
        sentAt: now.subtract(const Duration(hours: 1)),
        message: null,
      ),
    ];
  }
}
