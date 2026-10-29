CREATE TABLE [dbo].[Successors]
(
	[Id] INT NOT NULL PRIMARY KEY IDENTITY, 
    [ProviderId] INT NOT NULL, 
    [UKPRN] VARCHAR(16) NOT NULL, 
    CONSTRAINT [FK_Successors_ToProvider] FOREIGN KEY ([ProviderId]) REFERENCES [Provider]([Id])
)

GO

CREATE UNIQUE INDEX [IX_Successors_Unique] ON [dbo].[Successors] ([ProviderId], [UKPRN])

GO

CREATE INDEX [IX_Successors_ProviderId] ON [dbo].[Successors] ([ProviderId])
