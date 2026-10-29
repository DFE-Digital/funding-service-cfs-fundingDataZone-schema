-- rename Provider table so we can do destructive change then copy data back in the post deploy script
IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'Provider' AND COLUMN_NAME = 'DateOpened' AND DATA_TYPE = 'datetime')
BEGIN
	SELECT * INTO [ProviderCopy] FROM [dbo].[Provider]
	TRUNCATE TABLE [dbo].[Provider]
END
