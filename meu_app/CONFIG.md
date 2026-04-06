# ⚙️ Configuração do Projeto GameLink

## 📱 Informações do Projeto

| Campo | Valor |
|-------|-------|
| **Nome** | GameLink |
| **Descrição** | Arena Gamer no seu Celular |
| **Versão** | 1.0.0 |
| **Flutter SDK** | 3.x+ |
| **Dart SDK** | 3.x+ |
| **Plataformas** | iOS, Android, Web |

---

## 🎨 Configuração de Tema

### Cores Principais

```dart
// Cores Neon
const Color PRIMARY_CYAN = Color(0xFF00D9FF);      // Cyan brilhante
const Color PRIMARY_GREEN = Color(0xFF00FF88);     // Verde neon
const Color BACKGROUND = Color(0xFF0a0e27);        // Fundo escuro
const Color SURFACE = Color(0xFF1a1a3e);           // Cards e componentes
const Color ERROR = Color(0xFFFF1744);             // Erros
```

### Tipografia

```dart
// Fontes
- Títulos: Bold, 24-32px
- Subtítulos: SemiBold, 16-20px
- Corpo: Regular, 12-16px
- Labels: Regular, 12-14px
```

---

## 📦 Dependências Principais

### pubspec.yaml

```yaml
dependencies:
  flutter:
    sdk: flutter
  
  # Armazenamento Local
  shared_preferences: ^2.2.2
  
  # HTTP
  http: ^1.2.0
  
  # Ícones
  cupertino_icons: ^1.0.2
  material_design_icons_flutter: ^7.0.7296

dev_dependencies:
  flutter_test:
    sdk: flutter
  
  flutter_lints: ^3.0.0
```

---

## 🔐 Autenticação

### Sistema Fake

O app usa um sistema de autenticação fake para demonstração:

```dart
// Credenciais de Teste
Email: qualquer email válido (ex: teste@gamelink.com)
Senha: qualquer senha com 6+ caracteres (ex: senha123)
```

### Persistência

- **Local**: SharedPreferences
- **Chaves**:
  - `gamelink_user` - Dados do usuário
  - `gamelink_token` - Token de autenticação
  - `gamelink_is_logged_in` - Status de login

---

## 🗂️ Estrutura de Pastas

```
lib/
├── core/
│   └── app_background.dart          # Widget de background
├── models/
│   ├── badge_model.dart             # Modelo de badges
│   ├── challenge_model.dart         # Modelo de desafios
│   ├── chat_model.dart              # Modelo de chats
│   ├── clan_model.dart              # Modelo de clãs
│   ├── friend_model.dart            # Modelo de amigos
│   ├── message_model.dart           # Modelo de mensagens
│   ├── notification_model.dart      # Modelo de notificações
│   ├── ranking_model.dart           # Modelo de ranking
│   ├── shop_model.dart              # Modelo de loja
│   └── user_model.dart              # Modelo de usuário
├── screens/
│   ├── chat_list_screen.dart        # Lista de chats
│   ├── chat_screen.dart             # Tela de chat
│   ├── home_screen.dart             # Tela home
│   ├── login_screen.dart            # Tela de login
│   └── register_screen.dart         # Tela de registro
├── services/
│   ├── auth_service.dart            # Serviço de autenticação
│   └── data_service.dart            # Serviço de dados
└── main.dart                        # Arquivo principal
```

---

## 🚀 Como Executar

### Instalação de Dependências

```bash
cd meu_app
flutter pub get
```

### Executar em Desenvolvimento

```bash
# Emulador Android
flutter run

# Dispositivo iOS
flutter run -d ios

# Web
flutter run -d chrome

# Release
flutter run --release
```

### Build para Produção

```bash
# Android APK
flutter build apk --release

# Android App Bundle
flutter build appbundle --release

# iOS
flutter build ios --release

# Web
flutter build web --release
```

---

## 🧪 Testes

### Executar Testes

```bash
flutter test
```

### Testes Específicos

```bash
flutter test test/services/auth_service_test.dart
```

---

## 📊 Dados Fake

O `DataService` fornece dados simulados para:

### Usuários
- 1 usuário atual com 17 propriedades
- Estatísticas completas
- Avatar dinâmico

### Amigos
- 3 amigos com estatísticas
- Status online/offline
- Histórico de mensagens

### Ranking
- Top 3 jogadores global
- Posições dinâmicas
- Pontos de ranking

### Desafios
- 2 desafios ativos
- Recompensas em créditos
- Requisitos de participação

### Badges
- 3 badges diferentes
- Raridades variadas
- Requisitos de desbloqueio

### Loja
- 3 itens disponíveis
- Preços em créditos
- Descontos aplicáveis

### Notificações
- 3 notificações de exemplo
- Tipos diferentes
- Prioridades variadas

---

## 🔄 Fluxo de Dados

```
LoginScreen
    ↓
AuthService.login()
    ↓
SharedPreferences.setItem()
    ↓
HomeScreen
    ↓
DataService.getFake*()
    ↓
Exibir dados nas telas
```

---

## 🎯 Funcionalidades por Fase

### Fase 1: MVP (Atual)
- ✅ Login/Registro
- ✅ Dashboard com estatísticas
- ✅ Navegação por abas
- ✅ Modelos de dados

### Fase 2: Expansão
- ⏳ Chat com mensagens
- ⏳ Ranking detalhado
- ⏳ Loja funcional
- ⏳ Perfil do usuário

### Fase 3: Comunidade
- ⏳ Amigos
- ⏳ Clãs
- ⏳ Desafios
- ⏳ Notificações

### Fase 4: Backend
- ⏳ Integração com API
- ⏳ Banco de dados real
- ⏳ Autenticação real
- ⏳ Multiplayer

---

## 🐛 Debug

### Ativar Debug

```bash
flutter run -v
```

### Logs

```dart
print('Debug message');
debugPrint('Debug message');
```

### DevTools

```bash
flutter pub global activate devtools
devtools
```

---

## 📝 Convenções de Código

### Nomenclatura
- **Classes**: PascalCase (ex: `LoginScreen`)
- **Funções**: camelCase (ex: `handleLogin()`)
- **Variáveis**: camelCase (ex: `isLoading`)
- **Constantes**: UPPER_SNAKE_CASE (ex: `PRIMARY_COLOR`)

### Formatação
- Usar `flutter format` para formatar código
- Usar `flutter analyze` para verificar erros
- Máximo 80 caracteres por linha

### Documentação
- Adicionar comentários em funções complexas
- Usar `///` para documentação de classes
- Manter README.md atualizado

---

## 🔗 Links Úteis

- [Flutter Docs](https://flutter.dev/docs)
- [Dart Docs](https://dart.dev/guides)
- [Material Design 3](https://m3.material.io/)
- [Pub.dev](https://pub.dev/)

---

## 📄 Versionamento

| Versão | Data | Mudanças |
|--------|------|----------|
| 1.0.0 | Abr 2026 | Versão inicial com MVP |
| 1.1.0 | TBD | Chat e Ranking |
| 1.2.0 | TBD | Loja e Perfil |
| 2.0.0 | TBD | Backend e API |

---

**Última atualização**: Abril de 2026
**Mantido por**: Equipe de Desenvolvimento
