/// @function log( message, [colour=c_white] )
/// @argument message {string} The message to print
/// @argument [colour=c_white] {real} An integer representing the colour

// Collect index if possible
var _debugValue = string(argument[0]), _debugIndex = -1;
if (string_pos("$", _debugValue) == 1) {
	for(var i = 2; i < string_length(_debugValue); ++i) {
		var _debugChar = ord(string_char_at(_debugValue, i));
		if (_debugChar < 48 || _debugChar > 57) break;
	}
	_debugIndex = real(string_copy(_debugValue, 2, i - 2));
	_debugValue = string_copy(_debugValue, i, string_length(_debugValue));
}
	
// Update repeat messages
for(var i = 0; i < ds_list_size(nommLog.debugLog); i++) {
	var _debugMessage = nommLog.debugLog[| i], _debugUpdate = false;
	if (_debugMessage[DebugMessage.Index] > -1 && _debugMessage[DebugMessage.Index] == _debugIndex) {
		_debugMessage[@ DebugMessage.Value] = _debugValue;
		_debugUpdate = true;
	} else if (_debugMessage[DebugMessage.Value] == _debugValue) {
		_debugMessage[@ DebugMessage.Count]++;
		_debugUpdate = true;
	}
		
	if (_debugUpdate == true) {
		_debugMessage[@ DebugMessage.Tick] = room_speed * 3;
		if (argument_count > 1) _debugMessage[@ DebugMessage.Colour] = argument[1];
		exit;
	}
}
	
// New message, add to log
show_debug_message(_debugValue);
ds_list_add(nommLog.debugLog, [
	_debugIndex,
	_debugValue,
	(argument_count > 1 ? argument[1] : c_white),
	1,
	-32,
	1,
	room_speed * 3,
	1 + string_count("\n", _debugValue)
]);