event_inherited();

UISetPosition(id, 0, 64);
UISetSize(id, sprite_get_width(sprite_index), sprite_get_height(sprite_index));
UIImageSetSprite(id, sprite_index, 0, true);
UISetAlign(id, RectAlign.Center, RectAlign.Top);
