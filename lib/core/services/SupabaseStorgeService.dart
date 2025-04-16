import 'dart:io';
import 'package:makani_dashbord/core/services/storge_service.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:path/path.dart' as b;
import '../uitels/backend Impoint.dart';

class SupabaseStorgeService implements StorgeService {
  static late Supabase _supabase;
  static CreatBucket(String nameBucket) async {
    var buckets = await _supabase.client.storage.listBuckets();
    bool isBucketExsis = false;
    for (var bucket in buckets) {
      if (bucket.id == nameBucket) {
        isBucketExsis = true;
        break;
      }
    }
    if (!isBucketExsis) {
      await _supabase.client.storage.createBucket(nameBucket);
    }
  }

  static initSupebase() async {
    _supabase = await Supabase.initialize(
      url: BackEndImpoint.projectURLSupa,
      anonKey: BackEndImpoint.apiKeySupa,
    );
  }

  @override
  Future<String> UploadFile(File file, String path) async {
    var filename = b.basename(file.path);
    var fileExtintin = b.extension(file.path);
    var result = _supabase.client.storage
        .from(BackEndImpoint.fruits_imageBucket)
        .upload('$path/$filename.$fileExtintin', file);
    final String publicUrl = await _supabase.client.storage
        .from(BackEndImpoint.fruits_imageBucket)
        .getPublicUrl('$path/$filename.$fileExtintin');

    return publicUrl;
  }
}
