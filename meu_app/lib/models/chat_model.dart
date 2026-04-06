/// Modelo de Chat para GameLink
/// 
/// Define a estrutura de uma conversa entre dois usuários

class ChatModel {
  /// ID único da conversa
  final String id;
  
  /// ID do usuário que iniciou a conversa
  final String userId;
  
  /// ID do outro usuário na conversa
  final String otherUserId;
  
  /// Nome do outro usuário
  final String otherUserName;
  
  /// Avatar do outro usuário
  final String otherUserAvatar;
  
  /// Última mensagem da conversa
  final String lastMessage;
  
  /// Timestamp da última mensagem
  final DateTime lastMessageTime;
  
  /// Número de mensagens não lidas
  final int unreadCount;
  
  /// Se o outro usuário está online
  final bool isOnline;
  
  /// Lista de mensagens na conversa
  final List<Message> messages;

  const ChatModel({
    required this.id,
    required this.userId,
    required this.otherUserId,
    required this.otherUserName,
    required this.otherUserAvatar,
    required this.lastMessage,
    required this.lastMessageTime,
    required this.unreadCount,
    required this.isOnline,
    required this.messages,
  });

  factory ChatModel.fromJson(Map<String, dynamic> json) {
    return ChatModel(
      id: json['id'] as String,
      userId: json['userId'] as String,
      otherUserId: json['otherUserId'] as String,
      otherUserName: json['otherUserName'] as String,
      otherUserAvatar: json['otherUserAvatar'] as String,
      lastMessage: json['lastMessage'] as String,
      lastMessageTime: DateTime.parse(json['lastMessageTime'] as String),
      unreadCount: json['unreadCount'] as int,
      isOnline: json['isOnline'] as bool,
      messages: (json['messages'] as List<dynamic>?)
              ?.map((m) => Message.fromJson(m as Map<String, dynamic>))
              .toList() ??
          [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'otherUserId': otherUserId,
      'otherUserName': otherUserName,
      'otherUserAvatar': otherUserAvatar,
      'lastMessage': lastMessage,
      'lastMessageTime': lastMessageTime.toIso8601String(),
      'unreadCount': unreadCount,
      'isOnline': isOnline,
      'messages': messages.map((m) => m.toJson()).toList(),
    };
  }

  ChatModel copyWith({
    String? id,
    String? userId,
    String? otherUserId,
    String? otherUserName,
    String? otherUserAvatar,
    String? lastMessage,
    DateTime? lastMessageTime,
    int? unreadCount,
    bool? isOnline,
    List<Message>? messages,
  }) {
    return ChatModel(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      otherUserId: otherUserId ?? this.otherUserId,
      otherUserName: otherUserName ?? this.otherUserName,
      otherUserAvatar: otherUserAvatar ?? this.otherUserAvatar,
      lastMessage: lastMessage ?? this.lastMessage,
      lastMessageTime: lastMessageTime ?? this.lastMessageTime,
      unreadCount: unreadCount ?? this.unreadCount,
      isOnline: isOnline ?? this.isOnline,
      messages: messages ?? this.messages,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ChatModel &&
          runtimeType == other.runtimeType &&
          id == other.id;

  @override
  int get hashCode => id.hashCode;

  @override
  String toString() => 'ChatModel(id: $id, with: $otherUserName)';
}

/// Modelo de Mensagem para GameLink
/// 
/// Representa uma mensagem individual em uma conversa
class Message {
  /// ID único da mensagem
  final String id;
  
  /// ID do usuário que enviou
  final String senderId;
  
  /// ID do usuário que recebeu
  final String recipientId;
  
  /// Conteúdo da mensagem
  final String texto;
  
  /// Timestamp da mensagem
  final DateTime horario;
  
  /// Se a mensagem foi enviada pelo usuário atual
  final bool isMe;
  
  /// Se a mensagem foi lida
  final bool isRead;
  
  /// Tipo de mensagem (text, image, emoji, etc)
  final String messageType;
  
  /// Reações à mensagem (emoji -> count)
  final Map<String, int> reactions;

  const Message({
    required this.id,
    required this.senderId,
    required this.recipientId,
    required this.texto,
    required this.horario,
    required this.isMe,
    this.isRead = false,
    this.messageType = 'text',
    this.reactions = const {},
  });

  factory Message.fromJson(Map<String, dynamic> json) {
    return Message(
      id: json['id'] as String,
      senderId: json['senderId'] as String,
      recipientId: json['recipientId'] as String,
      texto: json['texto'] as String,
      horario: DateTime.parse(json['horario'] as String),
      isMe: json['isMe'] as bool,
      isRead: json['isRead'] as bool? ?? false,
      messageType: json['messageType'] as String? ?? 'text',
      reactions: Map<String, int>.from(
        json['reactions'] as Map<String, dynamic>? ?? {},
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'senderId': senderId,
      'recipientId': recipientId,
      'texto': texto,
      'horario': horario.toIso8601String(),
      'isMe': isMe,
      'isRead': isRead,
      'messageType': messageType,
      'reactions': reactions,
    };
  }

  Message copyWith({
    String? id,
    String? senderId,
    String? recipientId,
    String? texto,
    DateTime? horario,
    bool? isMe,
    bool? isRead,
    String? messageType,
    Map<String, int>? reactions,
  }) {
    return Message(
      id: id ?? this.id,
      senderId: senderId ?? this.senderId,
      recipientId: recipientId ?? this.recipientId,
      texto: texto ?? this.texto,
      horario: horario ?? this.horario,
      isMe: isMe ?? this.isMe,
      isRead: isRead ?? this.isRead,
      messageType: messageType ?? this.messageType,
      reactions: reactions ?? this.reactions,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Message &&
          runtimeType == other.runtimeType &&
          id == other.id;

  @override
  int get hashCode => id.hashCode;

  @override
  String toString() =>
      'Message(id: $id, from: $senderId, texto: ${texto.substring(0, 20)}...)';
}
