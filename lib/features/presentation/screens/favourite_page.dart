import 'package:flutter/material.dart';
import 'package:translation_app/core/service/storage_service.dart';
import 'package:translation_app/features/data/models/translation_item.dart';
import 'package:translation_app/features/presentation/widgets/history_favourite_scaffold.dart';

class FavouritePage extends StatefulWidget {
  const FavouritePage({super.key});

  @override
  State<FavouritePage> createState() => _FavouritePageState();
}

class _FavouritePageState extends State<FavouritePage> {
  List<TranslationItem> favourites = [];

  Future<void> loadFavourite() async {
    final data = await StorageService.getFavorites();
    setState(() => favourites = data);
  }

  @override
  Widget build(BuildContext context) {
    loadFavourite();
    return HistoryFavouriteScaffold(
      label: 'Favourite',
      translationList: favourites,
      fun: loadFavourite(),
    );
  }
}
