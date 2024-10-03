import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'stock_view_model.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => StockViewModel(),
    child: StockSearchApp(),
  ));
}

class StockSearchApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stock Search App',
      home: StockSearchScreen(),
    );
  }
}

class StockSearchScreen extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final stockViewModel = Provider.of<StockViewModel>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Stock Search')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: 'Enter Stock Symbol (e.g., AAPL)',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                stockViewModel.searchStock(_controller.text.toUpperCase());
              },
              child: Text('Search'),
            ),
            SizedBox(height: 20),
            stockViewModel.isLoading
                ? CircularProgressIndicator()
                : stockViewModel.errorMessage != null
                ? Text(stockViewModel.errorMessage!)
                : stockViewModel.stock != null
                ? Column(
              children: [
                Text('Company: ${stockViewModel.stock!.companyName}'),
                Text('Price: \$${stockViewModel.stock!.currentPrice}'),
                Text('Change: ${stockViewModel.stock!.percentageChange}%'),
              ],
            )
                : SizedBox(),
          ],
        ),
      ),
    );
  }
}
