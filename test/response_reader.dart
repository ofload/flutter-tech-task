import 'dart:io';

String responseData(String fileName) => File('test/response_data/$fileName').readAsStringSync();
