import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../services/auth_service.dart';
import '../services/data_service.dart';
import 'login_screen.dart';
import 'profile_screen.dart';
import 'dashboard_screen.dart';
import 'friends_screen.dart';
import 'challenges_screen.dart';
import 'ranking_screen.dart';
import 'community_screen.dart';
import 'shop_screen.dart';
import 'clans_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  final _authService = AuthService();
  final _dataService = DataService();

  final List<Map<String, dynamic>> _pages = [
    {'title': '👤 Perfil', 'icon': Icons.person},
    {'title': '📊 Dashboard', 'icon': Icons.dashboard},
    {'title': '👥 Amigos', 'icon': Icons.people},
    {'title': '⚔️ Desafios', 'icon': Icons.sports_esports},
    {'title': '🏆 Ranking', 'icon': Icons.leaderboard},
    {'title': '🌐 Comunidade', 'icon': Icons.public},
    {'title': '🛍️ Loja', 'icon': Icons.store},
    {'title': '🎯 Clãs', 'icon': Icons.groups},
  ];

  late List<Widget> _screens;

  @override
  void initState() {
    super.initState();
    _screens = [
      const ProfileScreen(),
      const DashboardScreen(),
      const FriendsScreen(),
      const ChallengesScreen(),
      const RankingScreen(),
      const CommunityScreen(),
      const ShopScreen(),
      const ClansScreen(),
    ];
  }

  Future<void> _handleLogout() async {
    await _authService.logout();
    if (mounted) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => const LoginScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final user = _authService.currentUser;

    return Scaffold(
      body: Row(
        children: [
          // Sidebar
          Container(
            width: 280,
            decoration: BoxDecoration(
              color: AppColors.primaryDark,
              border: Border(
                right: BorderSide(
                  color: AppColors.cyan.withOpacity(0.3),
                  width: 1,
                ),
              ),
            ),
            child: Column(
              children: [
                // Header
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    gradient: AppColors.primaryGradient,
                    border: Border(
                      bottom: BorderSide(
                        color: AppColors.cyan.withOpacity(0.3),
                        width: 1,
                      ),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'GameLink',
                        style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          color: AppColors.textPrimary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      if (user != null)
                        Text(
                          user.username,
                          style: const TextStyle(
                            color: AppColors.textSecondary,
                            fontSize: 12,
                          ),
                        ),
                    ],
                  ),
                ),
                // Menu Items
                Expanded(
                  child: ListView.builder(
                    itemCount: _pages.length,
                    itemBuilder: (context, index) {
                      final isSelected = _currentIndex == index;
                      return Container(
                        margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: isSelected
                              ? AppColors.cyan.withOpacity(0.2)
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(8),
                          border: isSelected
                              ? Border.all(
                                  color: AppColors.cyan,
                                  width: 1,
                                )
                              : null,
                        ),
                        child: ListTile(
                          title: Text(
                            _pages[index]['title'],
                            style: TextStyle(
                              color: isSelected
                                  ? AppColors.cyan
                                  : AppColors.textSecondary,
                              fontWeight: isSelected
                                  ? FontWeight.bold
                                  : FontWeight.normal,
                            ),
                          ),
                          onTap: () {
                            setState(() {
                              _currentIndex = index;
                            });
                          },
                        ),
                      );
                    },
                  ),
                ),
                // Logout Button
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: _handleLogout,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.neonRed,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text(
                        'Sair',
                        style: TextStyle(
                          color: AppColors.textPrimary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Main Content
          Expanded(
            child: Container(
              color: AppColors.backgroundColor,
              child: _screens[_currentIndex],
            ),
          ),
        ],
      ),
    );
  }
}
