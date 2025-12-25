import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/crypto_list/widgets/widgets.dart';
import 'package:flutter_application_1/repositories/crypto_coins/crypto_coins_repository.dart';
import 'package:flutter_application_1/repositories/crypto_coins/models/crypto_coin.dart';


class CryptoListScreen extends StatefulWidget {
  const CryptoListScreen({super.key});

  @override
  State<CryptoListScreen> createState() => _CryptoListScreenState();
}

class _CryptoListScreenState extends State<CryptoListScreen> {
  List<CryptoCoin>? _cryptoCoinsList;

  @override
  void initState() {
    _loadCryptoCoins();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(title: Text('CryptocurrenciesList'), centerTitle: true),
      body: (_cryptoCoinsList == null) ? 
      const Center(
        child: CircularProgressIndicator(color: Colors.orange)):
      ListView.separated(
        padding: const EdgeInsets.only(top: 16),
        itemCount: _cryptoCoinsList!.length,
        separatorBuilder: (context, index) => Divider(
          color: Colors.white.withOpacity(0.06),
          height: 1,
          thickness: 2,
        ),
        itemBuilder: (context, i) {
          final coin = _cryptoCoinsList![i];
          return CryptoCoinTile(coin: coin);
        },
      ),
    );
  }

  Future<void> _loadCryptoCoins() async {
      _cryptoCoinsList = await CryptoCoinsRepository().getCoinsList();
    setState(() {});
  }
}


