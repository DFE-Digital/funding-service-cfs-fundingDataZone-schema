
CREATE PROCEDURE [dbo].[sp_getFundingStreamsWithDatasets]


AS

SELECT DISTINCT ExtProp.value as FundingStream
FROM sys.tables AS SysTbls

   INNER JOIN sys.extended_properties AS ExtProp

         ON ExtProp.major_id = SysTbls.[object_id]
WHERE exists (Select 1  
				FROM  sys.extended_properties AS ExtProp
					WHERE ExtProp.major_id = SysTbls.[object_id]
					and ExtProp.name = 'FundingStreamId'
					--and convert(varchar,ExtProp.value) = isnull(@fundingStreamId, convert(varchar,ExtProp.value))
					)
AND  ExtProp.name = 'FundingStreamId'
 
order by 1