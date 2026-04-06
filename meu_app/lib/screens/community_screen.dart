import 'package:flutter/material.dart';
import '../constants/colors.dart';

class CommunityScreen extends StatelessWidget {
  const CommunityScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Comunidade', style: Theme.of(context).textTheme.headlineMedium?.copyWith(color: AppColors.cyan)),
          const SizedBox(height: 24),
          Text('Chat Geral', style: Theme.of(context).textTheme.titleLarge?.copyWith(color: AppColors.textPrimary)),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColors.primaryDark,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: AppColors.cyan.withOpacity(0.3)),
            ),
            child: const Column(
              children: [
                Text('💬 Comunidade em desenvolvimento...', style: TextStyle(color: AppColors.textSecondary)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
