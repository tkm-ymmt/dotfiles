<?php
$json = json_decode(file_get_contents('/Users/takumi/Desktop/fun'));
//var_dump($json->log);
foreach($json->log->entries as $j){
	echo $j->request->url . "\n";
}
	
	
