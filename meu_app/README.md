# 🎮 GameLink - Arena Gamer no seu Celular

Um aplicativo mobile revolucionário que conecta gamers, oferecendo desafios, ranking, comunidade e muito mais!

## 📱 Sobre o Projeto

**GameLink** é uma plataforma social para gamers onde você pode:

- 🎮 Participar de desafios e competições
- 🏆 Acompanhar seu ranking e progresso
- 👥 Conectar com amigos e formar clãs
- 💬 Conversar em tempo real
- 🛍️ Acessar a loja de itens e recompensas
- 👤 Personalizar seu perfil

## 🚀 Tecnologias Utilizadas

| Tecnologia | Versão | Descrição |
|---|---|---|
| **Flutter** | 3.x+ | Framework para desenvolvimento mobile |
| **Dart** | 3.11.1+ | Linguagem de programação |
| **shared_preferences** | 2.2.2 | Armazenamento local de dados |
| **http** | 1.2.0 | Requisições HTTP para API |
| **cupertino_icons** | 1.0.8 | Ícones do iOS |

## 📁 Estrutura do Projeto

```
lib/
├── main.dart                    # Arquivo principal da aplicação
├── core/
│   └── app_background.dart      # Widget de background customizado
├── models/
│   ├── user_model.dart          # Modelo de usuário
│   ├── chat_model.dart          # Modelo de chat
│   └── message_model.dart       # Modelo de mensagem
├── screens/
│   ├── login_screen.dart        # Tela de login
│   ├── register_screen.dart     # Tela de registro
│   ├── chat_list_screen.dart    # Lista de chats
│   └── chat_screen.dart         # Tela de chat
└── services/
    └── auth_service.dart        # Serviço de autenticação
```

## 🎯 Funcionalidades Principais

### 1. **Autenticação**
- Login com email e senha
- Registro de novo usuário
- Persistência de sessão com token

### 2. **Home Screen**
- Exibição de jogos recentes
- Progresso diário
- Atividades recentes

### 3. **Ranking**
- Visualização de top 10 jogadores
- Pontuação em tempo real
- Posição do usuário

### 4. **Amigos**
- Lista de amigos conectados
- Adicionar/remover amigos
- Status online

### 5. **Loja**
- Catálogo de itens
- Compra com créditos
- Histórico de compras

### 6. **Perfil**
- Informações do usuário
- Estatísticas pessoais
- Badges e conquistas

### 7. **Chat**
- Mensagens em tempo real
- Lista de conversas
- Notificações de mensagens

## 🔧 Como Configurar o Projeto

### Pré-requisitos

- Flutter SDK 3.x+
- Dart 3.11.1+
- Android Studio ou Xcode
- Git

### Instalação

1. **Clone o repositório:**
```bash
git clone https://github.com/KaiqueFJ21/app-game-link.git
cd app-game-link/meu_app
```

2. **Instale as dependências:**
```bash
flutter pub get
```

3. **Execute o aplicativo:**
```bash
flutter run
```

### Configuração de Ambiente

Crie um arquivo `.env` na raiz do projeto com as seguintes variáveis:

```env
API_BASE_URL=https://api.gamelink.com
API_TIMEOUT=30
DEBUG_MODE=false
```

## 📚 Documentação de Código

### Modelos (Models)

#### UserModel
Representa um usuário da plataforma.

```dart
class UserModel {
  final String id;
  final String username;
  final String email;
  final int level;
  final int points;
  final String avatar;
}
```

#### ChatModel
Representa uma conversa entre usuários.

```dart
class ChatModel {
  final String id;
  final String userId;
  final String otherUserId;
  final List<MessageModel> messages;
  final DateTime lastMessage;
}
```

#### MessageModel
Representa uma mensagem individual.

```dart
class MessageModel {
  final String id;
  final String senderId;
  final String content;
  final DateTime timestamp;
  final bool isRead;
}
```

### Serviços (Services)

#### AuthService
Gerencia autenticação e autorização.

```dart
class AuthService {
  // Login com email e senha
  Future<bool> login(String email, String password);
  
  // Registrar novo usuário
  Future<bool> register(String email, String password, String username);
  
  // Fazer logout
  Future<void> logout();
  
  // Obter token armazenado
  Future<String?> getToken();
}
```

### Telas (Screens)

#### LoginScreen
Tela de autenticação do usuário.

**Funcionalidades:**
- Campo de email
- Campo de senha
- Botão de login
- Link para registro

#### HomeScreen
Tela principal com resumo de atividades.

**Componentes:**
- Seção de jogos recentes
- Barra de progresso diário
- Lista de atividades recentes

#### RankingScreen
Exibição do ranking de jogadores.

**Funcionalidades:**
- Top 10 jogadores
- Pontuação de cada jogador
- Posição do usuário atual

#### ChatScreen
Tela de conversa individual.

**Funcionalidades:**
- Histórico de mensagens
- Campo de entrada de texto
- Envio de mensagens
- Indicador de digitação

## 🧪 Testes

### Executar Testes Unitários

```bash
flutter test
```

### Executar Testes de Integração

```bash
flutter drive --target=test_driver/app.dart
```

### Análise de Código

```bash
flutter analyze
```

## 📊 Análise de Código

O projeto utiliza `flutter_lints` para manter a qualidade do código. Para executar a análise:

```bash
flutter analyze
```

Todas as regras estão configuradas em `analysis_options.yaml`.

## 🚀 Deploy

### Android

```bash
flutter build apk --release
```

### iOS

```bash
flutter build ios --release
```

### Web

```bash
flutter build web --release
```

## 🐛 Troubleshooting

### Problema: Erro de conexão com API

**Solução:** Verifique se a URL da API está correta em `.env` e se o servidor está rodando.

### Problema: Erro ao fazer login

**Solução:** Verifique as credenciais e se o usuário está registrado no sistema.

### Problema: Mensagens não sincronizam

**Solução:** Verifique a conexão de internet e se o serviço de chat está ativo.

## 📝 Convenções de Código

### Nomenclatura

- **Classes:** PascalCase (ex: `UserModel`)
- **Variáveis:** camelCase (ex: `userName`)
- **Constantes:** camelCase (ex: `apiTimeout`)
- **Arquivos:** snake_case (ex: `user_model.dart`)

### Estrutura de Classe

```dart
class ExampleClass {
  // Constantes
  static const String example = 'value';
  
  // Variáveis privadas
  final String _privateVariable;
  
  // Variáveis públicas
  final String publicVariable;
  
  // Construtor
  ExampleClass({
    required this.publicVariable,
    required String privateVariable,
  }) : _privateVariable = privateVariable;
  
  // Métodos
  void method() {
    // Implementação
  }
}
```

## 🤝 Contribuindo

1. Faça um fork do projeto
2. Crie uma branch para sua feature (`git checkout -b feature/AmazingFeature`)
3. Commit suas mudanças (`git commit -m 'Add some AmazingFeature'`)
4. Push para a branch (`git push origin feature/AmazingFeature`)
5. Abra um Pull Request

## 📄 Licença

Este projeto está sob a licença MIT. Veja o arquivo `LICENSE` para mais detalhes.

## 👥 Autores

- **Kaique Ferreira** - Desenvolvedor Principal
- **Manus AI** - Assistência em desenvolvimento e revisão

## 📞 Suporte

Para suporte, envie um email para support@gamelink.com ou abra uma issue no GitHub.

## 🎉 Agradecimentos

Agradecemos a todos os contribuidores e à comunidade Flutter por o suporte contínuo!

---

**Última atualização:** 06/04/2026
**Versão:** 1.0.0
**Status:** Em Desenvolvimento ✅
