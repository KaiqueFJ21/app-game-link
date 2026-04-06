import '../models/match_model.dart';
import '../models/achievement_model.dart';
import '../models/title_model.dart';
import '../models/friend_model.dart';
import '../models/challenge_model.dart';
import '../models/clan_model.dart';
import '../models/shop_item_model.dart';
import '../models/ranking_model.dart';

class DataService {
  static final DataService _instance = DataService._internal();

  factory DataService() {
    return _instance;
  }

  DataService._internal();

  List<Match> getMatches() {
    return [
      Match(
        id: '1',
        game: 'Valorant',
        map: 'Ascent',
        won: true,
        agent: 'Jett',
        kills: 18,
        deaths: 8,
        assists: 5,
        damage: 2450,
        gold: 0,
        duration: Duration(minutes: 35, seconds: 42),
        playedAt: DateTime.now().subtract(Duration(hours: 2)),
      ),
      Match(
        id: '2',
        game: 'League of Legends',
        map: 'Summoner\'s Rift',
        won: true,
        agent: 'Ahri',
        kills: 8,
        deaths: 2,
        assists: 15,
        damage: 18900,
        gold: 0,
        duration: Duration(minutes: 28, seconds: 15),
        playedAt: DateTime.now().subtract(Duration(hours: 5)),
      ),
      Match(
        id: '3',
        game: 'CS:GO',
        map: 'Dust2',
        won: false,
        agent: 'Rifler',
        kills: 15,
        deaths: 18,
        assists: 0,
        damage: 1850,
        gold: 0,
        duration: Duration(minutes: 42, seconds: 30),
        playedAt: DateTime.now().subtract(Duration(hours: 8)),
      ),
      Match(
        id: '4',
        game: 'Valorant',
        map: 'Haven',
        won: true,
        agent: 'Sage',
        kills: 12,
        deaths: 6,
        assists: 8,
        damage: 1950,
        gold: 0,
        duration: Duration(minutes: 32, seconds: 10),
        playedAt: DateTime.now().subtract(Duration(hours: 12)),
      ),
    ];
  }

  List<Achievement> getAchievements() {
    return [
      Achievement(
        id: '1',
        name: 'Primeira Vitória',
        description: 'Vença seu primeiro desafio',
        icon: '🎯',
        unlocked: true,
        unlockedAt: DateTime(2025, 6, 20),
        progress: 1,
        maxProgress: 1,
      ),
      Achievement(
        id: '2',
        name: 'Comprador Compulsivo',
        description: 'Compre 5 itens na loja',
        icon: '🛍️',
        unlocked: true,
        unlockedAt: DateTime(2025, 7, 10),
        progress: 5,
        maxProgress: 5,
      ),
      Achievement(
        id: '3',
        name: 'Socialite',
        description: 'Tenha 20 amigos',
        icon: '👥',
        unlocked: true,
        unlockedAt: DateTime(2025, 7, 15),
        progress: 20,
        maxProgress: 20,
      ),
      Achievement(
        id: '4',
        name: 'Vencedor de 10 Desafios',
        description: 'Vença 10 desafios',
        icon: '🏆',
        unlocked: true,
        unlockedAt: DateTime(2025, 8, 1),
        progress: 10,
        maxProgress: 10,
      ),
      Achievement(
        id: '5',
        name: 'Lenda Viva',
        description: 'Alcance nível 50',
        icon: '⭐',
        unlocked: false,
        progress: 45,
        maxProgress: 50,
      ),
      Achievement(
        id: '6',
        name: 'Rei do Ranking',
        description: 'Fique em 1º lugar no ranking',
        icon: '👑',
        unlocked: false,
        progress: 0,
        maxProgress: 1,
      ),
    ];
  }

  List<Title> getTitles() {
    return [
      Title(
        id: '1',
        name: '[Mestre dos Desafios]',
        description: 'Ganhe 10 desafios',
        rarity: TitleRarity.rare,
        active: true,
        unlockedAt: DateTime(2025, 6, 20),
      ),
      Title(
        id: '2',
        name: '[Comprador Elite]',
        description: 'Gaste 1000 créditos',
        rarity: TitleRarity.common,
        active: false,
        unlockedAt: DateTime(2025, 7, 10),
      ),
      Title(
        id: '3',
        name: '[Lenda Ascendente]',
        description: 'Alcance nível 50',
        rarity: TitleRarity.legendary,
        active: false,
        unlockedAt: DateTime(2025, 8, 1),
      ),
    ];
  }

