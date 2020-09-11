class TileModel {
  String imageAssetPath;
  bool isSelected;
  bool ok;
  TileModel({this.imageAssetPath, this.isSelected, this.ok});

  void setImageAssetPath(String getImageAssetPath) {
    imageAssetPath = getImageAssetPath;
  }

  void setIsSelected(bool getIsSelected) {
    isSelected = getIsSelected;
  }

  void setOk(bool getOk) {
    ok = getOk;
  }

  String getImageAssetPath() {
    return imageAssetPath;
  }

  bool getIsSelected() {
    return isSelected;
  }

  bool getOk() {
    return ok;
  }
}
