# 📚 Guia de Desenvolvimento - GameLink

Este documento fornece instruções completas para desenvolvedores que desejam contribuir ao projeto GameLink.

## 📋 Índice

1. [Configuração do Ambiente](#configuração-do-ambiente)
2. [Estrutura do Projeto](#estrutura-do-projeto)
3. [Convenções de Código](#convenções-de-código)
4. [Como Adicionar Novas Funcionalidades](#como-adicionar-novas-funcionalidades)
5. [Testes](#testes)
6. [Deploy](#deploy)
7. [Troubleshooting](#troubleshooting)

---

## 🔧 Configuração do Ambiente

### Pré-requisitos

- **Flutter SDK**: 3.x ou superior
- **Dart SDK**: 3.11.1 ou superior
- **Git**: Última versão
- **Android Studio** ou **Xcode** (para emuladores)
- **Visual Studio Code** ou **Android Studio** (IDE recomendada)

### Instalação do Flutter

1. **Baixe o Flutter SDK:**
   - Acesse https://flutter.dev/docs/get-started/install
   - Selecione seu sistema operacional
   - Siga as instruções de instalação

2. **Configure as variáveis de ambiente:**
   ```bash
   export PATH="$PATH:/path/to/flutter/bin"
   ```

3. **Verifique a instalação:**
   ```bash
   flutter doctor
   ```

### Configuração do Projeto

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

---

## 📁 Estrutura do Projeto

```
lib/
├── main.dart                    # Ponto de entrada da aplicação
├── core/                        # Funcionalidades core
│   └── app_background.dart      # Widget de background customizado
├── models/                      # Modelos de dados
│   ├── user_model.dart          # Modelo de usuário
│   ├── chat_model.dart          # Modelo de chat
│   └── message_model.dart       # Modelo de mensagem
├── screens/                     # Telas da aplicação
│   ├── login_screen.dart        # Tela de login
│   ├── register_screen.dart     # Tela de registro
│   ├── chat_list_screen.dart    # Lista de chats
│   └── chat_screen.dart         # Tela de chat individual
├── services/                    # Serviços e lógica de negócio
│   └── auth_service.dart        # Serviço de autenticação
└── widgets/                     # Widgets reutilizáveis (a criar)
    └── (componentes customizados)
```

### Quando Criar Novos Diretórios

- **models/**: Para novos modelos de dados
- **screens/**: Para novas telas/páginas
- **services/**: Para lógica de negócio e APIs
- **widgets/**: Para componentes reutilizáveis
- **utils/**: Para funções utilitárias

---

## 📝 Convenções de Código

### Nomenclatura

| Tipo | Convenção | Exemplo |
|------|-----------|---------|
| Classes | PascalCase | `UserModel`, `LoginScreen` |
| Variáveis | camelCase | `userName`, `isOnline` |
| Constantes | camelCase | `apiTimeout`, `maxRetries` |
| Arquivos | snake_case | `user_model.dart`, `login_screen.dart` |
| Métodos | camelCase | `getUserData()`, `validateEmail()` |

### Estrutura de Classe

```dart
/// Documentação da classe
/// Descreva o propósito e uso
class ExampleClass {
  // ========== CONSTANTES ==========
  static const String example = 'value';
  static const int maxRetries = 3;

  // ========== VARIÁVEIS PRIVADAS ==========
  final String _privateVariable;
  late String _lazyVariable;

  // ========== VARIÁVEIS PÚBLICAS ==========
  final String publicVariable;
  final int count;

  // ========== CONSTRUTOR ==========
  /// Construtor da classe
  /// 
  /// Parâmetros:
  /// - [publicVariable]: Descrição do parâmetro
  /// - [privateVariable]: Descrição do parâmetro
  const ExampleClass({
    required this.publicVariable,
    required String privateVariable,
  }) : _privateVariable = privateVariable;

  // ========== MÉTODOS FACTORY ==========
  /// Cria instância a partir de JSON
  factory ExampleClass.fromJson(Map<String, dynamic> json) {
    return ExampleClass(
      publicVariable: json['publicVariable'],
      privateVariable: json['privateVariable'],
    );
  }

  // ========== MÉTODOS PÚBLICOS ==========
  /// Descrição do método
  /// 
  /// Retorna: Descrição do retorno
  String method() {
    return 'resultado';
  }

  /// Converte para JSON
  Map<String, dynamic> toJson() {
    return {
      'publicVariable': publicVariable,
      'privateVariable': _privateVariable,
    };
  }

  // ========== MÉTODOS PRIVADOS ==========
  /// Método privado para processamento interno
  String _privateMethod() {
    return 'resultado privado';
  }

  // ========== OVERRIDE ==========
  @override
  String toString() => 'ExampleClass($publicVariable)';

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ExampleClass &&
          runtimeType == other.runtimeType &&
          publicVariable == other.publicVariable;

  @override
  int get hashCode => publicVariable.hashCode;
}
```

### Documentação de Código

Use comentários de documentação (///) para documentar:

```dart
/// Descrição breve da classe/método
/// 
/// Descrição mais detalhada se necessário
/// 
/// Exemplo:
/// ```dart
/// final result = method(param);
/// ```
/// 
/// Parâmetros:
/// - [param1]: Descrição do parâmetro 1
/// - [param2]: Descrição do parâmetro 2
/// 
/// Retorna: Descrição do retorno
/// 
/// Lança: [Exception] se algo der errado
void method(String param1, int param2) {
  // Implementação
}
```

---

## ✨ Como Adicionar Novas Funcionalidades

### 1. Adicionar um Novo Modelo

**Arquivo:** `lib/models/novo_model.dart`

```dart
/// Modelo de Novo Item
class NovoModel {
  final String id;
  final String nome;
  
  const NovoModel({
    required this.id,
    required this.nome,
  });

  factory NovoModel.fromJson(Map<String, dynamic> json) {
    return NovoModel(
      id: json['id'],
      nome: json['nome'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nome': nome,
    };
  }
}
```

### 2. Adicionar um Novo Serviço

**Arquivo:** `lib/services/novo_service.dart`

```dart
/// Serviço para gerenciar Novo Item
class NovoService {
  /// Obter todos os itens
  Future<List<NovoModel>> getAll() async {
    try {
      // Implementação
      return [];
    } catch (e) {
      throw Exception('Erro ao obter itens: $e');
    }
  }

  /// Criar novo item
  Future<NovoModel> create(NovoModel item) async {
    try {
      // Implementação
      return item;
    } catch (e) {
      throw Exception('Erro ao criar item: $e');
    }
  }
}
```

### 3. Adicionar uma Nova Tela

**Arquivo:** `lib/screens/novo_screen.dart`

```dart
import 'package:flutter/material.dart';

/// Tela de Novo Item
class NovoScreen extends StatefulWidget {
  const NovoScreen({super.key});

  @override
  State<NovoScreen> createState() => _NovoScreenState();
}

class _NovoScreenState extends State<NovoScreen> {
  @override
  void initState() {
    super.initState();
    // Inicialização
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Novo Item'),
      ),
      body: Center(
        child: Text('Conteúdo da tela'),
      ),
    );
  }
}
```

### 4. Integrar a Nova Tela

**Arquivo:** `lib/main.dart`

```dart
// Adicione à lista de páginas em MainScreen
final List<Widget> paginas = [
  const HomeScreen(),
  const NovoScreen(),  // ← Nova tela
  // ... outras telas
];
```

---

## 🧪 Testes

### Estrutura de Testes

```
test/
├── models/
│   └── user_model_test.dart
├── services/
│   └── auth_service_test.dart
└── screens/
    └── login_screen_test.dart
```

### Exemplo de Teste Unitário

**Arquivo:** `test/models/user_model_test.dart`

```dart
import 'package:flutter_test/flutter_test.dart';
import 'package:meu_app/models/user_model.dart';

void main() {
  group('UserModel', () {
    test('fromJson deve criar instância corretamente', () {
      final json = {
        'id': '1',
        'username': 'testuser',
        'email': 'test@example.com',
        'level': 10,
        'points': 1000,
        // ... outros campos
      };

      final user = UserModel.fromJson(json);

      expect(user.id, '1');
      expect(user.username, 'testuser');
      expect(user.level, 10);
    });

    test('toJson deve converter corretamente', () {
      final user = UserModel(
        id: '1',
        username: 'testuser',
        email: 'test@example.com',
        // ... outros campos
      );

      final json = user.toJson();

      expect(json['id'], '1');
      expect(json['username'], 'testuser');
    });
  });
}
```

### Executar Testes

```bash
# Executar todos os testes
flutter test

# Executar testes com cobertura
flutter test --coverage

# Executar teste específico
flutter test test/models/user_model_test.dart
```

---

## 🚀 Deploy

### Android APK

```bash
# Build APK de release
flutter build apk --release

# Arquivo gerado em: build/app/outputs/flutter-apk/app-release.apk
```

### iOS App

```bash
# Build iOS de release
flutter build ios --release

# Abrir Xcode para finalizar o build
open ios/Runner.xcworkspace
```

### Web

```bash
# Build web
flutter build web --release

# Arquivo gerado em: build/web/
```

---

## 🐛 Troubleshooting

### Problema: "Flutter command not found"

**Solução:** Adicione Flutter ao PATH:
```bash
export PATH="$PATH:/path/to/flutter/bin"
```

### Problema: "Gradle build failed"

**Solução:** Limpe o build:
```bash
flutter clean
flutter pub get
flutter run
```

### Problema: "Version conflict"

**Solução:** Atualize as dependências:
```bash
flutter pub upgrade
```

### Problema: "Device not found"

**Solução:** Liste dispositivos disponíveis:
```bash
flutter devices

# Se nenhum dispositivo aparecer, crie um emulador:
flutter emulators --create --name pixel_4
flutter emulators --launch pixel_4
```

---

## 📞 Suporte

Para dúvidas ou problemas, entre em contato:
- **Email:** support@gamelink.com
- **GitHub Issues:** https://github.com/KaiqueFJ21/app-game-link/issues
- **Discord:** [Link do servidor]

---

**Última atualização:** 06/04/2026
**Versão:** 1.0.0
