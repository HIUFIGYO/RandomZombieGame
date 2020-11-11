event_inherited();

UISetSize(id, sprite_get_width(sprite_index), sprite_get_height(sprite_index));
UIImageSetSprite(id, sprite_index, 0, true);
UISetPadding(id, 64, 64);
UISetAlign(id, RectAlign.Center, RectAlign.Top);