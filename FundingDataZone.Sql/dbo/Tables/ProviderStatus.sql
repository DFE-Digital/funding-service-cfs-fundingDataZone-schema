CREATE TABLE [dbo].[ProviderStatus] (
    [ProviderStatusId]   INT           NOT NULL,
    [ProviderStatusName] VARCHAR (128) NOT NULL,
    CONSTRAINT [PK_ProviderStatus] PRIMARY KEY CLUSTERED ([ProviderStatusId] ASC)
);

