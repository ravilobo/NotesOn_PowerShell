﻿# code to split the array into smaller batches 
cls
$name = 'server1', 'server2', 'server3', 'server4', 'server5', 'server6', 'server7', 'server8', 'server9', 'server10', 'server11', 'server12', 'server13', 'server14', 'server15', 'server16', 'server17', 'server18', 'server19', 'server20', 'server21', 'server22', 'server23', 'server24', 'server25', 'server26', 'server27', 'server28', 'server29', 'server30', 'server31', 'server32', 'server33', 'server34', 'server35', 'server36', 'server37', 'server38', 'server39', 'server40', 'server41', 'server42', 'server43', 'server44', 'server45', 'server46', 'server47', 'server48', 'server49', 'server50', 'server51', 'server52', 'server53', 'server54', 'server55', 'server56', 'server57', 'server58', 'server59', 'server60', 'server61', 'server62', 'server63', 'server64', 'server65', 'server66', 'server67', 'server68', 'server69', 'server70', 'server71', 'server72', 'server73', 'server74', 'server75', 'server76', 'server77', 'server78', 'server79', 'server80', 'server81', 'server82', 'server83', 'server84', 'server85', 'server86', 'server87', 'server88', 'server89', 'server90', 'server91', 'server92', 'server93', 'server94', 'server95', 'server96', 'server97', 'server98', 'server99', 'server100', 'server101', 'server102', 'server103', 'server104', 'server105', 'server106', 'server107', 'server108', 'server109', 'server110', 'server111', 'server112', 'server113', 'server114', 'server115', 'server116', 'server117', 'server118', 'server119', 'server120'
$batchsize = 50 
$batch = @()
for($i=0; $i -lt $name.length; $i+=$batchsize){ 
 $batch += ,@($name[$i..($i+$batchsize-1)]);
}

for($i=0; $i -lt $batch.Length; $i++) {
"Contents of batch:[$i]"
$batch[$i]    
}       




