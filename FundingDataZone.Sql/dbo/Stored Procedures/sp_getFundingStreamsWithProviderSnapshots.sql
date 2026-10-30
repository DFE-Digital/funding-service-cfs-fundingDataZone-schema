CREATE PROCEDURE [dbo].[sp_getFundingStreamsWithProviderSnapshots]
AS

SELECT DISTINCT fs.fundingStreamCode AS [FundingStreamId]
FROM dbo.FundingStream fs
INNER JOIN dbo.ProviderSnapshot ps 
ON ps.fundingStreamId = fs.fundingStreamId