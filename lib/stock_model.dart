class Stock {
  final String symbol;
  final String companyName;
  final double currentPrice;
  final double percentageChange;

  Stock({required this.symbol, required this.companyName, required this.currentPrice, required this.percentageChange});

  factory Stock.fromJson(Map<String, dynamic> json) {
    final priceData = json['quoteSummary']['result'][0]['price'];
    return Stock(
      symbol: json['quoteSummary']['result'][0]['symbol'],
      companyName: priceData['longName'],
      currentPrice: priceData['regularMarketPrice']['raw'],
      percentageChange: priceData['regularMarketChangePercent']['raw'],
    );
  }
}
