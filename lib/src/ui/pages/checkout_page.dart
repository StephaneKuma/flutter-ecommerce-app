import 'package:ecommerce/src/ui/widgets/widgets.dart';
import 'package:flutter/material.dart';

class CheckoutPage extends StatelessWidget {
  const CheckoutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: const CustomAppBar(title: 'Checkout'),
      bottomNavigationBar: BottomAppBar(
        color: Colors.blue,
        child: SizedBox(
          height: 60.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.white),
                onPressed: () {},
                child: Text(
                  "ORDER NOW",
                  style: Theme.of(context).textTheme.headline3,
                ),
              ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'CUSTOMER INFORMATION',
              style: Theme.of(context).textTheme.headline4,
            ),
            CustomTextFormField(
              title: 'Email',
              onChanged: (value) {},
            ),
            CustomTextFormField(
              title: 'Full Name',
              onChanged: (value) {},
            ),
            const SizedBox(height: 10),
            Text(
              'DELIVERY INFORMATION',
              style: Theme.of(context).textTheme.headline4,
            ),
            CustomTextFormField(
              title: 'Address',
              onChanged: (value) {},
            ),
            CustomTextFormField(
              title: 'City',
              onChanged: (value) {},
            ),
            CustomTextFormField(
              title: 'Country',
              onChanged: (value) {},
            ),
            CustomTextFormField(
              title: 'ZIP Code',
              onChanged: (value) {},
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
        ),
      ),
    );
  }
}
