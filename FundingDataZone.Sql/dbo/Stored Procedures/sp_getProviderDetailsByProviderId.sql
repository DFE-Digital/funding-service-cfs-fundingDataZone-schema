
CREATE PROCEDURE [dbo].[sp_getProviderDetailsByProviderId] 

@ProviderId varchar(50),
@ProviderSnapshotId int


AS

SELECT 
p.[Id], 
p.[providerSnapshotId], 
p.[providerId], 
p.[name], 
p.[urn], 
p.[ukprn], 
p.[upin], 
p.[establishmentNumber], 
p.[dfeEstablishmentNumber], 
p.[authority], 
p.[providerType], 
p.[providerSubType], 
p.[dateOpened], 
p.[dateClosed], 
p.[providerProfileIdType], 
p.[laCode], 
p.[laOrg],
p.[navVendorNo], 
p.[crmAccountId], 
p.[legalName], 
p.[phaseOfEducation], 
p.[reasonEstablishmentOpened], 
p.[reasonEstablishmentClosed], 
p.[town], 
p.[postcode], 
p.[trustName], 
p.[trustCode], 
p.[companiesHouseNumber], 
p.[groupIdNumber], 
p.[rscRegionName], 
p.[rscRegionCode], 
p.[governmentOfficeRegionName], 
p.[governmentOfficeRegionCode], 
p.[districtName], 
p.[districtCode], 
p.[wardName], 
p.[wardCode],
p.[censusWardName], 
p.[censusWardCode], 
p.[middleSuperOutputAreaName], 
p.[middleSuperOutputAreaCode], 
p.[lowerSuperOutputAreaName], 
p.[lowerSuperOutputAreaCode], 
p.[parliamentaryConstituencyName], 
p.[parliamentaryConstituencyCode], 
p.[countryCode], 
p.[countryName], 
p.[localGovernmentGroupTypeCode], 
p.[localGovernmentGroupTypeName], 
p.[trustStatus], 
p.[providerStatusId], 
p.[street],
p.[locality],
p.[address3],
p.[providerTypeCode],            
p.[providerSubTypeCode],
p.[statusCode],          
p.[reasonEstablishmentOpenedCode],
p.[reasonEstablishmentClosedCode],
p.[phaseOfEducationCode],
p.[statutoryLowAge],               
p.[statutoryHighAge],              
p.[officialSixthFormCode],         
p.[officialSixthFormName],         
p.[previousLaCode],                
p.[previousLaName],                
p.[previousEstablishmentNumber],
p.[furtherEducationTypeCode],
p.[furtherEducationTypeName],
p.[londonRegionName],
p.[londonRegionCode],
ps.[providerStatusName],
po.[paymentOrganisationId] as [paymentOrganisationId], 

po.[Name] as paymentOrganisationName, 
po.[Ukprn] as paymentOrganisationUkprn, 
po.[Upin] as paymentOrganisationUpin, 
po.[TrustCode] as paymentOrganisationTrustCode, 
po.[LaCode] as paymentOrganisationLaCode, 
po.[LaOrg] as paymentOrganisationLaOrg,
po.[Urn] as paymentOrganisationUrn, 
po.[paymentOrganisationType] as paymentOrganisationType, 
po.[CompanyHouseNumber] as paymentOrganisationCompanyHouseNumber,
(SELECT STRING_AGG(pr.[UKPRN], ',') 
 FROM [dbo].[Predecessors] pr 
 WHERE pr.ProviderId = p.Id) as Predecessors,
(SELECT STRING_AGG(sr.[UKPRN], ',') 
 FROM [dbo].[Successors] sr 
 WHERE sr.ProviderId = p.Id) as Successors

FROM dbo.Provider p
LEFT JOIN dbo.PaymentOrganisation po on p.paymentOrganisationId = po.paymentOrganisationId
and p.ProviderSnapshotId = po.ProviderSnapshotId

LEFT JOIN [dbo].[ProviderStatus] ps on ps.ProviderStatusId = p.[ProviderStatusId]

WHERE p.ProviderId = @ProviderId
AND
p.ProviderSnapshotId = @ProviderSnapshotId

order by 1