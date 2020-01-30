if (ds_list_size(debugLog) > 0) {
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	draw_set_font(fntDebug);
	draw_set_alpha(0.3);
	draw_rectangle_colour(0, 0, debugRect[0] + 8, debugRect[1] + 4, c_black, c_black, c_black, c_black, false);
	draw_set_alpha(1);
	for(var i = 0; i < ds_list_size(debugLog); i++) {
		var _debugMessage = debugLog[| i], _debugValue = _debugMessage[DebugMessage.Value], _debugColour = _debugMessage[DebugMessage.Colour];
		if (_debugMessage[DebugMessage.Count] > 1) {
			_debugValue = string(_debugMessage[DebugMessage.Count]) + " × " + _debugValue;	
		}
		draw_text_colour(4, 2 + _debugMessage[DebugMessage.Offset], _debugValue, _debugColour, _debugColour, _debugColour, _debugColour, _debugMessage[DebugMessage.Alpha]);
	}
}