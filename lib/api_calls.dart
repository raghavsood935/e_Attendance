import 'dart:convert';
import 'package:http/http.dart' as http;

//Api Calls

String apiHeader = "https://e-attendance.starspayroll.in/stage";

Future getEmployeeData(String id) async {
  var request = http.Request(
      'POST', Uri.parse('$apiHeader/api/rest/employee/auth/login?emp_code=$id'));

  http.StreamedResponse response = await request.send();
  var data = jsonDecode(await response.stream.bytesToString());
  if (response.statusCode == 200) {
    print(data);
  } else {
    print(response.reasonPhrase);
  }
  return data;
}

Future verifyEmployeeData(String id,String otp) async {
  var request = http.Request(
      'POSt', Uri.parse('$apiHeader/api/rest/employee/auth/verify-otp?emp_code=$id&otp=$otp'));

  http.StreamedResponse response = await request.send();
  var data = jsonDecode(await response.stream.bytesToString());
  if (response.statusCode == 200) {
    print(data);
  } else {
    print(response.reasonPhrase);
  }
  return data;
}