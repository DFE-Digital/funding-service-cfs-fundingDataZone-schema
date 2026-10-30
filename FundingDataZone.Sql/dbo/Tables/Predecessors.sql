CREATE TABLE [dbo].[Predecessors]
(
	[Id] INT NOT NULL PRIMARY KEY IDENTITY, 
    [ProviderId] INT NOT NULL, 
    [UKPRN] VARCHAR(16) NOT NULL, 
    CONSTRAINT [FK_Predecessors_ToProvider] FOREIGN KEY ([ProviderId]) REFERENCES [Provider]([Id])
)

GO

CREATE UNIQUE INDEX [IX_Predecessors_Unique] ON [dbo].[Predecessors] ([ProviderId], [UKPRN])

GO

CREATE INDEX [IX_Predecessors_ProviderId] ON [dbo].[Predecessors] ([ProviderId])
