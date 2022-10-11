import 'package:flutter/material.dart';
import 'package:fwc_album/app/core/config/env/env.dart';

import 'app/fwc_album_app.dart';

void main() async {
  await Env.i.load();
  runApp(const FwcAlbumApp());
}
