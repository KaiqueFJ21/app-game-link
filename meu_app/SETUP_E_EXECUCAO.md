# GameLink App - Guia de Setup e Execução

## 📋 Pré-requisitos

- Flutter SDK instalado (versão 3.0+)
- Dart SDK (incluído no Flutter)
- Android Studio ou Xcode (para emulador)
- Git

## 🚀 Como Executar o App

### 1. **Clonar o Repositório**
```bash
git clone https://github.com/KaiqueFJ21/app-game-link.git
cd app-game-link/meu_app
```

### 2. **Instalar Dependências**
```bash
flutter pub get
```

### 3. **Executar o App**

#### No Emulador Android:
```bash
flutter run
```

#### No Emulador iOS:
```bash
flutter run -d macos
```

#### Na Web:
```bash
flutter run -d web
```

#### Em um Dispositivo Real:
```bash
flutter run
```

## 🎮 Como Usar o App

### Login
- **Email**: Qualquer email válido (ex: `teste@gamelink.com`)
- **Senha**: Qualquer senha com 6+ caracteres

### Após o Login
Você terá acesso a 8 páginas principais:

1. **👤 Perfil** - Informações do usuário, títulos, conquistas
2. **📊 Dashboard** - Histórico de partidas com K/D/A e dano
3. **👥 Amigos** - Lista de amigos com status online/offline
4. **⚔️ Desafios** - Desafios ativos com recompensas
5. **🏆 Ranking** - Ranking global de jogadores
6. **🌐 Comunidade** - Chat e comunidade (em desenvolvimento)
7. **🛍️ Loja** - Itens para comprar com créditos
8. **🎯 Clãs** - Clãs disponíveis para entrar

## 🔧 Estrutura do Projeto

```
lib/
├── constants/
│   └── colors.dart              # Paleta de cores do site
├── models/
│   ├── user_model.dart          # Modelo de usuário
│   ├── match_model.dart         # Modelo de partida
│   ├── achievement_model.dart   # Modelo de conquista
│   ├── title_model.dart         # Modelo de título
│   ├── friend_model.dart        # Modelo de amigo
│   ├── challenge_model.dart     # Modelo de desafio
│   ├── clan_model.dart          # Modelo de clã
│   ├── shop_item_model.dart     # Modelo de item da loja
│   └── ranking_model.dart       # Modelo de ranking
├── services/
│   ├── auth_service.dart        # Serviço de autenticação fake
│   └── data_service.dart        # Serviço de dados fake
├── screens/
│   ├── main.dart                # App principal
│   ├── login_screen.dart        # Tela de login
│   ├── register_screen.dart     # Tela de registro
│   ├── home_screen.dart         # Tela principal com menu
│   ├── profile_screen.dart      # Tela de perfil
│   ├── dashboard_screen.dart    # Tela de dashboard
│   ├── friends_screen.dart      # Tela de amigos
│   ├── challenges_screen.dart   # Tela de desafios
│   ├── ranking_screen.dart      # Tela de ranking
│   ├── community_screen.dart    # Tela de comunidade
│   ├── shop_screen.dart         # Tela de loja
│   └── clans_screen.dart        # Tela de clãs
└── main.dart                    # Ponto de entrada do app
```

## 🎨 Design e Cores

O app utiliza as mesmas cores do site GameLink:

- **Fundo**: Preto profundo (#0a0a0a)
- **Gradiente**: Rosa (#FF1493) → Roxo (#8B00FF)
- **Destaque**: Cyan (#00BFFF), Verde Neon (#00FF88), Amarelo (#FFFF00)
- **Texto**: Branco e Cinza claro

## 📱 Responsividade

O app é totalmente responsivo:
- **Mobile**: Menu em abas na parte inferior
- **Tablet/Desktop**: Menu lateral com navegação

## 🔐 Autenticação

A autenticação é **fake** (simulada) para fins de desenvolvimento:
- Qualquer email válido é aceito
- Qualquer senha com 6+ caracteres é aceita
- Os dados são armazenados localmente com `SharedPreferences`

## 📊 Dados Fake

Todos os dados são simulados e incluem:
- 4 partidas com diferentes jogos
- 6 conquistas com progresso
- 3 títulos com raridade
- 3 amigos com status online/offline
- 2 desafios ativos
- 2 clãs disponíveis
- 3 itens na loja
- 5 jogadores no ranking

## 🐛 Troubleshooting

### Erro: "flutter: command not found"
```bash
# Adicione Flutter ao PATH
export PATH="$PATH:~/flutter/bin"
```

### Erro: "Dependências não encontradas"
```bash
flutter pub get
flutter pub upgrade
```

### Erro: "Emulador não encontrado"
```bash
flutter emulators
flutter emulators launch <emulator_id>
```

## 📝 Próximos Passos

1. Integrar com backend real (Firebase ou API)
2. Adicionar notificações push
3. Implementar chat em tempo real
4. Adicionar upload de imagens
5. Implementar multiplayer

## 📞 Suporte

Para dúvidas ou problemas, consulte a [documentação do Flutter](https://flutter.dev/docs)

---

**Versão**: 1.0.0  
**Última atualização**: Abril 2026  
**Status**: ✅ Pronto para uso
