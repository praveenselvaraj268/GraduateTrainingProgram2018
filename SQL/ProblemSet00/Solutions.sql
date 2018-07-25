-- ProblemSet00, July <25> <2018>
-- Submission by <praveen.b.selvaraj@accenture.com> 

1.Select the Employee with the top three salaries

select * from employee where salary >=(select max(salary) from employee where salary<(select max(salary) from employee where salary<(select max(salary) from employee))) order by salary desc;

A142|TARA CUMMINGS|D04|99475|A187
A132|PAUL VINCENT|D01|94791|A120
A128|ADAM WAYNE|D05|94324|A165

Record count -3

2.Select the Employee with the least salary

select name,min(salary) from employee;

JOHN HELLEN|15380

Record count -1

3.Select the Employee who does not have a manager in the department table

A178|BRUCE WILLS|D03|66861|A298
A120|TIM ARCHER|D01|48834|A298
A187|ADAM JUSTIN|D02|80543|A298
A165|NATASHA STEVENS|D05|31377|A298

Record count-4

4.Select the Employee who is also a Manager

select * from employee e  inner join dept d on e.name=d.depmanager;

A178|BRUCE WILLS|D03|66861|A298|D03|PRODUCT|BRUCE WILLS
A120|TIM ARCHER|D01|48834|A298|D01|HEALTH|TIM ARCHER
A187|ADAM JUSTIN|D02|80543|A298|D02|COMMUNICATIONS|ADAM JUSTIN
A165|NATASHA STEVENS|D05|31377|A298|D05|FINANCE|NATASHA STEVENS

Record count-4

5.Select the Empolyee who is a Manager and has least salary

select e_id,name,salary from employee where salary=(select min(salary) from employee e inner join dept d on e.name=d.depmanager);
A165|NATASHA STEVENS|31377

Record count-1

6.Select the total number of Employees in Communications departments

select count(e_id) from employee e inner join dept d on e.dep_id=d.dept_id where deptname='COMMUNICATIONS';
6

Record count-1

7.Select the Employee in Finance Department who has the top salary

select name,max(salary) from employee where dep_id=(select dept_id from dept where deptname='FINANCE');
ADAM WAYNE|94324

Record count-1

8.Select the Employee in product depatment who has the least salary

select name,min(salary) from employee where dep_id=(select dept_id from dept where deptname='PRODUCT');
NICK MARTIN|50174

Record count-1

9.Select the count of Empolyees in Health with maximum salary

select count(e_id) from employee where salary=(select max(salary) from employee where dep_id=(select dept_id from dept where deptname='HEALTH'));

1

Record count-1

10.Select the Employees who report to Natasha Stevens

select name from employee where manager_id=(select e_id from employee where name='NATASHA STEVENS');
ADAM WAYNE
JOSEPH ANGELIN

Record count-2

11.Display the Employee name,Employee count,Dep name,Dept manager in the Health department

select name,count(e_id),deptname,depmanager from employee e inner join dept d on e.dep_id=d.dept_id where d.dept_id =(select dept_id from dept where deptname='HEALTH');

JOHN HELLEN|6|HEALTH|TIM ARCHER

Record count-1

12.Display the Department id,Employee ids and Manager ids for the Communications department

select dep_id,e_id,manager_id from employee where dep_id=(select dept_id from dept where deptname='COMMUNICATIONS');
D02|A116|A187
D02|A198|A187
D02|A187|A298
D02|A121|A187
D02|A194|A187
D02|A133|A187

Record count-6

13.Select the Average Expenses for Each dept with Dept id and Dept name

 select dep_id,deptname,avg(salary) from employee e inner join dept d on e.dep_id=d.dept_id group by d.dept_id;
D01|HEALTH|54527.6666666667
D02|COMMUNICATIONS|48271.3333333333
D03|PRODUCT|58517.5
D04|INSURANCE|64020.0
D05|FINANCE|56660.3333333333

Record count-5

14.Select the total expense for the department finance

select sum(salary) from employee where dep_id=(select dept_id from dept where deptname='FINANCE');
169981

Record count-1

15.Select the department which spends the least with Dept id and Dept manager name

select min(least), dept_id,depmanager from(select sum(salary) as least,d.dept_id,d.depmanager from employee e inner join dept d on e.dep_id=d.dept_id group by d.dept_id);
117035|D03|BRUCE WILLS

Record count-1

16.Select the count of Employees in each department

sqlite> select count(*) from employee group by dep_id;
6
6
2
2
3

Record count-5

17.Select the count of Employees in each department having salary <10000

select count(*) from employee group by dep_id having salary<10000 ;
Empty set

18.Select the total number of Employees in Dept id D04

select count(e_id) from employee where dep_id='D04';
2

Record count-1

19.Select all department details of the Department with Maximum Employees

select max(maximum),dept_id,deptname,depmanager from(select count(*) as maximum,d.dept_id,d.deptname,d.depmanager from employee e inner join dept d on e.dep_id=d.dept_id group by dep_id);
6|D01|HEALTH|TIM ARCHER

Record count-1

20.Select the Employees who has Tim Cook as their manager

select * from employee where manager_id=(select e_id from employee where name='TIM COOK');
EMPTY SET

