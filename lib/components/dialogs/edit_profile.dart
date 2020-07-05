import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:vaz_cursos/api.dart';
import 'package:vaz_cursos/components/loading_button.dart';
import 'package:vaz_cursos/constants.dart';
import 'package:vaz_cursos/models/user.dart';
import 'package:vaz_cursos/store/user.dart';

class EditProfile extends StatefulWidget {
  EditProfile({
    Key key,
    @required this.dialogCtx,
    this.onSuccess,
  }) : super(key: key);

  final BuildContext dialogCtx;
  final Function onSuccess;

  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final _formKey = GlobalKey<FormState>();

  var _name = '';
  var _isLoading = false;
  var _errorMessage = '';

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
        var response = await api.patch(
          "/user",
          data: {'name': _name},
          options: options,
        );
        userStore.setUser(User.fromJson(response.data));

        setState(() {
          _isLoading = false;
        });

        _formKey.currentState.reset();
        widget.onSuccess?.call();
        Navigator.of(widget.dialogCtx).pop();
      } on DioError catch (e) {
        final responseData = (e?.response?.data ?? {}) as Map<String, dynamic>;

        setState(() {
          _isLoading = false;
          _errorMessage = responseData.containsKey('errors')
              ? responseData['errors'][0]['message']
              : UNEXPECTED_ERROR;
        });
      } catch (e) {
        setState(() {
          _errorMessage = UNEXPECTED_ERROR;
          _isLoading = false;
        });
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
              textCapitalization: TextCapitalization.words,
              initialValue: userStore.user?.user?.name ?? '',
              onChanged: (value) => setState(() {
                _name = value;
              }),
              decoration: const InputDecoration(
                labelText: 'Nome',
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Por favor use um nome válido';
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
              text: 'ATUALIZAR',
              loading: _isLoading,
            ),
          ],
          shrinkWrap: true,
        ),
      ),
    );
  }
}
