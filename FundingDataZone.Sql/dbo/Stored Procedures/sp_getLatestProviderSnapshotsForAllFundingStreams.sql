

CREATE PROCEDURE [dbo].[sp_getLatestProviderSnapshotsForAllFundingStreams]
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
		rownum = ROW_NUMBER() OVER (PARTITION BY  ps.[fundingStreamId] ORDER BY ps.[targetDate] DESC, ps.[version] DESC)
	FROM dbo.ProviderSnapshot ps
)
SELECT 
	a.[providerSnapshotId], 	
	a.[name], 	
	a.[description],
	a.[version],	
	a.[targetDate],	
	a.[created],	
	fs.[fundingStreamName],	
	fs.[fundingStreamCode]
FROM ps_cte a
INNER JOIN dbo.FundingStream fs
	ON fs.fundingStreamId = a.fundingStreamId
WHERE a.rownum = 1  