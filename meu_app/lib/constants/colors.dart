import 'package:flutter/material.dart';

/// Paleta de cores do GameLink - Replicando o site
class AppColors {
  // Cores Principais
  static const Color backgroundColor = Color(0xFF0a0a0a); // Preto profundo
  static const Color primaryDark = Color(0xFF1a1a2e); // Fundo secundário
  static const Color surfaceDark = Color(0xFF16213e); // Cards

  // Gradiente (Rosa → Roxo)
  static const Color gradientPink = Color(0xFFFF1493); // Rosa/Magenta
  static const Color gradientPurple = Color(0xFF8B00FF); // Roxo

  // Destaques
  static const Color cyan = Color(0xFF00BFFF); // Cyan claro
  static const Color neonGreen = Color(0xFF00FF88); // Verde neon
  static const Color neonYellow = Color(0xFFFFFF00); // Amarelo neon
  static const Color neonRed = Color(0xFFFF1744); // Vermelho

  // Texto
  static const Color textPrimary = Color(0xFFFFFFFF); // Branco
  static const Color textSecondary = Color(0xFFCCCCCC); // Cinza claro
  static const Color textMuted = Color(0xFF999999); // Cinza médio

  // Gradientes
  static const LinearGradient primaryGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [gradientPink, gradientPurple],
  );

  static const LinearGradient darkGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFF1a1a2e), Color(0xFF16213e)],
  );

  // Cores por raridade
  static const Color rarityCommon = Color(0xFF888888); // Cinza
  static const Color rarityRare = Color(0xFF00BFFF); // Cyan
  static const Color rarityEpic = Color(0xFF8B00FF); // Roxo
  static const Color rarityLegendary = Color(0xFFFFD700); // Ouro

  // Status
  static const Color success = Color(0xFF00FF88); // Verde
  static const Color error = Color(0xFFFF1744); // Vermelho
  static const Color warning = Color(0xFFFFFF00); // Amarelo
  static const Color info = Color(0xFF00BFFF); // Cyan
}
