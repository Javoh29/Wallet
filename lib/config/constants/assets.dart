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

  String get home => '$basePath/ic_home.svg';

  String get wallet => '$basePath/ic_wallet.svg';

  String get chat => '$basePath/ic_chat.svg';

  String get shape => '$basePath/ic_shape.svg';
}

class _Images extends _AssetsHolder {
  const _Images() : super('assets/images');

  String get user => '$basePath/img_user.png';

  String get profileOne => '$basePath/profile_one.png';

  String get profileTwo => '$basePath/profile_two.png';
}
