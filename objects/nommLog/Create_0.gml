// Setup debug log
debugLog = ds_list_create();
debugRect = [0, 0];
debugSpacing = 18;
enum DebugMessage {
	Index,
	Value,
	Colour,
	Count,
	Offset,
	Alpha,
	Tick,
	Spacing
}