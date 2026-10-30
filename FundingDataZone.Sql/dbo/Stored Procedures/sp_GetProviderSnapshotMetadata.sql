CREATE PROCEDURE [dbo].[sp_GetProviderSnapshotMetadata]
            @ProviderSnapshotId INT
AS

SELECT      ps.[providerSnapshotId] AS [ProviderSnapshotId], 	
            ps.[name] AS [Name], 	
            ps.[description] AS [Description],
            ps.[version] AS [Version],	
            ps.[targetDate] AS [TargetDate],	
            ps.[created] AS [Created],	
            fs.[fundingStreamName] AS [FundingStreamName],	
            fs.[fundingStreamCode] AS [FundingStreamCode]
FROM        dbo.[ProviderSnapshot] ps
INNER JOIN  dbo.[FundingStream] fs 
ON          fs.FundingStreamId = ps.FundingStreamId
WHERE       ps.[providerSnapshotId] = @ProviderSnapshotId