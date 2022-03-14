import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pizza_app/application/core/constants.dart';
import 'package:pizza_app/application/core/injections/injection.dart';
import 'package:pizza_app/application/menu/cubit/menu_cubit.dart';
import 'package:pizza_app/presentation/core/widgets/other/app_bar.dart';
import 'package:pizza_app/presentation/core/widgets/other/none.dart';
import 'package:pizza_app/presentation/menu/widgets/menu_loading_placeholder.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<MenuCubit>(
      create: (context) => getIt<MenuCubit>(),
      child: Scaffold(
        appBar: PizzaBar(),
        drawer: const Drawer(),
        body: const MenuBody(),
      ),
    );
  }
}

class MenuBody extends StatefulWidget {
  const MenuBody({Key? key}) : super(key: key);

  @override
  State<MenuBody> createState() => _MenuBodyState();
}

class _MenuBodyState extends State<MenuBody> {
  @override
  void initState() {
    context.read<MenuCubit>().loadMenu();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MenuCubit, MenuState>(
      listener: (context, state) {
        log.d(state);
      },
      builder: (context, state) {
        return const MenuLoadingPlaceholder();
      },
    );
  }
}
