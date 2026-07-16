import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = "https://shopee-api-three.vercel.app";

  Future<Map<String, dynamic>> createOrder({
    required String userId,
    required List<Map<String, dynamic>> items,
    required double total,
  }) async {
    // Sending the request
    final response = await http.post(
      // sends the request to
      Uri.parse("$baseUrl/api/orders"),
      headers: {"Content-Type": "application/json"},

      // request body
      body: jsonEncode({"userId": userId, "items": items, "total": total}),
    );

    // reading the response
    final data = jsonDecode(response.body);

    if (response.statusCode == 200) {
      return data;
    } else {
      throw Exception(data["message"] ?? "Failed to create order");
    }
  }



  Future<Map<String, dynamic>> createPayment({
    required String orderId,
    required String email,
    required String name,
  }) async {
    // Sending the request
    final response = await http.post(
      // sends the request to
      Uri.parse("$baseUrl/api/payments/flutterwave"),
      headers: {"Content-Type": "application/json"},

      // request body
      body: jsonEncode({"orderId": orderId, "email": email, "name": name}),
    );

    // reading the response
    final data = jsonDecode(response.body);

    if (response.statusCode == 200) {
      return data;
    } else {
      throw Exception(data["message"] ?? "Failed to make payment");
    }
  }



  Future<Map<String, dynamic>> verifyPayment({
  required String transactionId,
}) async {
  final response = await http.get(
    Uri.parse(
      "$baseUrl/api/payment/verify?transactionId=$transactionId",
    ),
  );

  if (response.statusCode != 200) {
    throw Exception("Payment verification failed");
  }

  return jsonDecode(response.body);
}
}
