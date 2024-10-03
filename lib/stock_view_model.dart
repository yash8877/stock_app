import 'package:flutter/material.dart';
import 'stock_api.dart';
import 'stock_model.dart';

class StockViewModel extends ChangeNotifier {
  StockApi _stockApi = StockApi();
  Stock? stock;
  String? errorMessage;
  bool isLoading = false;

  Future<void> searchStock(String symbol) async {
    isLoading = true;
    errorMessage = null;
    notifyListeners();

    try {
      final data = await _stockApi.fetchStockData(symbol);
      stock = Stock.fromJson(data);
    } catch (e) {
      errorMessage = e.toString();
    }

    isLoading = false;
    notifyListeners();
  }
}
