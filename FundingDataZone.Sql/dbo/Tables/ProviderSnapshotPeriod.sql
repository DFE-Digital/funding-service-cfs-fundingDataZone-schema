CREATE TABLE [dbo].[ProviderSnapshotPeriod]
(
    [ProviderSnapshotId] INT NOT NULL, 
    [FundingPeriodName] VARCHAR(128) NULL, 
    PRIMARY KEY ([ProviderSnapshotId])
);
