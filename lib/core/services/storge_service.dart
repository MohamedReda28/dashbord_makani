
import 'dart:io';

abstract class StorgeService {
  Future<String> UploadFile(File file,String path);
}
