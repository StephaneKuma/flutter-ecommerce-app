import 'package:ecommerce/src/services/blocs/wish_list/wish_list_bloc.dart';
import 'package:ecommerce/src/ui/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WishListPage extends StatelessWidget {
  const WishListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Wish List'),
      body: BlocBuilder<WishListBloc, WishListState>(
        builder: (context, state) {
          if (state is WishListLoading) {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          }

          if (state is WishListLoaded) {
            return GridView.builder(
              padding: const EdgeInsets.symmetric(
                horizontal: 8.0,
                vertical: 16.0,
              ),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
                childAspectRatio: 2.4,
              ),
              itemCount: state.wishList.products.length,
              itemBuilder: (BuildContext context, int index) => Center(
                child: ProductCard(
                  product: state.wishList.products[index],
                  widthFactor: 1.1,
                  leftPosition: 100.0,
                  isWishList: true,
                ),
              ),
            );
          } else {
            return const Center(
              child: Text('Something went wrong'),
            );
          }
        },
      ),
      bottomNavigationBar: const CustomBottomAppBar(),
    );
  }
}
