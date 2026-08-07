@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Employee Projetion View'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
define root view entity ZC_AS_EMPLOYEE provider contract transactional_query
as projection on ZI_AS_EMPLOYEE
{
    key EmployeeId,
    EmployeeName,
    Department,
    Designation,
    Salary,
    AnnualSalary,
    Email,
    Phone,
    JoinDate,
    Status
}
