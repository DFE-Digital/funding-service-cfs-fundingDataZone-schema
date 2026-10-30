CREATE PROCEDURE [dbo].[sp_PopulateProviderSnapshotFundingPeriodBySnapshotId] 
    @ProviderSnapshotId INT
AS

DECLARE @ProviderSnapshotName VARCHAR(128)
DECLARE @ProviderSnapshotFundingStreamSeperatorIndex int
DECLARE @ProviderSnapshotFundingPeriodSeperatorIndex int
DECLARE @ProviderSnapshotFundingPeriodName VARCHAR(128)

DECLARE ProviderSnapshots CURSOR FAST_FORWARD FOR
SELECT ProviderSnapshotId, Name from [dbo].[ProviderSnapshot] WHERE [ProviderSnapshotId] = @ProviderSnapshotId;

OPEN ProviderSnapshots;

FETCH NEXT FROM ProviderSnapshots INTO @ProviderSnapshotId, @ProviderSnapshotName;

WHILE @@FETCH_STATUS=0
BEGIN

    SELECT @ProviderSnapshotFundingStreamSeperatorIndex=CHARINDEX('-', @ProviderSnapshotName);
    SELECT @ProviderSnapshotFundingPeriodSeperatorIndex=CHARINDEX('_', @ProviderSnapshotName, @ProviderSnapshotFundingStreamSeperatorIndex);
    
    IF @ProviderSnapshotFundingStreamSeperatorIndex = 0 OR @ProviderSnapshotFundingPeriodSeperatorIndex = 0 
       BEGIN
          PRINT('Can not calculate funding period for ProviderSnapshotName='+@ProviderSnapshotName);
          FETCH NEXT FROM ProviderSnapshots INTO @ProviderSnapshotId, @ProviderSnapshotName;
          CONTINUE;
       END
    
    SELECT @ProviderSnapshotFundingPeriodName=SUBSTRING(@ProviderSnapshotName, @ProviderSnapshotFundingStreamSeperatorIndex+1, @ProviderSnapshotFundingPeriodSeperatorIndex-@ProviderSnapshotFundingStreamSeperatorIndex-1);

    WITH src AS(
        SELECT @ProviderSnapshotId AS ProviderSnapshotId,
        @ProviderSnapshotFundingPeriodName AS FundingPeriodName
    )
    MERGE INTO [dbo].[ProviderSnapshotPeriod] Trg
    USING Src
    ON Trg.ProviderSnapshotId = Src.ProviderSnapshotId
    WHEN MATCHED AND Trg.FundingPeriodName != Src.FundingPeriodName
    THEN UPDATE SET Trg.FundingPeriodName = Src.FundingPeriodName
    WHEN NOT MATCHED BY TARGET
    THEN INSERT (
            ProviderSnapshotId,
            FundingPeriodName)
        VALUES(
            Src.ProviderSnapshotId,
            Src.FundingPeriodName
        );

    FETCH NEXT FROM ProviderSnapshots INTO @ProviderSnapshotId, @ProviderSnapshotName;
END;

CLOSE ProviderSnapshots;  
DEALLOCATE ProviderSnapshots;

RETURN 0