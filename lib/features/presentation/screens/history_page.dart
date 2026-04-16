import 'package:flutter/material.dart';
import 'package:translation_app/core/service/storage_service.dart';
import 'package:translation_app/features/data/models/translation_item.dart';
import 'package:translation_app/features/presentation/widgets/history_favourite_scaffold.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  List<TranslationItem> history = [];

  Future<void> loadHistory() async {
    final data = await StorageService.getAllData();
    setState(() => history = data);
  }

  @override
  Widget build(BuildContext context) {
    loadHistory();
    return HistoryFavouriteScaffold(label: 'History', translationList: history, fun: loadHistory());
    
  }
}
