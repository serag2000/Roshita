import 'package:flutter/material.dart';

class Searchproducts extends SearchDelegate {
  List productname = [
    "بنادول",
    " كريمة",
    "شامبو",
    'jnbi',
    'uhggathbuthb',
    'iishffbuahephb',
    'stjstjsyrjsyjryj'
  ];

  List? filterList;

  @override
  List<Widget>? buildActions(BuildContext context) {
    query = "";
    return [IconButton(onPressed: () {}, icon: const Icon(Icons.close))];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: const Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    return const Text('');
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query == "") {
      return ListView.builder(
        itemCount: productname.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              
            },
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child:
                    Text('${productname[index]}', style: const TextStyle(fontSize: 18)),
              ),
            ),
          );
        },
      );
    } else {
      filterList =
          productname.where((element) => element.contains(query)).toList();

      return ListView.builder(
        itemCount: filterList!.length,
        itemBuilder: (context, index) {
          return Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child:
                  Text('${filterList![index]}', style: const TextStyle(fontSize: 18)),
            ),
          );
        },
      );
    }
  }
}
