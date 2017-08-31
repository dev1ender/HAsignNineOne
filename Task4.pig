file = load '/home/acadgild/Assignments/HAsignNineOne/petrol_dataset' USING PigStorage(',') AS (DistID:chararray,DistName:chararray,BuyRate:chararray,SellRate:chararray,VolumeIN:int,VolumeOUT:int,Year:int);
DistNameGroup = Group file BY DistName;
Res = FOREACH DistNameGroup GENERATE group , SUM(file.VolumeOUT) as OUT;
OrderRes = ORDER Res BY OUT;
LimitRes = LIMIT OrderRes 1;
dump LimitRes;
