/// Modelo de Item da Loja para GameLink
/// 
/// Define a estrutura de um item disponível na loja

class ShopItemModel {
  /// ID único do item
  final String id;
  
  /// Nome do item
  final String name;
  
  /// Descrição do item
  final String description;
  
  /// Imagem/ícone do item
  final String image;
  
  /// Preço em créditos
  final int price;
  
  /// Preço em diamantes (moeda premium)
  final int? diamondPrice;
  
  /// Categoria (cosmetic, booster, pet, etc)
  final String category;
  
  /// Raridade (common, uncommon, rare, epic, legendary)
  final String rarity;
  
  /// Descrição dos efeitos/benefícios
  final String effects;
  
  /// Duração em dias (0 = permanente)
  final int duration;
  
  /// Se está em promoção
  final bool isOnSale;
  
  /// Desconto em porcentagem
  final int discountPercent;
  
  /// Número de vendas
  final int salesCount;
  
  /// Classificação (1-5)
  final double rating;
  
  /// Se o usuário já possui
  final bool isOwned;

  const ShopItemModel({
    required this.id,
    required this.name,
    required this.description,
    required this.image,
    required this.price,
    this.diamondPrice,
    required this.category,
    required this.rarity,
    required this.effects,
    required this.duration,
    required this.isOnSale,
    required this.discountPercent,
    required this.salesCount,
    required this.rating,
    required this.isOwned,
  });

  factory ShopItemModel.fromJson(Map<String, dynamic> json) {
    return ShopItemModel(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      image: json['image'] as String,
      price: json['price'] as int,
      diamondPrice: json['diamondPrice'] as int?,
      category: json['category'] as String,
      rarity: json['rarity'] as String,
      effects: json['effects'] as String,
      duration: json['duration'] as int,
      isOnSale: json['isOnSale'] as bool,
      discountPercent: json['discountPercent'] as int,
      salesCount: json['salesCount'] as int,
      rating: (json['rating'] as num).toDouble(),
      isOwned: json['isOwned'] as bool,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'image': image,
      'price': price,
      'diamondPrice': diamondPrice,
      'category': category,
      'rarity': rarity,
      'effects': effects,
      'duration': duration,
      'isOnSale': isOnSale,
      'discountPercent': discountPercent,
      'salesCount': salesCount,
      'rating': rating,
      'isOwned': isOwned,
    };
  }

  ShopItemModel copyWith({
    String? id,
    String? name,
    String? description,
    String? image,
    int? price,
    int? diamondPrice,
    String? category,
    String? rarity,
    String? effects,
    int? duration,
    bool? isOnSale,
    int? discountPercent,
    int? salesCount,
    double? rating,
    bool? isOwned,
  }) {
    return ShopItemModel(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      image: image ?? this.image,
      price: price ?? this.price,
      diamondPrice: diamondPrice ?? this.diamondPrice,
      category: category ?? this.category,
      rarity: rarity ?? this.rarity,
      effects: effects ?? this.effects,
      duration: duration ?? this.duration,
      isOnSale: isOnSale ?? this.isOnSale,
      discountPercent: discountPercent ?? this.discountPercent,
      salesCount: salesCount ?? this.salesCount,
      rating: rating ?? this.rating,
      isOwned: isOwned ?? this.isOwned,
    );
  }

  /// Calcula o preço com desconto
  int get finalPrice {
    if (!isOnSale) return price;
    return (price * (100 - discountPercent) / 100).toInt();
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ShopItemModel &&
          runtimeType == other.runtimeType &&
          id == other.id;

  @override
  int get hashCode => id.hashCode;

  @override
  String toString() => 'ShopItemModel(id: $id, name: $name, price: $price)';
}

/// Modelo de Compra do Usuário
class UserPurchase {
  /// ID da compra
  final String id;
  
  /// ID do item comprado
  final String itemId;
  
  /// Nome do item
  final String itemName;
  
  /// Imagem do item
  final String itemImage;
  
  /// Preço pago
  final int pricePaid;
  
  /// Tipo de moeda (credits, diamonds)
  final String currencyType;
  
  /// Data da compra
  final DateTime purchaseDate;
  
  /// Data de expiração (se aplicável)
  final DateTime? expirationDate;
  
  /// Se está ativo
  final bool isActive;

  const UserPurchase({
    required this.id,
    required this.itemId,
    required this.itemName,
    required this.itemImage,
    required this.pricePaid,
    required this.currencyType,
    required this.purchaseDate,
    this.expirationDate,
    required this.isActive,
  });

  factory UserPurchase.fromJson(Map<String, dynamic> json) {
    return UserPurchase(
      id: json['id'] as String,
      itemId: json['itemId'] as String,
      itemName: json['itemName'] as String,
      itemImage: json['itemImage'] as String,
      pricePaid: json['pricePaid'] as int,
      currencyType: json['currencyType'] as String,
      purchaseDate: DateTime.parse(json['purchaseDate'] as String),
      expirationDate: json['expirationDate'] != null
          ? DateTime.parse(json['expirationDate'] as String)
          : null,
      isActive: json['isActive'] as bool,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'itemId': itemId,
      'itemName': itemName,
      'itemImage': itemImage,
      'pricePaid': pricePaid,
      'currencyType': currencyType,
      'purchaseDate': purchaseDate.toIso8601String(),
      'expirationDate': expirationDate?.toIso8601String(),
      'isActive': isActive,
    };
  }

  UserPurchase copyWith({
    String? id,
    String? itemId,
    String? itemName,
    String? itemImage,
    int? pricePaid,
    String? currencyType,
    DateTime? purchaseDate,
    DateTime? expirationDate,
    bool? isActive,
  }) {
    return UserPurchase(
      id: id ?? this.id,
      itemId: itemId ?? this.itemId,
      itemName: itemName ?? this.itemName,
      itemImage: itemImage ?? this.itemImage,
      pricePaid: pricePaid ?? this.pricePaid,
      currencyType: currencyType ?? this.currencyType,
      purchaseDate: purchaseDate ?? this.purchaseDate,
      expirationDate: expirationDate ?? this.expirationDate,
      isActive: isActive ?? this.isActive,
    );
  }

  /// Verifica se a compra expirou
  bool get isExpired {
    if (expirationDate == null) return false;
    return DateTime.now().isAfter(expirationDate!);
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserPurchase &&
          runtimeType == other.runtimeType &&
          id == other.id;

  @override
  int get hashCode => id.hashCode;

  @override
  String toString() => 'UserPurchase(id: $id, item: $itemName, paid: $pricePaid)';
}
