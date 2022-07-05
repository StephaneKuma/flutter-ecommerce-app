import 'package:ecommerce/src/app/router/router.dart';
import 'package:ecommerce/src/services/blocs/blocs.dart';
import 'package:ecommerce/src/ui/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CheckoutPage extends StatelessWidget {
  const CheckoutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: const CustomAppBar(title: 'Checkout'),
      bottomNavigationBar: const CustomBottomAppBar(route: CheckoutRoute.name),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child:
            BlocBuilder<CheckoutBloc, CheckoutState>(builder: (context, state) {
          if (state is CheckoutLoading) {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          }

          if (state is CheckoutLoaded) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'CUSTOMER INFORMATION',
                  style: Theme.of(context).textTheme.headline4,
                ),
                CustomTextFormField(
                  title: 'Email',
                  onChanged: (value) {
                    context
                        .read<CheckoutBloc>()
                        .add(UpdateCheckout(email: value));
                  },
                ),
                CustomTextFormField(
                  title: 'Full Name',
                  onChanged: (value) {
                    context
                        .read<CheckoutBloc>()
                        .add(UpdateCheckout(fullName: value));
                  },
                ),
                const SizedBox(height: 10),
                Text(
                  'DELIVERY INFORMATION',
                  style: Theme.of(context).textTheme.headline4,
                ),
                CustomTextFormField(
                  title: 'Address',
                  onChanged: (value) {
                    context
                        .read<CheckoutBloc>()
                        .add(UpdateCheckout(address: value));
                  },
                ),
                CustomTextFormField(
                  title: 'City',
                  onChanged: (value) {
                    context
                        .read<CheckoutBloc>()
                        .add(UpdateCheckout(city: value));
                  },
                ),
                CustomTextFormField(
                  title: 'Country',
                  onChanged: (value) {
                    context
                        .read<CheckoutBloc>()
                        .add(UpdateCheckout(country: value));
                  },
                ),
                CustomTextFormField(
                  title: 'ZIP Code',
                  onChanged: (value) {
                    context
                        .read<CheckoutBloc>()
                        .add(UpdateCheckout(zipCode: value));
                  },
                ),
                const SizedBox(height: 10),
                Container(
                  height: 50,
                  alignment: Alignment.bottomCenter,
                  decoration: const BoxDecoration(color: Colors.blue),
                  child: FittedBox(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Center(
                          child: TextButton(
                            onPressed: () {
                              // Navigator.pushNamed(
                              //   context,
                              //   '/payment-selection',
                              // );
                            },
                            child: Text(
                              'SELECT A PAYMENT METHOD',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline4!
                                  .copyWith(color: Colors.white),
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.arrow_forward,
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  'ORDER SUMMARY',
                  style: Theme.of(context).textTheme.headline4,
                ),
                const Expanded(
                  flex: 1,
                  child: OrderSummary(),
                ),
              ],
            );
          } else {
            return const Center(
              child: Text('Something went wrong'),
            );
          }
        }),
      ),
    );
  }
}
