import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:translation_app/features/data/models/translation_item.dart';

class StorageService {
  static const String _key = 'translation_data';
  static SharedPreferences? _prefs;

  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static Future<void> saveToHistory(TranslationItem item) async {
    List<TranslationItem> allData = await getAllData();

    allData.insert(0, item);

    await _saveToDisk(allData);
  }

  static Future<void> toggleFavorite(int index) async {
    List<TranslationItem> allData = await getAllData();
    if (index >= 0 && index < allData.length) {
      allData[index].isFavorite = !allData[index].isFavorite;
      await _saveToDisk(allData);
    }
  }

  static Future<List<TranslationItem>> getAllData() async {
    List<String>? jsonList = _prefs?.getStringList(_key);
    if (jsonList == null) return [];
    return jsonList.map((e) => TranslationItem.fromJson(jsonDecode(e))).toList();
  }

  static Future<List<TranslationItem>> getFavorites() async {
    List<TranslationItem> allData = await getAllData();
    return allData.where((item) => item.isFavorite).toList();
  }

  static Future<void> deleteItem(int index) async {
    List<TranslationItem> allData = await getAllData();
    if (index >= 0 && index < allData.length) {
      allData.removeAt(index);
      await _saveToDisk(allData);
    }
  }

  static Future<void> clearAll() async {
    await _prefs?.remove(_key);
  }

  static Future<void> _saveToDisk(List<TranslationItem> data) async {
    List<String> jsonList = data.map((e) => jsonEncode(e.toJson())).toList();
    await _prefs?.setStringList(_key, jsonList);
  }
}
