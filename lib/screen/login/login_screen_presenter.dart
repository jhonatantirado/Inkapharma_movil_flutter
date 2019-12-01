import 'package:inkapharma/infraestructure/Sqflite_UserRepository.dart';
import 'package:inkapharma/model/user.dart';
import 'package:inkapharma/data/database_helper.dart';
import 'package:inkapharma/data/rest_ds.dart';

abstract class LoginScreenContract {
  void onLoginSuccess(User user);
  void onLoginError(String errorTxt);
}

class LoginScreenPresenter {
  LoginScreenContract _view;
  RestDatasource api = new RestDatasource();
  LoginScreenPresenter(this._view);

  SqfliteUserRepository userRepository =
    SqfliteUserRepository(DatabaseHelper.get);

  doLogin(String username, String password, String email) async {
    api.login(username, password, email).then((User user) {
      processLoginSuccess(user);
    }).catchError((Object error) => _view.onLoginError(error.toString()));
  }

  void processLoginSuccess(User user) async {
      var loggedInUser = await userRepository.login(user);
      if (loggedInUser != null) {
        _view.onLoginSuccess(user);
      }
      else {
        _view.onLoginError("Invalid credentials");
      }
  }
}