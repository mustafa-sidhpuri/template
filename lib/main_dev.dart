import 'package:flutter/material.dart';
import 'package:template/flvor_config.dart';

import 'main_common.dart';

main(){
  mainCommon(
    // TODO: change data as you please
    FlavorConfig()
        ..theme = ThemeData.light()
        ..appTitle = "Dev"
  );
}