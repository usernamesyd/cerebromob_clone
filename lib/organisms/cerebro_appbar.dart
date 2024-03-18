import 'package:cerebro_mobile/theme/colors.dart';
import 'package:cerebro_mobile/theme/texts.dart';
import 'package:flutter/material.dart';

class CerebroAppbarScaffold extends StatelessWidget {
  const CerebroAppbarScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ABC School of Cavite',
            style: poppinsH5.copyWith(
              color: cerebroWhite,
            )),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: <Color>[cerebroBlue300, cerebroBlue200],
            ),
          ),
        ),
        leading: IconButton(
          color: cerebroWhite,
          icon: Icon(Icons.menu),
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
        ),
        actions: [
          IconButton(
            onPressed: () {}, // Implement desired action
            icon: Icon(Icons.account_circle),
            color: cerebroWhite,
          ),
        ],
      ),
    );
  }
}
