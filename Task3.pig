file = load '/home/acadgild/Assignments/HAsignNineOne/petrol_dataset' USING PigStorage(',') AS (DistID:chararray,DistName:chararray,BuyRate:chararray,SellRate:chararray,VolumeIN:int,VolumeOUT:int,Year:int);
GroupData= GROUP file BY (DistID,Year);
GenerateRecord = FOREACH GroupData Generate file.DistID as ID,file.Year as Year ,SUM(file.VolumeIN) as consumption;
orderRecord= ORDER GenerateRecord BY consumption DESC;
Result = lIMIT orderRecord 10;
dump Result;

