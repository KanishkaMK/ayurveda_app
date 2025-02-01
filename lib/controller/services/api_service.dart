import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import '../../core/utils/constants.dart';

class ApiService {
  Future<String> login(String username, String password) async {
    final response = await http.post(
      Uri.parse('${Constants.baseUrl}/login'),
      body: {
        'username': username,
        'password': password,
      },
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return data['token'];
    } else {
      throw Exception('Failed to log in');
    }
  }

  Future<List<dynamic>> fetchPatients(String token) async {
    final response = await http.get(
      Uri.parse('${Constants.baseUrl}/patientsList'),
      headers: {
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      return json.decode(response.body)['patients'];
    } else {
      throw Exception('Failed to fetch patient list');
    }
  }
}
