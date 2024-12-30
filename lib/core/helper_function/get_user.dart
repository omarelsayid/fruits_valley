import 'dart:convert';

import 'package:fruits_valley/constants.dart';
import 'package:fruits_valley/core/services/shared_preferences_singleton.dart';
import 'package:fruits_valley/features/Authentication/data/models/user_model.dart';
import 'package:fruits_valley/features/Authentication/domain/user_entity.dart';

UserEntity getUser() {
 var jsonData=  Prefs.getString(kUserData);
  
return UserModel.fromMap(jsonDecode(jsonData!));
}
