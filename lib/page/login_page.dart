import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test2/api/m7_livelyness_detection-0.0.6+4/lib/index.dart';
import 'package:test2/authentication/login/presentation/controllers/login_cubit.dart';
import 'package:test2/authentication/login/presentation/controllers/login_state.dart';
import 'package:test2/core/app_local_db/app_cached_db.dart';
import 'package:test2/core/app_local_db/app_local_db.dart';
import 'package:test2/core/models/user_model.dart';
import 'package:test2/main.dart';
import 'package:test2/page/control_panel_page.dart';


import '../core/reusable_widgets/app_button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();

  AnimationController? animationController;
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController urlController = TextEditingController();

  TextEditingController compIdController = TextEditingController();
     final SecureStorage secureStorage = SecureStorage();
     String? url ;

  @override
  void initState() {
    super.initState();
    getUrl();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
  }

  setUrl({required String url})async{
    await secureStorage.setLoginUrl(url);
  }
  getUrl()async{
   url =  await secureStorage.getLoginUrl();
   if(url != null){
    urlController.text = url! ;
   }

  }

 

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LoginCubit>(
      create: (context) => LoginCubit(LoginInitState()),
      child: BlocConsumer<LoginCubit, LoginStates>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return Scaffold(
              // appBar: AppBar(
                 backgroundColor: const Color(0xfffffbff),
              //   title: const Center(child: Text('Rf Mobile')),
              // ),
              body: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/logo.jpg',
                        height: 300,
                      ),
                      const SizedBox(height: 16.0),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Form(
                          key: _formKey,
                          onChanged: () {
                            // _formKey.currentState!.save();
                            // debugPrint(_formKey.currentState!.value.toString());
                          },
                          autovalidateMode: AutovalidateMode.disabled,
                          // skipDisabled: true,
                          child: Column(
                            children: [
                              TextFormField(
                                controller: usernameController,
                                keyboardType: TextInputType.text,
                                onChanged: (value) {},
                                decoration: const InputDecoration(
                                  labelText: 'Username',
                                  hintText: 'Enter your username',
                                  labelStyle: TextStyle(color: Color(0xff981723)),
                                   focusedBorder:  UnderlineInputBorder(
                                    // width: 0.0 produces a thin "hairline" border
                                    borderSide: BorderSide(color: Color(0xff981723))
                                  ),
                                  
                                ),
                                
                                
                                // validator: FormBuilderValidators.compose([
                                //   FormBuilderValidators.required(),
                                // ]),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter valid data';
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(height: 16.0),
                              TextFormField(
                                // name: 'password',
                                controller: passwordController,
                                keyboardType: TextInputType.text,
                                obscureText: true,
                                decoration: const InputDecoration(
                                  labelText: 'Password',
                                  hintText: 'Enter your password',
                                   labelStyle: TextStyle(color: Color(0xff981723)),
                                   focusedBorder:  UnderlineInputBorder(
                                    // width: 0.0 produces a thin "hairline" border
                                    borderSide: BorderSide(color: Color(0xff981723))
                                  ),
                                ),
                                // validator: FormBuilderValidators.compose([
                                //   FormBuilderValidators.required(),
                                // ]),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter valid data';
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(height: 16.0),
                              TextFormField(
                                // name: 'url',
                                // initialValue: _url,
                                controller: urlController,
                                keyboardType: TextInputType.url,

                                onChanged: (value) {
                                  // PrefsUtils.rxPrefs.setString('url', value);
                                  // _url = value;
                                },
                                decoration: const InputDecoration(
                                  labelText: 'URL',
                                  hintText: 'Enter server URL',
                                   labelStyle: TextStyle(color: Color(0xff981723)),
                                   focusedBorder:  UnderlineInputBorder(
                                    // width: 0.0 produces a thin "hairline" border
                                    borderSide: BorderSide(color: Color(0xff981723))
                                  ),
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter valid data';
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(height: 16.0),
                              TextFormField(
                                //name: 'company_id',
                                // initialValue: _companyId,
                                controller: compIdController,
                                keyboardType: TextInputType.text,
                                onChanged: (value) {
                                  // PrefsUtils.rxPrefs.setString('company_id', value);
                                  // _companyId = value;
                                },
                                decoration: const InputDecoration(
                                  labelText: 'Company ID',
                                  hintText: 'Enter company ID',
                                   labelStyle: TextStyle(color: Color(0xff981723)),
                                   focusedBorder:  UnderlineInputBorder(
                                    // width: 0.0 produces a thin "hairline" border
                                    borderSide: BorderSide(color: Color(0xff981723))
                                  ),
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter valid data';
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(height: 16.0),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 30),
                        child: Align(
                            alignment: AlignmentDirectional.bottomEnd,
                            child: 
                            state is LoginLoadingState
                                ? const SizedBox(
                                    height: 48,
                                    width: 48,
                                    child: DecoratedBox(
                                      decoration: BoxDecoration(
                                          color: Color(0xffa3171e),
                                          shape: BoxShape.circle),
                                      child: Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: CircularProgressIndicator(
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  )
                                : 
                                PrimaryAppButton(
                                    buttonWidth: 100,
                                    buttonRadius: 24,
                                    onPress: () {
                                      if (_formKey.currentState!.validate()) {
                                        // If the form is valid, display a snackbar. In the real world,
                                        // you'd often call a server or save the information in a database.
                                        setUrl(url:urlController.text );

                                        LoginCubit.get(context).login(
                                            url: urlController.text,
                                            username: usernameController.text,
                                            password: passwordController.text,
                                            companyId: compIdController.text,
                                            context: context);
          


                                      }else{
                                         ScaffoldMessenger.of(context).showSnackBar(
                                          const SnackBar(content: Text('Complete Data First')),
                                        );
                                      }
                                    }, buttonTile: 'Login',
                                  )),
                      ),
                      // PrimaryAppButton(buttonTile: 'buttonTile', onPress: ()async{
                      //       String?   oo =        await     SecureStorage().getUserModel();

                      //                     print(oo);

                      //                     UserModel userModel = UserModel.fromJson(jsonDecode(oo??''));
                      //                                                               print(userModel.id);

                      // })
                    ],
                  ),
                ),
              ));
        },
      ),
    );
  }
}
