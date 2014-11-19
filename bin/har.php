<?php
$json = json_decode(file_get_contents('/Users/tkm_ymmt_rebelt/bin/n'));
//var_dump($json->log);
foreach($json->log->entries as $j){
	echo $j->request->url . "\n";
}
	
	
