enum Images {
  field_csharp.field('csharp'),
  field_dart.field('dart'),
  field_flutter.field('flutter'),
  field_java.field('java'),
  field_kotlin.field('kotlin'),
  field_minecraft.field('minecraft'),
  field_unity3d.field('unity3d'),
  ;

  final String path;

  const Images(String path) : path = 'assets/images/$path';

  const Images.field(String fileName) : this('field/$fileName.png');
}
