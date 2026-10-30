
CREATE PROCEDURE [dbo].[sp_getDatasetsByFundingStream]

@fundingStreamId varchar(10) = NULL

AS

SELECT DISTINCT SysTbls.name as datasetName, ExtProp.name as extendedProperty, ExtProp.value as extendedPropertyValue
FROM sys.tables AS SysTbls

   INNER JOIN sys.extended_properties AS ExtProp

         ON ExtProp.major_id = SysTbls.[object_id]
WHERE exists (Select 1  
				FROM  sys.extended_properties AS ExtProp
					WHERE ExtProp.major_id = SysTbls.[object_id]
					and ExtProp.name = 'FundingStreamId'
					and convert(varchar,ExtProp.value) = isnull(@fundingStreamId, convert(varchar,ExtProp.value))
					)
 
order by 1,2,3