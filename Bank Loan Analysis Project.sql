create database Bank_loan_analysis;

use Bank_loan_analysis;
select * from [Finance_1 (1)];
use Bank_loan_analysis
select * from Finance_2;

select count(*) from [Finance_1 (1)]
select count(*) from Finance_2

# KPI 1 : year wise loan Amount

SELECT year(issue_d) AS year_of_issue, 
       SUM(loan_amnt) AS Loan_amount
FROM [Finance_1 (1)]
GROUP BY year(issue_d)
ORDER BY year_of_issue;

# KPI 2 : Grade and Sub Grade wise Revol_bal 

Select 
grade , sub_grade , sum(revol_bal) as total_revol_bal
from [Finance_1 (1)] inner join Finance_2
on ([Finance_1 (1)].id = Finance_2.id)
group by grade, sub_grade
order by grade, sub_grade

#KPI 3 : Total Payment for verified and Non verified Status 

select verification_status ,round(sum(total_pymnt),2) as total_payment 
from [Finance_1 (1)] inner join Finance_2
on ( [Finance_1 (1)].id = Finance_2.id)
group by verification_status;

#KPI 4: State wise and Last_credit_pul _d wise loan Statues 

select loan_status , last_credit_pull_d ,addr_state
from [Finance_1 (1)] 
inner join Finance_2
on [Finance_1 (1)].id = Finance_2.id
where last_credit_pull_d is not null
order by last_credit_pull_d;

#KPI 5: Home ownership vs Last_payment_date 

select home_ownership,
CONCAT ('$',  ROUND(SUM(last_pymnt_amnt)/100000,2),'M') AS total_payment
from [Finance_1 (1)]
inner join Finance_2
on [Finance_1 (1)].id = Finance_2.id
group by home_ownership
order by home_ownership;

SELECT home_ownership, 
       CONCAT('$',  ROUND(SUM(last_pymnt_amnt)/100000,2),'m') AS total_payment,
       YEAR(last_pymnt_d) AS payment_year
FROM [Finance_1 (1)]
INNER JOIN Finance_2
ON [Finance_1 (1)].id = Finance_2.id
where YEAR(last_pymnt_d) is not null 
GROUP BY home_ownership, YEAR(last_pymnt_d)
ORDER BY home_ownership;


