
SELECT
    ps.PatientId
    ,ps.AdmittedDate
    ,ps.DischargeDate
    ,ps.Hospital
    ,ps.Ward
    ,DATEADD(DAY, -14, ps.AdmittedDate) AS ReminderDate
    ,DATEDIFF(DAY, ps.AdmittedDate, ps.DischargeDate) + 1 AS LengthOfStay
FROM
    PatientStay AS ps
WHERE ps.Hospital IN ('Oxleas', 'PRUH')
    AND ps.AdmittedDate BETWEEN '2024-02-01'  AND  '2024-03-01'
    AND ps.Ward LIKE  'D%'
ORDER BY
  ps.AdmittedDate DESC
  ,ps.PatientId DESC;
