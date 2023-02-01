import 'package:daytrack_apps/core/service_locator/service_locator.dart';
import 'package:daytrack_apps/features/authentication/presentation/user_info_header/bloc/user_info_header_bloc.dart';
import 'package:daytrack_apps/gen/assets.gen.dart';
import 'package:daytrack_apps/gen/fonts.gen.dart';
import 'package:daytrack_apps/shared/calculate_size.dart';
import 'package:daytrack_apps/shared/string_value.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserInfoHeader extends StatelessWidget {
  const UserInfoHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl.get<UserInfoHeaderBloc>(),
      child: const UserInfoBody(),
    );
  }
}

class UserInfoBody extends StatefulWidget {
  const UserInfoBody({
    Key? key,
  }) : super(key: key);

  @override
  State<UserInfoBody> createState() => _UserInfoBodyState();
}

class _UserInfoBodyState extends State<UserInfoBody> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<UserInfoHeaderBloc>(context).add(
      UserInfoHeaderFetch(),
    );
  }

  ImageProvider _getImage(UserInfoHeaderState state) {
    if (state is UserInfoHeaderLoaded && state.user.avatar != null) {
      return MemoryImage(state.user.avatar!);
    }
    return AssetImage(Assets.images.avatar.path);
  }

  String _getGreetings() {
    int hour = DateTime.now().hour;
    if (hour >= 4 && hour <= 10) {
      return StringValue.greetingMorning;
    }
    if (hour >= 11 && hour <= 15) {
      return StringValue.greetingAfternoon;
    }
    if (hour >= 15 && hour <= 18) {
      return StringValue.greetingAfternoonSecond;
    }
    return StringValue.greetingEvening;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserInfoHeaderBloc, UserInfoHeaderState>(
      builder: (context, state) {
        return Row(
          children: [
            CircleAvatar(
              radius: CalculateSize.getWidth(22),
              backgroundImage: _getImage(state),
              backgroundColor: Colors.transparent,
            ),
            SizedBox(
              width: CalculateSize.getWidth(8),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  _getGreetings(),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.subtitle2!.copyWith(
                        fontFamily: FontFamily.montserrat,
                        color: Theme.of(context).canvasColor,
                      ),
                ),
                Text(
                  (state is UserInfoHeaderLoaded) ? state.user.name : '...',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.headline5!.copyWith(
                        fontSize: 16,
                        color: Theme.of(context).canvasColor,
                      ),
                ),
              ],
            ),
            const Spacer(),
            const Icon(
              Icons.notifications_outlined,
              color: Colors.white,
            ),
          ],
        );
      },
    );
  }
}
