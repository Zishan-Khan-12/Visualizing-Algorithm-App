import 'package:algo_app/models/search_models.dart';
import 'package:algo_app/provider/search/search_provider.dart';
import 'package:algo_app/ux/widgets/search/search_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchVisualizer<T extends SearchProvider> extends StatelessWidget {
  const SearchVisualizer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Selector<T, List<SearchModel>>(
        selector: (context, provider) => provider.numbers,
        builder: (_, numbers, __) {
          return Wrap(
            alignment: WrapAlignment.center,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: <Widget>[
              for (var number in numbers)
                SearchWidget(
                  number: number,
                )
            ],
          );
        },
      ),
    );
  }
}
