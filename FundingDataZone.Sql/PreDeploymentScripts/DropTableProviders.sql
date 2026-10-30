-- drop provider table is still has datetime column type for date opened
IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'Provider' AND COLUMN_NAME = 'DateOpened' AND DATA_TYPE = 'datetime')
	DROP TABLE [dbo].[Provider]
