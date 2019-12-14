import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hackaton_pyme_2019/data/example/insumes.dart' as proex;
import 'package:hackaton_pyme_2019/ui/pages/customSearchDelegate/custom_search_delegate.dart';
import 'package:hackaton_pyme_2019/ui/pages/inventory/widgets/card_view_product.dart';
import 'package:hackaton_pyme_2019/ui/pages/voice_chat/voice_chat.dart';

class Inventory extends StatelessWidget {
  void _search(BuildContext context) {
    showSearch(
      context: context,
      delegate: CustomSearchDelegate(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(context,
            MaterialPageRoute(builder: (context) => MyHomePageVoice(title: 'Asistente',))),
        child: Icon(Icons.voice_chat),
      ),
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(CupertinoIcons.back, color: Colors.black),
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () => _search(context),
            icon: Icon(
              CupertinoIcons.search,
              color: Colors.black,
            ),
          )
        ],
        brightness: Brightness.light,
        title: Text('Inventarios', style: Theme.of(context).textTheme.title),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Container(
          margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
          padding: EdgeInsets.only(left: 16.0, right: 16.0),
          child: ListElements()),
    );
  }
}

class ListElements extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: BouncingScrollPhysics(),
      primary: false,
      slivers: <Widget>[
        SliverGrid.count(
          childAspectRatio: 1,
          crossAxisCount: 2,
          crossAxisSpacing: 1,
          mainAxisSpacing: 1,
          children: <Widget>[
            for (int i = 0; i < 9; i++)
              CardViewProduct(product: proex.products[i % 3]),
          ],
        )
      ],
    );
  }
}
