import 'dart:convert';
import 'dart:io';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class DeepseekService {
  final String _apiKey = dotenv.env['DEEPSEEK_API_KEY'] ?? '';
  final String _apiUrl = 'https://api.deepseek.com/v1/chat/completions';

  Future<Map<String, dynamic>?> scanTimetable(File imageFile) async {
    if (_apiKey.isEmpty) {
      throw Exception(
          'Deepseek API key not found. Please check your .env file.');
    }

    try {
      // Convert image to base64
      final bytes = await imageFile.readAsBytes();
      final base64Image = base64Encode(bytes);

      // Prepare the request
      final response = await http.post(
        Uri.parse(_apiUrl),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $_apiKey',
        },
        body: jsonEncode({
          'model': 'deepseek-vision',
          'messages': [
            {
              'role': 'system',
              'content':
                  'You are an expert at extracting prayer times from mosque timetables. Extract the prayer times in a structured JSON format with fields for each prayer (fajr, dhuhr, asr, maghrib, isha) and any additional information like jummah times. If there are multiple months, focus on the current month. Return only the JSON data without any explanations.'
            },
            {
              'role': 'user',
              'content': [
                {
                  'type': 'text',
                  'text':
                      'Extract the prayer times from this timetable image. Return the data in JSON format with fields for each prayer time (fajr, dhuhr, asr, maghrib, isha) and any additional information like jummah times. If there are multiple months, focus on the current month.'
                },
                {
                  'type': 'image_url',
                  'image_url': {'url': 'data:image/jpeg;base64,$base64Image'}
                }
              ]
            }
          ],
          'max_tokens': 4000
        }),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final content = data['choices'][0]['message']['content'];

        // Extract JSON from the response
        try {
          // Try to parse the entire content as JSON
          return jsonDecode(content);
        } catch (e) {
          // If that fails, try to extract JSON from the text
          final jsonMatch =
              RegExp(r'```json\s*([\s\S]*?)\s*```').firstMatch(content);
          if (jsonMatch != null && jsonMatch.groupCount >= 1) {
            return jsonDecode(jsonMatch.group(1)!);
          }

          // If no JSON block, try to find anything that looks like JSON
          final jsonStart = content.indexOf('{');
          final jsonEnd = content.lastIndexOf('}');

          if (jsonStart >= 0 && jsonEnd > jsonStart) {
            final jsonStr = content.substring(jsonStart, jsonEnd + 1);
            return jsonDecode(jsonStr);
          }

          throw Exception('Could not extract JSON from the response');
        }
      } else {
        throw Exception(
            'Failed to process image: ${response.statusCode} ${response.body}');
      }
    } catch (e) {
      print('Error in scanTimetable: $e');
      return null;
    }
  }
}
