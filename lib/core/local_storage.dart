import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  static const String _agentPhoneKey = 'agent_phone';

  static const Map<String,String> phoneToAgentIdMap = {
    '9867843694': 'SOS-000184',
    '9987840201': 'SOS-000031',
  };

  static Future<void> setAgentPhone(String phoneNumber) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_agentPhoneKey, phoneToAgentIdMap[phoneNumber] ?? '');
  }

  static Future<String?> getAgentPhone() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_agentPhoneKey);
  }
} 