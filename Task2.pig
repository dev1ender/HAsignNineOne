file = load '/home/acadgild/Assignments/HAsignNineOne/petrol_dataset' USING PigStorage(',') AS (DistID:chararray,DistName:chararray,BuyRate:chararray,SellRate:chararray,VolumeIN:int,VolumeOUT:int,Year:int);
DistIdGroup = Group file BY DistID;
VolumeOUTGroup = FOREACH DistIdGroup GENERATE group, SUM(file.VolumeOUT) as OUT;
OrderResult = ORDER VolumeOUTGroup BY OUT;
LimitResult = LIMIT OrderResult 10;
dump LimitResult;

