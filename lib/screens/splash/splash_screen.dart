import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:sb_template_flutter/router/router_extensions.dart';

// Project - Bloc
import 'bloc/fake_loader_bloc.dart';
import 'bloc/fake_loader_event.dart';
import 'bloc/fake_loader_state.dart';

// Project - Helpers
import '../../helpers/theme/app_colors.dart';
import '../../helpers/theme/app_design.dart';
import '../../helpers/router/app_router.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          FakeLoaderBloc()
            ..add(const StartFakeLoadingEvent(durationSeconds: 3)),
      child: BlocConsumer<FakeLoaderBloc, FakeLoaderState>(
        listener: (context, state) => {
          if (state is FakeLoaderCompletedState)
            context.goTo(AppRouter.typographyRoute),
        },
        builder: (context, state) => Scaffold(
          backgroundColor: AppColors.of(context).background,
          body: Center(
            child: Container(
              width: 300,
              padding: AppDesign.paddingXXL,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: AppDesign.borderRadiusXL,
                boxShadow: AppDesign.shadowMedium,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    'assets/sb-template-flutter-logo.png',
                    width: 120,
                    height: 120,
                  ),
                  const SizedBox(height: AppDesign.xl),
                  if (state is FakeLoaderLoadingState)
                    SizedBox(
                      width: 40,
                      height: 40,
                      child: CircularProgressIndicator(
                        strokeWidth: 3,
                        valueColor: AlwaysStoppedAnimation<Color>(
                          AppColors.of(context).appBarBackground,
                        ),
                      ),
                    )
                  else
                    const SizedBox(width: 40, height: 40),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
