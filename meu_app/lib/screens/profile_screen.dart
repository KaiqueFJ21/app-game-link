import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../services/auth_service.dart';
import '../services/data_service.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = AuthService().currentUser;
    final achievements = DataService().getAchievements();
    final titles = DataService().getTitles();

    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Perfil', style: Theme.of(context).textTheme.headlineMedium?.copyWith(color: AppColors.cyan)),
          const SizedBox(height: 24),
          if (user != null) ...[
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: AppColors.primaryDark,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: AppColors.cyan.withOpacity(0.3)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 40,
                        backgroundColor: AppColors.cyan.withOpacity(0.2),
                        child: const Icon(Icons.person, size: 40, color: AppColors.cyan),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(user.title, style: const TextStyle(color: AppColors.cyan, fontWeight: FontWeight.bold)),
                            Text(user.username, style: const TextStyle(color: AppColors.textPrimary, fontSize: 18, fontWeight: FontWeight.bold)),
                            Text('Nível ${user.level}', style: const TextStyle(color: AppColors.textSecondary)),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  LinearProgressIndicator(
                    value: user.currentXp / user.maxXp,
                    minHeight: 8,
                    backgroundColor: AppColors.primaryDark,
                    valueColor: const AlwaysStoppedAnimation<Color>(AppColors.neonGreen),
                  ),
                  const SizedBox(height: 8),
                  Text('${user.currentXp} / ${user.maxXp} XP', style: const TextStyle(color: AppColors.textSecondary, fontSize: 12)),
                ],
              ),
            ),
            const SizedBox(height: 24),
            Text('Informações Gerais', style: Theme.of(context).textTheme.titleLarge?.copyWith(color: AppColors.textPrimary)),
            const SizedBox(height: 12),
            _buildInfoCard('Email', user.email),
            _buildInfoCard('Membro desde', '${user.memberSince.day}/${user.memberSince.month}/${user.memberSince.year}'),
            _buildInfoCard('Jogos Conectados', user.connectedGames.join(', ')),
            const SizedBox(height: 24),
            Text('Estatísticas Gerais', style: Theme.of(context).textTheme.titleLarge?.copyWith(color: AppColors.textPrimary)),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(child: _buildStatCard('Total de Partidas', '${user.totalMatches}')),
                const SizedBox(width: 12),
                Expanded(child: _buildStatCard('Taxa de Vitória', '${user.winRate.toStringAsFixed(1)}%')),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(child: _buildStatCard('K/D Ratio', '${user.kdRatio.toStringAsFixed(2)}')),
                const SizedBox(width: 12),
                Expanded(child: _buildStatCard('Winrate', '${user.winrate.toStringAsFixed(1)}%')),
              ],
            ),
            const SizedBox(height: 24),
            Text('Títulos', style: Theme.of(context).textTheme.titleLarge?.copyWith(color: AppColors.textPrimary)),
            const SizedBox(height: 12),
            ...titles.map((title) => Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: title.active ? AppColors.cyan.withOpacity(0.1) : AppColors.primaryDark,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: title.active ? AppColors.cyan : AppColors.textMuted,
                  ),
                ),
                child: Row(
                  children: [
                    Text(title.name, style: TextStyle(color: title.active ? AppColors.cyan : AppColors.textSecondary, fontWeight: FontWeight.bold)),
                    const Spacer(),
                    Text(title.rarityText, style: const TextStyle(color: AppColors.textMuted, fontSize: 12)),
                  ],
                ),
              ),
            )),
            const SizedBox(height: 24),
            Text('Conquistas (${achievements.where((a) => a.unlocked).length}/${achievements.length})', style: Theme.of(context).textTheme.titleLarge?.copyWith(color: AppColors.textPrimary)),
            const SizedBox(height: 12),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, crossAxisSpacing: 12, mainAxisSpacing: 12),
              itemCount: achievements.length,
              itemBuilder: (context, index) {
                final achievement = achievements[index];
                return Container(
                  decoration: BoxDecoration(
                    color: achievement.unlocked ? AppColors.primaryDark : AppColors.primaryDark.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: achievement.unlocked ? AppColors.neonGreen : AppColors.textMuted),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(achievement.icon, style: const TextStyle(fontSize: 32)),
                      const SizedBox(height: 8),
                      Text(achievement.name, style: const TextStyle(color: AppColors.textSecondary, fontSize: 10), textAlign: TextAlign.center),
                    ],
                  ),
                );
              },
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildInfoCard(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: AppColors.primaryDark,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: AppColors.textMuted.withOpacity(0.3)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(label, style: const TextStyle(color: AppColors.textSecondary)),
            Text(value, style: const TextStyle(color: AppColors.cyan, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }

  Widget _buildStatCard(String label, String value) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.primaryDark,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.cyan.withOpacity(0.3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: const TextStyle(color: AppColors.textSecondary, fontSize: 12)),
          const SizedBox(height: 8),
          Text(value, style: const TextStyle(color: AppColors.cyan, fontSize: 20, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