  List<Friend> getFriends() {
    return [
      Friend(
        id: '1',
        username: 'ShadowGamer',
        avatar: 'https://via.placeholder.com/100',
        level: 42,
        title: '[Vencedor]',
        online: true,
        winRate: 54.2,
        totalMatches: 980,
      ),
      Friend(
        id: '2',
        username: 'PhantomKnight',
        avatar: 'https://via.placeholder.com/100',
        level: 38,
        title: '[Estrategista]',
        online: true,
        lastSeen: DateTime.now().subtract(Duration(minutes: 5)),
        winRate: 51.8,
        totalMatches: 750,
      ),
      Friend(
        id: '3',
        username: 'NeonViper',
        avatar: 'https://via.placeholder.com/100',
        level: 35,
        title: '[Iniciante]',
        online: false,
        lastSeen: DateTime.now().subtract(Duration(hours: 2)),
        winRate: 48.5,
        totalMatches: 320,
      ),
    ];
  }

  List<Challenge> getChallenges() {
    return [
      Challenge(
        id: '1',
        title: 'Torneio 1v1 Valorant',
        description: 'Compete em partidas 1v1 no Valorant',
        type: '1v1',
        reward: 500,
        startDate: DateTime.now(),
        endDate: DateTime.now().add(Duration(days: 7)),
        participants: 128,
        joined: false,
      ),
      Challenge(
        id: '2',
        title: 'Desafio de Equipes',
        description: 'Forme uma equipe e compete',
        type: '5v5',
        reward: 1000,
        startDate: DateTime.now(),
        endDate: DateTime.now().add(Duration(days: 14)),
        participants: 32,
        joined: false,
      ),
    ];
  }

  List<Clan> getClans() {
    return [
      Clan(
        id: '1',
        name: 'Phoenix Rising',
        description: 'Clã competitivo de alto nível',
        leader: 'ProGamer2024',
        members: 45,
        level: 15,
        createdAt: DateTime(2024, 1, 15),
      ),
      Clan(
        id: '2',
        name: 'Shadow Legends',
        description: 'Clã focado em diversão e comunidade',
        leader: 'ShadowGamer',
        members: 78,
        level: 12,
        createdAt: DateTime(2024, 3, 20),
      ),
    ];
  }

  List<ShopItem> getShopItems() {
    return [
      ShopItem(
        id: '1',
        name: 'Avatar Premium',
        description: 'Avatar exclusivo com efeitos especiais',
        price: 500,
        icon: '👤',
        owned: false,
      ),
      ShopItem(
        id: '2',
        name: 'Título Raro',
        description: 'Título exclusivo para sua conta',
        price: 1000,
        icon: '🏆',
        owned: false,
      ),
      ShopItem(
        id: '3',
        name: 'Boost de XP',
        description: 'Ganhe 2x XP por 7 dias',
        price: 300,
        icon: '⚡',
        owned: false,
      ),
    ];
  }

  List<RankingPlayer> getRanking() {
    return [
      RankingPlayer(
        position: 1,
        username: 'LegendaryPro',
        level: 50,
        points: 15000,
        winRate: 65.5,
        isCurrentUser: false,
      ),
      RankingPlayer(
        position: 2,
        username: 'EliteGamer',
        level: 48,
        points: 14500,
        winRate: 63.2,
        isCurrentUser: false,
      ),
      RankingPlayer(
        position: 3,
        username: 'ProGamer2024',
        level: 45,
        points: 13800,
        winRate: 52.3,
        isCurrentUser: true,
      ),
      RankingPlayer(
        position: 4,
        username: 'ShadowGamer',
        level: 42,
        points: 12500,
        winRate: 54.2,
        isCurrentUser: false,
      ),
      RankingPlayer(
        position: 5,
        username: 'PhantomKnight',
        level: 38,
        points: 11200,
        winRate: 51.8,
        isCurrentUser: false,
      ),
    ];
  }
}
