///@function NodeConnect(node, child)

function NodeConnect(_node, _child)
{
	ds_list_add(_node.connectedNodes, _child);
}
