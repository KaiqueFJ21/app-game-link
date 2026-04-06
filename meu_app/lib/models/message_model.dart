/// Modelo de Mensagem para GameLink
/// 
/// Este arquivo define a estrutura de dados de uma mensagem individual
/// dentro de uma conversa entre usuários.

class MessageModel {
  /// ID único da mensagem no sistema
  final String id;
  
  /// ID do usuário que enviou a mensagem
  final String senderId;
  
  /// ID do usuário que recebeu a mensagem
  final String recipientId;
  
  /// Conteúdo de texto da mensagem
  final String content;
  
  /// Timestamp de quando a mensagem foi enviada
  final DateTime timestamp;
  
  /// Flag indicando se a mensagem foi lida pelo destinatário
  final bool isRead;
  
  /// Construtor da classe MessageModel
  const MessageModel({
    required this.id,
    required this.senderId,
    required this.recipientId,
    required this.content,
    required this.timestamp,
    required this.isRead,
  });

  /// Cria uma instância de MessageModel a partir de um JSON
  /// 
  /// Útil para desserializar dados recebidos da API
  /// 
  /// Exemplo:
  /// ```dart
  /// final message = MessageModel.fromJson(jsonData);
  /// ```
  factory MessageModel.fromJson(Map<String, dynamic> json) {
    return MessageModel(
      id: json['id'] as String,
      senderId: json['senderId'] as String,
      recipientId: json['recipientId'] as String,
      content: json['content'] as String,
      timestamp: DateTime.parse(json['timestamp'] as String),
      isRead: json['isRead'] as bool,
    );
  }

  /// Converte a instância de MessageModel para JSON
  /// 
  /// Útil para serializar dados para enviar à API
  /// 
  /// Exemplo:
  /// ```dart
  /// final json = message.toJson();
  /// ```
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'senderId': senderId,
      'recipientId': recipientId,
      'content': content,
      'timestamp': timestamp.toIso8601String(),
      'isRead': isRead,
    };
  }

  /// Cria uma cópia do MessageModel com alguns campos modificados
  /// 
  /// Útil para atualizar dados sem criar uma nova instância completa
  /// 
  /// Exemplo:
  /// ```dart
  /// final updatedMessage = message.copyWith(isRead: true);
  /// ```
  MessageModel copyWith({
    String? id,
    String? senderId,
    String? recipientId,
    String? content,
    DateTime? timestamp,
    bool? isRead,
  }) {
    return MessageModel(
      id: id ?? this.id,
      senderId: senderId ?? this.senderId,
      recipientId: recipientId ?? this.recipientId,
      content: content ?? this.content,
      timestamp: timestamp ?? this.timestamp,
      isRead: isRead ?? this.isRead,
    );
  }

  /// Compara dois MessageModel pela igualdade de todos os campos
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MessageModel &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          senderId == other.senderId &&
          recipientId == other.recipientId &&
          content == other.content &&
          timestamp == other.timestamp &&
          isRead == other.isRead;

  /// Gera um hash code para o MessageModel
  @override
  int get hashCode =>
      id.hashCode ^
      senderId.hashCode ^
      recipientId.hashCode ^
      content.hashCode ^
      timestamp.hashCode ^
      isRead.hashCode;

  /// Retorna uma representação em string do MessageModel
  @override
  String toString() {
    return 'MessageModel(id: $id, from: $senderId, to: $recipientId, timestamp: $timestamp)';
  }
}

/// Classe legada mantida para compatibilidade com código antigo
/// 
/// DEPRECATED: Use [MessageModel] em vez disso
/// Esta classe será removida em versões futuras
@Deprecated('Use MessageModel instead')
class Message {
  /// Conteúdo de texto da mensagem
  final String texto;
  
  /// Flag indicando se a mensagem foi enviada pelo usuário atual
  final bool isMe;
  
  /// Horário em que a mensagem foi enviada
  final DateTime horario;

  /// Construtor da classe Message (legada)
  Message({
    required this.texto,
    required this.isMe,
    required this.horario,
  });
}
