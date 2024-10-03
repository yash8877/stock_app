import 'dart:convert';
import 'package:http/http.dart' as http;

class StockApi {
  final String baseUrl = 'https://query2.finance.yahoo.com/v10/finance/quoteSummary';

  Future<Map<String, dynamic>> fetchStockData(String symbol) async {
    final response = await http.get(Uri.parse('$baseUrl/$symbol?modules=price'));

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load stock data');
    }
  }
}
