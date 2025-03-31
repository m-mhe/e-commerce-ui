import 'package:flutter/material.dart';
import 'package:general_ecommerce_client_app/user_interface/widgets/place_background_image.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PlaceBackgroundImage(imageAddress: "asset/background_one.png", child: SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsets.only(top: MediaQuery.sizeOf(context).height/4.5, right: 15, left: 15),
          child: Column(
            children: [
              Padding(padding:  const EdgeInsets.only(bottom: 17),child: Text("Get Started"),),
              Padding(
                padding: const EdgeInsets.only(bottom: 7),
                child: TextField(),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 7),
                child: TextField(),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 7),
                child: TextField(),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 7),
                child: TextField(),
              ),
              ElevatedButton(onPressed: (){}, child: Text("Sign up"))
            ],
          ),
        ),
      )),
    );
  }
}
