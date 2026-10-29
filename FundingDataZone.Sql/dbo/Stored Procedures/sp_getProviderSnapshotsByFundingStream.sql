
CREATE PROCEDURE [dbo].[sp_getProviderSnapshotsByFundingStream]

@FundingStreamId varchar(10) = NULL,
@FundingPeriodName varchar(20) = NULL
AS

IF (@FundingPeriodName is null)
BEGIN
  SELECT 
ps.[providerSnapshotId], 	
ps.[name], 	
ps.[description],
ps.[version],	
ps.[targetDate],	
ps.[created],	
fs.[fundingStreamName],	
fs.[fundingStreamCode]

FROM dbo.ProviderSnapshot ps
INNER JOIN dbo.FundingStream fs on fs.FundingStreamId = ps.FundingStreamId
WHERE fs.FundingStreamCode = isnull(@FundingStreamId,fs.FundingStreamCode )

order by 1
END
ELSE
BEGIN
   SELECT 
ps.[providerSnapshotId], 	
ps.[name], 	
ps.[description],
ps.[version],	
ps.[targetDate],	
ps.[created],	
fs.[fundingStreamName],	
fs.[fundingStreamCode]

FROM dbo.ProviderSnapshot ps
INNER JOIN dbo.FundingStream fs on fs.FundingStreamId = ps.FundingStreamId
INNER JOIN dbo.ProviderSnapshotPeriod psp on psp.ProviderSnapshotId = ps.ProviderSnapshotId
WHERE fs.FundingStreamCode = isnull(@FundingStreamId,fs.FundingStreamCode )
AND psp.FundingPeriodName = @FundingPeriodName

order by 1   
END