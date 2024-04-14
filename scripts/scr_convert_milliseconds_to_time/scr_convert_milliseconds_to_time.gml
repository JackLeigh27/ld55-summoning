function scr_convert_milliseconds_to_time(_milliseconds)
{
	var _hours = 0;
	while(_milliseconds > 3600000)
	{
		_hours++;
		_milliseconds -= 3600000;
	}
	_hours = string_replace_all(string_format(_hours,2,0)," ","0");
	
	var _minutes = 0;
	while(_milliseconds > 60000)
	{
		_minutes++;
		_milliseconds -= 60000;
	}
	_minutes = string_replace_all(string_format(_minutes,2,0)," ","0");
	
	var _seconds = 0;
	while(_milliseconds > 1000)
	{
		_seconds++;
		_milliseconds -= 1000;
	}
	_seconds = string_replace_all(string_format(_seconds,2,0)," ","0");
	
	_milliseconds = string_replace_all(string_format(_milliseconds,3,0)," ","0");
	
	if(_hours > 0)
		return string("{0}:{1}:{2}.{3}", _hours, _minutes, _seconds, _milliseconds)
	else
		return string("{0}:{1}.{2}", _minutes, _seconds, _milliseconds);
}