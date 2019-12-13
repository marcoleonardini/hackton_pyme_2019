import 'package:flutter/material.dart';
import 'package:hackaton_pyme_2019/models/insume.dart';
import 'package:hackaton_pyme_2019/ui/pages/inventory/widgets/card_view_product.dart';
import 'package:hackaton_pyme_2019/data/example/insumes.dart' as proex;

class CustomSearchDelegate extends SearchDelegate {
  @override
  String get searchFieldLabel => 'Que deseas buscar?';
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.length < 3) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child: Text(
              "Search term must be longer than two letters.",
              style: TextStyle(color: Colors.black),
            ),
          )
        ],
      );
    }

    return FutureBuilder(
        future: proex.getProducts(),
        builder: (BuildContext context, AsyncSnapshot<List<Insume>> snapshot) {
          if (snapshot.hasData) {
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
          } else {
            return Center(child: CircularProgressIndicator());
          }
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container();
  }
}
