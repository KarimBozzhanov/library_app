import 'package:library_app/di/di_locator.dart';
import 'package:library_app/feature/auth/registration/data/repository/registration_repository.dart';

class AddUserUseCase {
  AddUserUseCase() : _repository = sl();
  final RegistrationRepository _repository;

  Future<void> execute(Map<String, dynamic> data) async {
    await _repository.addUser(data);
  }
}