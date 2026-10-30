
CREATE PROCEDURE [dbo].[sp_getDatasetByCode] --'DSGCensus1', 1

@datasetCode varchar(10) ,
@version int

AS

SELECT DISTINCT SysTbls.name as datasetName
FROM sys.tables AS SysTbls

   INNER JOIN sys.extended_properties AS ExtProp

         ON ExtProp.major_id = SysTbls.[object_id]
WHERE exists (Select 1  
				FROM  sys.extended_properties AS ExtProp
					WHERE ExtProp.major_id = SysTbls.[object_id]				
					and (ExtProp.name = 'DatasetCode' AND convert(varchar,ExtProp.value) =@datasetCode)				
					)
 AND 

 exists (Select 1  
				FROM  sys.extended_properties AS ExtProp
					WHERE ExtProp.major_id = SysTbls.[object_id]
					and ( ExtProp.name = 'SnapshotVersion' AND convert(int,ExtProp.value) = @version)
					)

 
order by 1