CREATE TABLE [dbo].[ProviderSnapshot] (
    [ProviderSnapshotId] INT           IDENTITY (1, 1) NOT NULL,
    [Name]               VARCHAR (128) NOT NULL,
    [Description]        VARCHAR (128) NOT NULL,
    [Version]            INT           NOT NULL,
    [TargetDate]         DATE          NOT NULL,
    [FundingStreamId]    INT           NOT NULL,
    [Created]            DATETIME      NOT NULL,
    CONSTRAINT [PK_ProviderSnapshot] PRIMARY KEY CLUSTERED ([ProviderSnapshotId] ASC),
    CONSTRAINT [FK_ProviderSnapshot_FundingStream] FOREIGN KEY ([FundingStreamId]) REFERENCES [dbo].[FundingStream] ([FundingStreamId]),
    CONSTRAINT [AK_ProviderSnapshot_TargetDate_Version_FundingStreamId] UNIQUE ([TargetDate], [Version], [FundingStreamId])
);

