import 'package:core/core.dart';
import 'package:dartz/dartz.dart';

import '../dtos/register_with_email_dto.dart';
import '../repositories/i_register_with_email_repository.dart';

abstract class IRegisterWithEmailUsecase {
  Future<Either<IAppException, UserEntity>> call(RegisterWithEmailDTO params);
}

class RegisterWithEmailUsecaseImpl implements IRegisterWithEmailUsecase {
  RegisterWithEmailUsecaseImpl(this._registerWithEmailRepository);

  final IRegisterWithEmailRepository _registerWithEmailRepository;

  @override
  Future<Either<IAppException, UserEntity>> call(RegisterWithEmailDTO params) async {
    return _registerWithEmailRepository.registerWithEmail(params);
  }
}
