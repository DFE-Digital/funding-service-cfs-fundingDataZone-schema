CREATE TABLE [dbo].[FundingStream] (
    [FundingStreamId]   INT           IDENTITY (1, 1) NOT NULL,
    [FundingStreamName] VARCHAR (128) NOT NULL,
    [FundingStreamCode] VARCHAR (10)  NOT NULL,
    CONSTRAINT [PK_FundingStreams] PRIMARY KEY CLUSTERED ([FundingStreamId] ASC),
    CONSTRAINT [AK_FundingStream_FundingStreamName] UNIQUE ([FundingStreamName]),
    CONSTRAINT [AK_FundingStream_FundingStreamCode] UNIQUE ([FundingStreamCode])
);

