import 'dart:io';

void main() {
  final basePath = 'packages/feature/home/lib';

  final folders = [
    '$basePath/data/datasources',
    '$basePath/data/models',
    '$basePath/data/repositories',
    '$basePath/domain/entities',
    '$basePath/domain/repositories',
    '$basePath/domain/usecases',
    '$basePath/presentation/bloc',
    '$basePath/presentation/pages',
    '$basePath/presentation/widgets',
  ];

  for (final folder in folders) {
    final dir = Directory(folder);
    if (!dir.existsSync()) {
      dir.createSync(recursive: true);
      print('✅ Created: $folder');
    } else {
      print('⚠️ Already exists: $folder');
    }
  }

  print('\n🎉 Clean architecture folders generated successfully in package!');
}
