
CREATE PROCEDURE [dbo].[sp_getLatestProviderSnapshotsForAllFundingStreamsWithFundingPeriod]
AS

WITH ps_cte
AS 
(
	SELECT
		ps.[providerSnapshotId], 	
		ps.[name], 	
		ps.[description],
		ps.[version],	
		ps.[targetDate],	
		ps.[created],
		ps.[fundingStreamId],
		psp.[FundingPeriodName],
		rownum = ROW_NUMBER() OVER (PARTITION BY  ps.[fundingStreamId], psp.[FundingPeriodName] ORDER BY ps.[targetDate] DESC, ps.[version] DESC)
	FROM dbo.ProviderSnapshot ps
	INNER JOIN [dbo].[ProviderSnapshotPeriod] psp
		ON ps.ProviderSnapshotId = psp.ProviderSnapshotId
)
SELECT 
	a.[providerSnapshotId], 	
	a.[name], 	
	a.[description],
	a.[version],	
	a.[targetDate],	
	a.[created],	
	fs.[fundingStreamName],	
	fs.[fundingStreamCode],
	a.[FundingPeriodName]
FROM ps_cte a
INNER JOIN dbo.FundingStream fs
	ON fs.fundingStreamId = a.fundingStreamId
WHERE a.rownum = 1