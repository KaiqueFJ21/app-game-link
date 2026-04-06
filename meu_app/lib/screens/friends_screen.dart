import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../services/data_service.dart';

class FriendsScreen extends StatelessWidget {
  const FriendsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final friends = DataService().getFriends();
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Amigos', style: Theme.of(context).textTheme.headlineMedium?.copyWith(color: AppColors.cyan)),
          const SizedBox(height: 24),
          ...friends.map((friend) => Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.primaryDark,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: AppColors.cyan.withOpacity(0.3)),
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 24,
                    backgroundColor: AppColors.cyan.withOpacity(0.2),
                    child: const Icon(Icons.person, color: AppColors.cyan),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(friend.username, style: const TextStyle(color: AppColors.textPrimary, fontWeight: FontWeight.bold)),
                        Text('${friend.title} • Nível ${friend.level}', style: const TextStyle(color: AppColors.textSecondary, fontSize: 12)),
                        Text('${friend.winRate.toStringAsFixed(1)}% WR • ${friend.totalMatches} partidas', style: const TextStyle(color: AppColors.cyan, fontSize: 12)),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: friend.online ? AppColors.neonGreen.withOpacity(0.2) : AppColors.textMuted.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      friend.statusText,
                      style: TextStyle(color: friend.online ? AppColors.neonGreen : AppColors.textMuted, fontSize: 12),
                    ),
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
