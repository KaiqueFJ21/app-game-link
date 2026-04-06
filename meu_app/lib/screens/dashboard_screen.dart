import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../services/data_service.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final matches = DataService().getMatches();
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Dashboard', style: Theme.of(context).textTheme.headlineMedium?.copyWith(color: AppColors.cyan)),
          const SizedBox(height: 24),
          Text('Histórico de Partidas', style: Theme.of(context).textTheme.titleLarge?.copyWith(color: AppColors.textPrimary)),
          const SizedBox(height: 12),
          ...matches.map((match) => Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.primaryDark,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: match.won ? AppColors.neonGreen : AppColors.neonRed, width: 2),
              ),
              child: Row(
                children: [
                  Icon(match.won ? Icons.check_circle : Icons.cancel, color: match.won ? AppColors.neonGreen : AppColors.neonRed, size: 32),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(match.game, style: const TextStyle(color: AppColors.cyan, fontWeight: FontWeight.bold)),
                        Text('${match.map} • ${match.durationText}', style: const TextStyle(color: AppColors.textSecondary, fontSize: 12)),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            Expanded(child: Text('K/D/A: ${match.kdaText}', style: const TextStyle(color: AppColors.textPrimary, fontSize: 12))),
                            Expanded(child: Text('Dano: ${match.damage}', style: const TextStyle(color: AppColors.textPrimary, fontSize: 12))),
                          ],
                        ),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(backgroundColor: AppColors.neonYellow),
                    child: const Text('▶️ Ver Replay', style: TextStyle(color: AppColors.backgroundColor, fontSize: 12)),
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
