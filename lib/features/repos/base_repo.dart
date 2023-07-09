
import '../models/register_model.dart';
import '../models/update_profile_model.dart';

abstract class BaseRepo{
  Future<bool> login(String phone,String password);
  Future<bool> forgetPassword({required String phone});
  Future<bool> register(RegisterModel model);
  Future<bool> logout();
  Future<bool> resetPassword(String code, String password, String passwordConfirmation);
  Future<bool> updateProfile(UpdateProfileModel model);
  Future<bool> updatePassword(String oldPassword, String newPassword,String confirmNewPassword);
}