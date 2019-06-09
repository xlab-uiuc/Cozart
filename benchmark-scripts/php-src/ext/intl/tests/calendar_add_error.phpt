--TEST--
IntlCalendar::add(): bad arguments
--INI--
date.timezone=Atlantic/Azores
--SKIPIF--
<?php
if (!extension_loaded('intl'))
	die('skip intl extension not enabled');
--FILE--
<?php
ini_set("intl.error_level", E_WARNING);

var_dump(intlcal_add(1, 2, 3));
--EXPECTF--
Fatal error: Uncaught TypeError: Argument 1 passed to intlcal_add() must be an instance of IntlCalendar, int given in %s:%d
Stack trace:
#0 %s(%d): intlcal_add(1, 2, 3)
#1 {main}
  thrown in %s on line %d