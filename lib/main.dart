import 'package:flutter/material.dart';
import 'package:fwc_album/app/core/config/env/env.dart';
import 'package:fwc_album/app/fwc_album_app.dart';

Future<void> main() async {
  await Env.i.load();
  runApp(FwcAlbumApp());
}
