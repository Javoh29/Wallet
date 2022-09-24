abstract class Assets {
  const Assets._();

  // ignore: library_private_types_in_public_api
  static _Icons get icons => const _Icons();

  // ignore: library_private_types_in_public_api
  static _Images get images => const _Images();
}

abstract class _AssetsHolder {
  final String basePath;

  const _AssetsHolder(this.basePath);
}

class _Icons extends _AssetsHolder {
  const _Icons() : super('assets/icons');
  String get back => '$basePath/ic_back.png';

  String get home => '$basePath/ic_home.svg';

  String get wallet => '$basePath/ic_wallet.svg';

  String get chat => '$basePath/ic_chat.svg';

  String get shape => '$basePath/ic_shape.svg';

  String get exchange => '$basePath/ic_exchange.svg';

  String get send => '$basePath/ic_send.svg';

  String get delete => '$basePath/ic_delete.png';
}

class _Images extends _AssetsHolder {
  const _Images() : super('assets/images');
  String get fingerPrint => '$basePath/finger_print.png';

  String get user => '$basePath/img_user.png';

  String get profileOne => '$basePath/profile_one.png';

  String get profileTwo => '$basePath/profile_two.png';

  String get profileThree => '$basePath/profile_three.png';
  String get profileFour => '$basePath/profile_four.png';
  String get profileFive => '$basePath/profile_five.png';

  String get bgGrdient => '$basePath/bg_gradient.png';

  String get bgDoubleCricle => '$basePath/bg_double_circle.png';
}
