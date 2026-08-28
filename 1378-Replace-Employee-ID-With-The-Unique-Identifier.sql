select eu.unique_id, e.name
from employees as e
left join EmployeeUNI as eu using(id);