// Update all debug messages
debugRect[0] = 0;
draw_set_font(fntDebug);
var _debugSpacing = 0;
for(var i = 0; i < ds_list_size(debugLog); i++) {
	var _debugMessage = debugLog[| i];
	if (_debugMessage[@ DebugMessage.Tick]-- > 0) {
		_debugMessage[@ DebugMessage.Offset] = lerp(_debugMessage[DebugMessage.Offset], _debugSpacing * debugSpacing, 0.1);
	} else {
		_debugMessage[@ DebugMessage.Alpha] -= 0.09;
		if (_debugMessage[@ DebugMessage.Alpha] < 0) {
			ds_list_delete(debugLog, i--);	
		}
	}
	_debugSpacing += _debugMessage[DebugMessage.Spacing];
	var _debugValue = string(_debugMessage[DebugMessage.Value]);
	if (_debugMessage[DebugMessage.Count] > 1) _debugValue = string(_debugMessage[DebugMessage.Count]) + " × " + _debugValue;
	debugRect[0] = max(debugRect[0], string_width(_debugValue));
}
debugRect[1] = _debugSpacing * debugSpacing;

// Example messages
log("$100FPS: " + string(fps) + " (" + string(fps_real) + ")");
if (keyboard_check_pressed(vk_space) == true) {
	log("You pressed space!", c_purple);	
} else if (keyboard_check_pressed(vk_up) == true) {
	log("You pressed the up key!\nA real pro, aren't ya?", irandom(c_white));
} else if (keyboard_check(vk_down) == true) {
	log("You're holding the down key, but only 1 message shows...", c_lime);
}