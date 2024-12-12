class StockListItemModel {
  final String code;
  final double price;
  final double change;
  final double changePercent;
  final double total;

  StockListItemModel({
    required this.code,
    required this.price,
    required this.change,
    required this.changePercent,
    required this.total,
  });

  factory StockListItemModel.fromJson(Map<String, dynamic> json) {
    return StockListItemModel(
      code: json['code'],
      price: json['price'],
      change: json['change'],
      changePercent: json['changePercent'],
      total: json['total'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'code': code,
      'price': price,
      'change': change,
      'changePercent': changePercent,
      'total': total,
    };
  }
}
