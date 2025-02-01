import 'package:flutter/material.dart';
import '../../models/patient.dart';
import '../services/api_service.dart';

class PatientProvider extends ChangeNotifier {
  final ApiService _apiService = ApiService();
  String _token = '';
  List<Patient> _patients = [];
  bool _isLoading = false;

  String get token => _token;
  List<Patient> get patients => _patients;
  bool get isLoading => _isLoading;

  Future<void> login(String username, String password) async {
    try {
      _token = await _apiService.login(username, password);
      notifyListeners();
    } catch (e) {
      throw Exception('Login failed: $e');
    }
  }

  Future<void> fetchPatients() async {
    if (_token.isEmpty) return;

    _isLoading = true;
    notifyListeners();

    try {
      final data = await _apiService.fetchPatients(_token);
      _patients = data.map((json) => Patient.fromJson(json)).toList();
    } catch (e) {
      _patients = [];
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
