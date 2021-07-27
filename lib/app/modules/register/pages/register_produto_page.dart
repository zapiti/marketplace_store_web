import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marketplace_store_web/app/components/load/load_elements.dart';
import 'package:marketplace_store_web/app/modules/store/model/mystore.dart';
import 'package:marketplace_store_web/app/routes/constants_routes.dart';

import 'package:marketplace_store_web/app/utils/theme/app_theme_utils.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../register_store.dart';

class RegisterProdutoPage extends StatefulWidget {
  @override
  _RegisterProdutoPageState createState() => _RegisterProdutoPageState();
}

class _RegisterProdutoPageState
    extends ModularState<RegisterProdutoPage, RegisterStore> {
  final fieldRequired = 'Campo obrigatório';
  final form = FormGroup(MyStore().toMapReact());

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Center(
          child: Container(
              width: 500,
              child: Center(
                  child: SingleChildScrollView(
                      child: ReactiveForm(
                          formGroup: form,
                          child: Column(
                            children: [
                              Container(
                                margin: EdgeInsets.only(
                                    bottom: 30, right: 20, left: 20, top: 30),
                                child: Text(
                                  "Validação",
                                  textAlign: TextAlign.center,
                                  style: AppThemeUtils.normalBoldSize(
                                      fontSize: 26),
                                ),
                              ),
                              Container(
                                  margin: EdgeInsets.only(
                                      bottom: 30, right: 20, left: 20),
                                  width: 300,
                                  child: RichText(
                                      textAlign: TextAlign.center,
                                      text: TextSpan(
                                        text:
                                            "Preencha os dados abaixo para a avaliação:",
                                        style: AppThemeUtils.normalSize(
                                            color: Theme.of(context)
                                                .textTheme
                                                .bodyText1!
                                                .color,
                                            fontSize: 20),
                                        children: <TextSpan>[],
                                      ))),

                              Container(
                                
                                color: AppThemeUtils.colorGrayBg,
                                margin: EdgeInsets.symmetric(
                                    horizontal: 30, vertical: 10),
                                child: ReactiveTextField(
                                  formControlName: 'cnpj',
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: AppThemeUtils.colorGrayBg,
                                          width: 0.0),
                                    ),
                                    labelText: 'Cnpj',
                                  ),
                                  validationMessages: (control) =>
                                      {'required': fieldRequired},
                                ),
                              ),
                              Container(
                                
                                color: AppThemeUtils.colorGrayBg,
                                margin: EdgeInsets.symmetric(
                                    horizontal: 30, vertical: 10),
                                child: ReactiveTextField(
                                  formControlName: 'password',
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: AppThemeUtils.colorGrayBg,
                                          width: 0.0),
                                    ),
                                    labelText: 'Senha',
                                  ),
                                  obscureText: true,
                                  validationMessages: (control) =>
                                      {'required': fieldRequired},
                                ),
                              ),
                              Container(
                                
                                color: AppThemeUtils.colorGrayBg,
                                margin: EdgeInsets.symmetric(
                                    horizontal: 30, vertical: 10),
                                child: ReactiveTextField(
                                  formControlName: 'companyName',
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: AppThemeUtils.colorGrayBg,
                                          width: 0.0),
                                    ),
                                    labelText: 'Empresa',
                                  ),
                                  validationMessages: (control) =>
                                      {'required': fieldRequired},
                                ),
                              ),
                              Container(
                                
                                color: AppThemeUtils.colorGrayBg,
                                margin: EdgeInsets.symmetric(
                                    horizontal: 30, vertical: 10),
                                child: ReactiveTextField(
                                  formControlName: 'email',
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: AppThemeUtils.colorGrayBg,
                                          width: 0.0),
                                    ),
                                    labelText: 'E-mail',
                                  ),
                                  validationMessages: (control) =>
                                      {'required': fieldRequired},
                                ),
                              ),
                              Container(
                                
                                color: AppThemeUtils.colorGrayBg,
                                margin: EdgeInsets.symmetric(
                                    horizontal: 30, vertical: 10),
                                child: ReactiveTextField(
                                  formControlName: 'phone',
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: AppThemeUtils.colorGrayBg,
                                          width: 0.0),
                                    ),
                                    labelText: 'Telefone',
                                  ),
                                  validationMessages: (control) =>
                                      {'required': fieldRequired},
                                ),
                              ),
                              Container(
                                
                                color: AppThemeUtils.colorGrayBg,
                                margin: EdgeInsets.symmetric(
                                    horizontal: 30, vertical: 10),
                                child: ReactiveTextField(
                                  formControlName: 'responsible',
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: AppThemeUtils.colorGrayBg,
                                          width: 0.0),
                                    ),
                                    labelText: 'Responsável',
                                  ),
                                  validationMessages: (control) =>
                                      {'required': fieldRequired},
                                ),
                              ),
                              Container(
                                  
                                  color: AppThemeUtils.colorGrayBg,
                                  margin: EdgeInsets.symmetric(
                                      horizontal: 30, vertical: 10),
                                  child: ReactiveTextField(
                                    formControlName: 'description',
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: AppThemeUtils.colorGrayBg,
                                            width: 0.0),
                                      ),
                                      labelText: 'Descrição',
                                    ),
                                    validationMessages: (control) =>
                                        {'required': fieldRequired},
                                  )),
                              Container(
                                
                                color: AppThemeUtils.colorGrayBg,
                                margin: EdgeInsets.symmetric(
                                    horizontal: 30, vertical: 10),
                                child: ReactiveDropdownField<String>(
                                  formControlName: 'type',
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: AppThemeUtils.colorGrayBg,
                                          width: 0.0),
                                    ),
                                    labelText: 'Tipo',
                                  ),
                                  items: [
                                    DropdownMenuItem(
                                      value: 'RESTAURANTES',
                                      child: Text('RESTAURANTES'),
                                    ),
                                    DropdownMenuItem(
                                      value: 'LANCHONETES',
                                      child: Text('LANCHONETES'),
                                    ),
                                    DropdownMenuItem(
                                      value: 'SUPERMERCADO',
                                      child: Text('SUPERMERCADO'),
                                    ),
                                    DropdownMenuItem(
                                      value: 'MERCADOS',
                                      child: Text('MERCADOS'),
                                    ),
                                    DropdownMenuItem(
                                      value: 'BEBIDAS',
                                      child: Text('BEBIDAS'),
                                    ),
                                    DropdownMenuItem(
                                      value: 'FARMACIA',
                                      child: Text('FARMACIA'),
                                    ),
                                  ],
                                  validationMessages: (control) =>
                                      {'required': fieldRequired},
                                ),
                              ),
                              Container(
                                
                                color: AppThemeUtils.colorGrayBg,
                                margin: EdgeInsets.symmetric(
                                    horizontal: 30, vertical: 10),
                                child: ReactiveTextField(
                                  formControlName: 'zipCode',
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: AppThemeUtils.colorGrayBg,
                                          width: 0.0),
                                    ),
                                    labelText: 'Cep',
                                  ),
                                  validationMessages: (control) =>
                                      {'required': fieldRequired},
                                ),
                              ),
                              Container(
                                
                                color: AppThemeUtils.colorGrayBg,
                                margin: EdgeInsets.symmetric(
                                    horizontal: 30, vertical: 10),
                                child: ReactiveTextField(
                                  formControlName: 'address',
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: AppThemeUtils.colorGrayBg,
                                          width: 0.0),
                                    ),
                                    labelText: 'Endereço',
                                  ),
                                  validationMessages: (control) =>
                                      {'required': fieldRequired},
                                ),
                              ),
                              Container(
                                
                                color: AppThemeUtils.colorGrayBg,
                                margin: EdgeInsets.symmetric(
                                    horizontal: 30, vertical: 10),
                                child: ReactiveTextField(
                                  formControlName: 'number',
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: AppThemeUtils.colorGrayBg,
                                          width: 0.0),
                                    ),
                                    labelText: 'Numero',
                                  ),
                                  validationMessages: (control) =>
                                      {'required': fieldRequired},
                                ),
                              ),
                              Container(
                                
                                color: AppThemeUtils.colorGrayBg,
                                margin: EdgeInsets.symmetric(
                                    horizontal: 30, vertical: 10),
                                child: ReactiveTextField(
                                  formControlName: 'neighborhood',
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: AppThemeUtils.colorGrayBg,
                                          width: 0.0),
                                    ),
                                    labelText: 'Bairro',
                                  ),
                                  validationMessages: (control) =>
                                      {'required': fieldRequired},
                                ),
                              ),
                              Container(
                                
                                color: AppThemeUtils.colorGrayBg,
                                margin: EdgeInsets.symmetric(
                                    horizontal: 30, vertical: 10),
                                child: ReactiveTextField(
                                  formControlName: 'city',
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: AppThemeUtils.colorGrayBg,
                                          width: 0.0),
                                    ),
                                    labelText: 'Cidade',
                                  ),
                                  validationMessages: (control) =>
                                      {'required': fieldRequired},
                                ),
                              ),
                              Container(
                                
                                color: AppThemeUtils.colorGrayBg,
                                margin: EdgeInsets.symmetric(
                                    horizontal: 30, vertical: 10),
                                child: ReactiveTextField(
                                  formControlName: 'state',
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: AppThemeUtils.colorGrayBg,
                                          width: 0.0),
                                    ),
                                    labelText: 'Estado',
                                  ),
                                  validationMessages: (control) =>
                                      {'required': fieldRequired},
                                ),
                              ),
                              Container(
                                  
                                  color: AppThemeUtils.colorGrayBg,
                                  margin: EdgeInsets.symmetric(
                                      horizontal: 30, vertical: 10),
                                  child: ReactiveTextField(
                                    formControlName: 'complement',
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: AppThemeUtils.colorGrayBg,
                                            width: 0.0),
                                      ),
                                      labelText: 'Complemento',
                                    ),
                                    validationMessages: (control) =>
                                        {'required': fieldRequired},
                                  )),
                              Container(
                                  margin: EdgeInsets.only(
                                      bottom: 20, top: 10, right: 25, left: 25),
                                  width: MediaQuery.of(context).size.width,
                                  height: 50,
                                  child: Observer(
                                      builder: (context) => controller
                                              .isLoadLogin
                                          ? loadElements()
                                          : ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                  primary: AppThemeUtils
                                                      .colorPrimary),
                                              onPressed: () {
                                                form.markAllAsTouched();
                                                form.controls.forEach((key, value) {
                                                  value.markAsDirty();
                                                });
                                                if (form.valid) {
                                                  final myStore = MyStore.fromMap(form.rawValue);

                                                  controller.getRegisterProduct(
                                                      context,myStore!);
                                                }

                                              },
                                              child: Text(
                                                "Cadastrar",
                                                style: AppThemeUtils
                                                    .normalBoldSize(
                                                        color: AppThemeUtils
                                                            .whiteColor),
                                              ),
                                            ))),
                              Container(
                                  margin: EdgeInsets.only(
                                      bottom: 0, top: 10, right: 25, left: 25),
                                  alignment: Alignment.center,
                                  child: Text(
                                    "Ja possui uma conta?",
                                    style: AppThemeUtils.normalSize(
                                        color: AppThemeUtils.black),
                                  )),
                              Container(
                                  margin: EdgeInsets.only(
                                      bottom: 20, top: 0, right: 25, left: 25),
                                  alignment: Alignment.center,
                                  height: 50,
                                  child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          primary: Colors.transparent,
                                          elevation: 0),
                                      onPressed: () {
                                        Modular.to.pushReplacementNamed(
                                            ConstantsRoutes.LOGIN);
                                      },
                                      child: Text(
                                        "Entrar",
                                        style: AppThemeUtils.normalSize(
                                            color: AppThemeUtils.colorPrimary),
                                      )))
                            ],
                          )))))),
    );
  }
}
