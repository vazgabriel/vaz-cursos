import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:vaz_cursos/api.dart';
import 'package:vaz_cursos/components/loading_button.dart';
import 'package:vaz_cursos/constants.dart';
import 'package:vaz_cursos/models/teacher.dart';
import 'package:vaz_cursos/store/user.dart';

class SaveTeacher extends StatefulWidget {
  SaveTeacher({
    Key key,
    @required this.dialogCtx,
    this.onSuccess,
  }) : super(key: key);

  final BuildContext dialogCtx;
  final Function onSuccess;

  @override
  _SaveTeacherState createState() => _SaveTeacherState();
}

class _SaveTeacherState extends State<SaveTeacher> {
  final _formKey = GlobalKey<FormState>();

  var _description = '';
  var _shortDescription = '';
  var _isLoading = false;
  var _errorMessage = '';

  @override
  void initState() {
    super.initState();

    final userStore = Provider.of<UserStore>(widget.dialogCtx);
    final teacher = userStore.user?.user?.teacher;

    if (teacher != null) {
      setState(() {
        _description = teacher.description;
        _shortDescription = teacher.shortDescription;
      });
    }
  }

  void _onPressed(UserStore userStore) async {
    if (_formKey.currentState.validate()) {
      setState(() {
        _errorMessage = '';
        _isLoading = true;
      });

      try {
        final options = Options(
          headers: {'Authorization': userStore.user?.token ?? ''},
        );
        final data = {
          'description': _description,
          'shortDescription': _shortDescription
        };
        final response = userStore.user?.user?.teacher != null
            ? await api.put(
                "/teacher",
                data: data,
                options: options,
              )
            : await api.post(
                "/teacher/request-teacher",
                data: data,
                options: options,
              );
        userStore.setTeacher(Teacher.fromJson(response.data));

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
    final teacher = userStore.user?.user?.teacher;

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: ListView(
          children: <Widget>[
            TextFormField(
              initialValue: teacher?.shortDescription ?? '',
              onChanged: (value) => setState(() {
                _shortDescription = value;
              }),
              decoration: const InputDecoration(
                labelText: 'Descrição simples',
                hintText: 'Essa descrição aparecerá nas páginas de detalhe de curso',
                errorMaxLines: 3,
              ),
              maxLength: 150,
              minLines: 3,
              maxLines: 4,
              validator: (value) {
                if (value.isEmpty) {
                  return 'Por favor use uma descrição simples válida';
                }
                return null;
              },
            ),
            TextFormField(
              initialValue: teacher?.description ?? '',
              onChanged: (value) => setState(() {
                _description = value;
              }),
              decoration: const InputDecoration(
                labelText: 'Descrição completa',
                hintText: 'Essa descrição aparecerá no detalhe do seu perfil',
                errorMaxLines: 3,
              ),
              maxLength: 1000,
              minLines: 4,
              maxLines: 8,
              validator: (value) {
                if (value.isEmpty || value.length < 50) {
                  return 'Por favor use uma descrição entre 50 e 1000 caracteres';
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
              text: teacher != null ? 'ATUALIZAR' : 'TORNAR-SE PROFESSOR',
              loading: _isLoading,
            ),
          ],
          shrinkWrap: true,
        ),
      ),
    );
  }
}
