import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

Future<String> uploadToCloudinary(File image) async {
  // Cloudinary upload endpoint
  final url = Uri.parse(
    "https://api.cloudinary.com/v1_1/dbiiblk01/image/upload",
  );
  var request = http.MultipartRequest("POST", url);
  //permission to upload without login
  request.fields["upload_preset"] = "shopee";

  request.files.add(await http.MultipartFile.fromPath("file", image.path));
  var response = await request.send();
  //Converts server response into readable text
  var responseData = await response.stream.bytesToString();

  final jsonData = jsonDecode(responseData);

  return jsonData["secure_url"];
}
