import 'package:flutter_full_course/data/service/base_service.dart';

class UploadService extends ServiceBase<String> {
  final String path;

  UploadService(this.path);

  @override
  Future<String> call() async {
    final result = await upload('upload', 'photo', path);
    return result['data']['url'];
  }
}
