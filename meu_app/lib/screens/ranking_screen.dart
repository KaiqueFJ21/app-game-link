import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../services/data_service.dart';

class RankingScreen extends StatelessWidget {
  const RankingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ranking = DataService().getRanking();
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Ranking Global', style: Theme.of(context).textTheme.headlineMedium?.copyWith(color: AppColors.cyan)),
          const SizedBox(height: 24),
          ...ranking.map((player) => Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: player.isCurrentUser ? AppColors.cyan.withOpacity(0.1) : AppColors.primaryDark,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: player.isCurrentUser ? AppColors.cyan : AppColors.textMuted.withOpacity(0.3),
                  width: player.isCurrentUser ? 2 : 1,
                ),
              ),
              child: Row(
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: player.position == 1 ? const Color(0xFFFFD700) : player.position == 2 ? const Color(0xFFC0C0C0) : player.position == 3 ? const Color(0xFFCD7F32) : AppColors.primaryDark,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: player.position <= 3 ? Colors.white : AppColors.textMuted),
                    ),
                    child: Center(
                      child: Text(
                        '${player.position}',
                        style: TextStyle(
                          color: player.position <= 3 ? Colors.black : AppColors.textPrimary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(player.username, style: const TextStyle(color: AppColors.textPrimary, fontWeight: FontWeight.bold)),
                        Text('Nível ${player.level} • ${player.winRate.toStringAsFixed(1)}% WR', style: const TextStyle(color: AppColors.textSecondary, fontSize: 12)),
                      ],
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text('${player.points} pts', style: const TextStyle(color: AppColors.cyan, fontWeight: FontWeight.bold)),
                    ],
                  ),
                ],
              ),
            ),
          )),
        ],
      ),
    );
  }
}
