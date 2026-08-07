@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Employee Interface View'

define root view entity ZI_AS_EMPLOYEE
  as select from zas_employee
{
  key emp_id          as EmployeeId,
      emp_name        as EmployeeName,
      department      as Department,
      designation     as Designation,
      salary          as Salary,
      annualsalary    as AnnualSalary,
      email           as Email,
      phone           as Phone,
      join_date       as JoinDate,
      status          as Status,
      created_by      as CreatedBy,
      created_at      as CreatedAt,
      last_changed_by as LastChangedBy,
      last_changed_at as LastChangedAt
}
