<?php

use XdgBaseDir\Xdg;

$xdg = new Xdg();
$config->setHistoryFile($xdg->getHomeCacheDir() . '/psysh/history');


return [
    'historySize' => 10000,
    'requireSemicolons' => true,
    'updateCheck' => 'never',
    'useBracketedPaste' => true,
];
