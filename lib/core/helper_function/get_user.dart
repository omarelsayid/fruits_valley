import 'dart:convert';

import '../../constants.dart';
import '../services/shared_preferences_singleton.dart';
import '../../features/Authentication/data/models/user_model.dart';
import '../../features/Authentication/domain/user_entity.dart';

UserEntity getUser() {
 var jsonData=  Prefs.getString(kUserData);
  
return UserModel.fromMap(jsonDecode(jsonData!));
}
