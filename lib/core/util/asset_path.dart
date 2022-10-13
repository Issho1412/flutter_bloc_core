const String assetRoot = 'assets/';
const String logoRoot = 'logos/';
const String iconRoot = 'icons/';
const String imageRoot = 'images/';

class Assets {
  static _Icon icon = _Icon();
  static _Image image = _Image();
  static _Logo logo = _Logo();
}

// images
class _Image {
  String img1 = _getImagePath(imageRoot + 'splash_1.png');
  String img2 = _getImagePath(imageRoot + 'splash_2.png');
  String img3 = _getImagePath(imageRoot + 'splash_3.png');
  String imgSuccess = _getImagePath(imageRoot + 'success.png');
  String imgBanner_1 = _getImagePath(imageRoot + 'banner_1.png');
  String imgBanner_2 = _getImagePath(imageRoot + 'banner_2.png');
  String imgPopular_1 = _getImagePath(imageRoot + 'img-popular-product-1.png');
  String imgPopular_2 = _getImagePath(imageRoot + 'img-popular-product-2.png');
  String imgPopular_3 = _getImagePath(imageRoot + 'img-popular-product-3.png');
  String imgPopular_4 = _getImagePath(imageRoot + 'img-popular-product-4.png');
}

// logos
class _Logo {}

// icons
class _Icon {
  String icoBell = _getImagePath(iconRoot + 'bell.svg');
  String icoBill = _getImagePath(iconRoot + 'bill.svg');
  String icoCart = _getImagePath(iconRoot + 'cart.svg');
  String icoCamera = _getImagePath(iconRoot + 'camera.svg');
  String icoDiscover = _getImagePath(iconRoot + 'discover.svg');
  String icoFlash = _getImagePath(iconRoot + 'flash.svg');
  String icoGame = _getImagePath(iconRoot + 'game.svg');
  String icoGift = _getImagePath(iconRoot + 'gift.svg');
  String icoGoogle = _getImagePath(iconRoot + 'google-icon.svg');
  String iconHeart2 = _getImagePath(iconRoot + 'heart_2.svg');
  String icoFacebook = _getImagePath(iconRoot + 'facebook.svg');
  String icoTwitter = _getImagePath(iconRoot + 'twitter.svg');
  String icoError = _getImagePath(iconRoot + 'error.svg');
}

String _getImagePath(String fileName) {
  return assetRoot + fileName;
}
