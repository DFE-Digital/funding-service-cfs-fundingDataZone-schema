CREATE PROCEDURE [dbo].[sp_GetPaymentOrganisationDetailsBySnapshotId] 
    @PaymentOrganisationType NVARCHAR(255),
    @ProviderSnapshotId INT
AS

SELECT  po.[paymentOrganisationId] AS [paymentOrganisationId],
        po.[providerSnapshotId] AS [ProviderSnapshotId],
        po.[laCode] AS [LaCode],
        po.[name] AS [Name],
        po.[paymentOrganisationType] AS [PaymentOrganisationType],
        po.[ukprn] AS [Ukprn],
        po.[upin] AS [Upin],
        po.[trustCode] AS [TrustCode],
        po.[urn] AS [Urn],
        po.[laCode] AS [LaCode],
        po.[laOrg] AS [LaOrg],
        po.[companyHouseNumber] AS [CompanyHouseNumber]
FROM    dbo.[PaymentOrganisation] po
WHERE   po.[paymentOrganisationType]  = @PaymentOrganisationType
AND     po.[providerSnapshotId] = @ProviderSnapshotId