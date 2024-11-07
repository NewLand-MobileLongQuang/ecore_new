
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/common/widgets/gradient_background.dart';
import '../../../../core/res/media_res.dart';
import '../../../../core/utils/core_utils.dart';
import '../cubit/auth_cubit.dart';

class SelectNetworkScreen extends StatefulWidget {
  const SelectNetworkScreen({super.key});

  static const routeName = '/select-network';

  @override
  State<SelectNetworkScreen> createState() => _SelectNetworkScreenState();
}

class _SelectNetworkScreenState extends State<SelectNetworkScreen> {
  @override
  void initState() {
    context.read<AuthCubit>().getNetworks();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocConsumer<AuthCubit, AuthState>(listener: (context, state) {
        if (state is AuthError) {
          CoreUtils.showSnackBar(context, state.message);
        } else if (state is AuthNetworkListLoaded) {
          if (state.networks.isEmpty) {
            CoreUtils.showSnackBar(context, 'No networks');
          }
        } else if (state is AuthNetworkSelected) {

            CoreUtils.showSnackBar(context, 'Network selected ${state.network.Name}.');

            Navigator.pushReplacementNamed(context, '/');

        }
      }, builder: (context, state) {
        if (state is AuthNetworkListLoaded) {
          final orgs = (state as AuthNetworkListLoaded).networks;
          return GradientBackground(
            image: MediaRes.backgroundImg,
            child: SafeArea(
              child: ListView(
                shrinkWrap: true,
                padding: EdgeInsets.symmetric(horizontal: 20),
                children: [
                  Text(
                    'Select network',
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      for (var org in orgs)
                        Column(
                          children: [
                            ElevatedButton(
                              child: Text(org.Name??""),
                              onPressed: () {
                                context
                                    .read<AuthCubit>()
                                    .selectNetwork(network: org);
                              },
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                          ],
                        )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          );
        }

        return GradientBackground(
          image: MediaRes.backgroundImg,
          child: SafeArea(
            child: ListView(
              shrinkWrap: true,
              padding: EdgeInsets.symmetric(horizontal: 20),
              children: [
                Text(
                  'Select network',
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.w700),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [],
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
