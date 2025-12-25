import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/crypto_list/widgets/widgets.dart';


class CryptoListScreen extends StatefulWidget {
  const CryptoListScreen({super.key});

  @override
  State<CryptoListScreen> createState() => _CryptoListScreenState();
}

class _CryptoListScreenState extends State<CryptoListScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(title: Text('CryptocurrenciesList'), centerTitle: true),
      body: ListView.separated(
        itemCount: 10,
        separatorBuilder: (context, index) => Divider(
          color: Colors.white.withOpacity(0.06),
          height: 1,
          thickness: 2,
        ),
        itemBuilder: (context, i) {
          const String coinName = 'Bitcoin';
          return const CryptoCoinTile(coinName: coinName);
        },
      ),
    );
  }
}


