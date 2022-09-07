import 'dart:ui';

import 'package:flame/game.dart';
import 'package:com.roy93group.flutter_tutorial/sample/game/ray_world/components/player.dart';
import 'package:com.roy93group.flutter_tutorial/sample/game/ray_world/components/world.dart';
import 'package:com.roy93group.flutter_tutorial/sample/game/ray_world/components/world_collidable.dart';
import 'package:com.roy93group.flutter_tutorial/sample/game/ray_world/helpers/direction.dart';
import 'package:com.roy93group.flutter_tutorial/sample/game/ray_world/helpers/map_loader.dart';

/**
 * Created by Loitp on 09,August,2022
 * Galaxy One company,
 * Vietnam
 * +840766040293
 * freuss47@gmail.com
 */
class RayWorldGame extends FlameGame with HasCollidables{
  final Player _player = Player();
  final World _world = World();

  @override
  Future<void> onLoad() async {
    super.onLoad();
    await add(_world);
    add(_player);
    addWorldCollision();

    _player.position = _world.size / 2;
    camera.followComponent(
      _player,
      worldBounds: Rect.fromLTRB(0, 0, _world.size.x, _world.size.y),
    );
  }

  void onJoypadDirectionChanged(Direction direction) {
    _player.direction = direction;
  }

  void addWorldCollision() async =>
      (await MapLoader.readRayWorldCollisionMap()).forEach((rect) {
        add(WorldCollidable()
          ..position = Vector2(rect.left, rect.top)
          ..width = rect.width
          ..height = rect.height);
      });
}