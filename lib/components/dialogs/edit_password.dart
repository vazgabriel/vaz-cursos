import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:vaz_cursos/api.dart';
import 'package:vaz_cursos/components/loading_button.dart';
import 'package:vaz_cursos/constants.dart';
import 'package:vaz_cursos/store/user.dart';

class EditPassword extends StatefulWidget {
  EditPassword({
    Key key,
    @required this.dialogCtx,
    this.onSuccess,
  }) : super(key: key);

  final BuildContext dialogCtx;
  final Function onSuccess;

  @override
  _EditPasswordState createState() => _EditPasswordState();
}

class _EditPasswordState extends State<EditPassword> {
  final _formKey = GlobalKey<FormState>();

  var _password = '';
  var _oldPassword = '';
  var _isLoading = false;
  var _errorMessage = '';

  void _showMessage(String message) {
    setState(() {
      _errorMessage = message;
    });
  }

  void _stopLoading() {
    setState(() {
      _isLoading = false;
    });
  }

  void _onPressed(UserStore userStore) async {
    if (_formKey.currentState.validate()) {
      setState(() {
        _errorMessage = '';
        _isLoading = true;
      });

      try {
        var options = Options(
          headers: {'Authorization': userStore.user?.token ?? ''},
        );
        await api.patch(
          "/user/update-password",
          data: {'password': _password, 'oldPassword': _oldPassword},
          options: options,
        );

        _stopLoading();
        _formKey.currentState.reset();

        widget.onSuccess?.call();
        Navigator.of(widget.dialogCtx).pop();
      } on DioError catch (e) {
        _stopLoading();
        if (e.response != null) {
          String errorMessage = e.response.data['errors'][0]['message'];
          _showMessage(errorMessage);
        } else {
          _showMessage(UNEXPECTED_ERROR);
        }
      } catch (e) {
        _stopLoading();
        _showMessage(UNEXPECTED_ERROR);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final userStore = Provider.of<UserStore>(context);

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: ListView(
          children: <Widget>[
            TextFormField(
              autocorrect: false,
              obscureText: true,
              onChanged: (value) => setState(() {
                _oldPassword = value;
              }),
              decoration: const InputDecoration(
                labelText: 'Antiga Senha',
              ),
              validator: (value) {
                if (value.isEmpty || value.length < 6) {
                  return 'A senha deve ter ao menos 6 caracteres';
                }
                return null;
              },
            ),
            TextFormField(
              autocorrect: false,
              obscureText: true,
              onChanged: (value) => setState(() {
                _password = value;
              }),
              decoration: const InputDecoration(
                labelText: 'Nova Senha',
              ),
              validator: (value) {
                if (value.isEmpty || value.length < 6) {
                  return 'A senha deve ter ao menos 6 caracteres';
                }
                return null;
              },
            ),
            if (_errorMessage.isNotEmpty)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  _errorMessage,
                  style: const TextStyle(color: Colors.red, fontSize: 14),
                ),
              ),
            LoadingButton(
              color: Theme.of(context).primaryColor,
              textColor: Colors.white,
              onPressed: () => _onPressed(userStore),
              child: Text('ATUALIZAR'),
              loading: _isLoading,
              variant: ButtonVariant.Full,
            ),
          ],
          shrinkWrap: true,
        ),
      ),
    );
  }
}
