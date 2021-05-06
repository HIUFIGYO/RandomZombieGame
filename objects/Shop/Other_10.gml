/// @description Start Call Extraction

isOpen = false;
shopMaskIndex = 2;
HUDCloseAllShops();

var _sequence = layer_sequence_create(GameManager.layerObject, x, y, seq_DroneTakeAwayShop);
var _sequenceInst = layer_sequence_get_instance(_sequence);
sequence_instance_override_object(_sequenceInst, Shop, id);