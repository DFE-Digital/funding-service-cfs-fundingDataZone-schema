CREATE TABLE [dbo].[PaymentOrganisation] (
    [PaymentOrganisationId]   INT            IDENTITY (1, 1) NOT NULL,
    [ProviderSnapshotId]      INT            NOT NULL,
    [Name]                    NVARCHAR (256) NOT NULL,
    [Ukprn]                   VARCHAR (16)  NULL,
    [Upin]                    VARCHAR (16)  NULL,
    [TrustCode]               VARCHAR (16)  NULL,
    [LaCode]                  VARCHAR (8)  NULL,
    [LaOrg]                   VARCHAR (8)  NULL,
    [Urn]                     VARCHAR (16)  NULL,
    [PaymentOrganisationType] VARCHAR (128)  NOT NULL,
    [CompanyHouseNumber]      VARCHAR (16)  NULL,
    CONSTRAINT [PK_ProviderOrganisation] PRIMARY KEY CLUSTERED ([PaymentOrganisationId] ASC),
    CONSTRAINT [FK_PaymentOrganisation_ProviderSnapshot] FOREIGN KEY ([ProviderSnapshotId]) REFERENCES [dbo].[ProviderSnapshot] ([ProviderSnapshotId])
);


GO

CREATE INDEX [IX_PaymentOrganisation_ProviderSnapshotId] ON [dbo].[PaymentOrganisation] ([ProviderSnapshotId])
