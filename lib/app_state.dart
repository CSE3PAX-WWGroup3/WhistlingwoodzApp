import 'package:flutter/material.dart';
import '/backend/backend.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  List<String> _weddingTheme = [];
  List<String> get weddingTheme => _weddingTheme;
  set weddingTheme(List<String> value) {
    _weddingTheme = value;
  }

  void addToWeddingTheme(String value) {
    _weddingTheme.add(value);
  }

  void removeFromWeddingTheme(String value) {
    _weddingTheme.remove(value);
  }

  void removeAtIndexFromWeddingTheme(int index) {
    _weddingTheme.removeAt(index);
  }

  void updateWeddingThemeAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    _weddingTheme[index] = updateFn(_weddingTheme[index]);
  }

  void insertAtIndexInWeddingTheme(int index, String value) {
    _weddingTheme.insert(index, value);
  }

  List<String> _weddingFunction = [];
  List<String> get weddingFunction => _weddingFunction;
  set weddingFunction(List<String> value) {
    _weddingFunction = value;
  }

  void addToWeddingFunction(String value) {
    _weddingFunction.add(value);
  }

  void removeFromWeddingFunction(String value) {
    _weddingFunction.remove(value);
  }

  void removeAtIndexFromWeddingFunction(int index) {
    _weddingFunction.removeAt(index);
  }

  void updateWeddingFunctionAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    _weddingFunction[index] = updateFn(_weddingFunction[index]);
  }

  void insertAtIndexInWeddingFunction(int index, String value) {
    _weddingFunction.insert(index, value);
  }

  List<String> _weddingVenue = [];
  List<String> get weddingVenue => _weddingVenue;
  set weddingVenue(List<String> value) {
    _weddingVenue = value;
  }

  void addToWeddingVenue(String value) {
    _weddingVenue.add(value);
  }

  void removeFromWeddingVenue(String value) {
    _weddingVenue.remove(value);
  }

  void removeAtIndexFromWeddingVenue(int index) {
    _weddingVenue.removeAt(index);
  }

  void updateWeddingVenueAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    _weddingVenue[index] = updateFn(_weddingVenue[index]);
  }

  void insertAtIndexInWeddingVenue(int index, String value) {
    _weddingVenue.insert(index, value);
  }

  List<String> _weddingBudget = [];
  List<String> get weddingBudget => _weddingBudget;
  set weddingBudget(List<String> value) {
    _weddingBudget = value;
  }

  void addToWeddingBudget(String value) {
    _weddingBudget.add(value);
  }

  void removeFromWeddingBudget(String value) {
    _weddingBudget.remove(value);
  }

  void removeAtIndexFromWeddingBudget(int index) {
    _weddingBudget.removeAt(index);
  }

  void updateWeddingBudgetAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    _weddingBudget[index] = updateFn(_weddingBudget[index]);
  }

  void insertAtIndexInWeddingBudget(int index, String value) {
    _weddingBudget.insert(index, value);
  }

  String _corporateTheme = '';
  String get corporateTheme => _corporateTheme;
  set corporateTheme(String value) {
    _corporateTheme = value;
  }

  String _corporateVenue = '';
  String get corporateVenue => _corporateVenue;
  set corporateVenue(String value) {
    _corporateVenue = value;
  }

  String _corporateNumberGuests = '';
  String get corporateNumberGuests => _corporateNumberGuests;
  set corporateNumberGuests(String value) {
    _corporateNumberGuests = value;
  }

  String _corporateBudget = '';
  String get corporateBudget => _corporateBudget;
  set corporateBudget(String value) {
    _corporateBudget = value;
  }

  String _corporateFunction = '';
  String get corporateFunction => _corporateFunction;
  set corporateFunction(String value) {
    _corporateFunction = value;
  }

  String _partyTheme = '';
  String get partyTheme => _partyTheme;
  set partyTheme(String value) {
    _partyTheme = value;
  }

  String _partyFunction = '';
  String get partyFunction => _partyFunction;
  set partyFunction(String value) {
    _partyFunction = value;
  }

  String _partyVenue = '';
  String get partyVenue => _partyVenue;
  set partyVenue(String value) {
    _partyVenue = value;
  }

  String _partyBudget = '';
  String get partyBudget => _partyBudget;
  set partyBudget(String value) {
    _partyBudget = value;
  }

  String _displayName = '';
  String get displayName => _displayName;
  set displayName(String value) {
    _displayName = value;
  }
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
