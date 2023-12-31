drop database if exists org;
create database org;
create database if not exists org;
use org;

select * from bonus;
select * from worker;
select * from title;

-- Q-1. Write An SQL Query To Fetch “FIRST_NAME” From Worker Table Using The Alias Name As <WORKER_NAME>.
select first_name as "worker_name" from worker;

#Q-2. Write An SQL Query To Fetch “FIRST_NAME” From Worker Table In Upper Case.
select upper(first_name) as first_name from worker;

#Q-3. Write An SQL Query To Fetch Unique Values Of DEPARTMENT From Worker Table.
select distinct(department) from worker;

#Q-4. Write An SQL Query To Print The First Three Characters Of FIRST_NAME From Worker Table.
select first_name, substr(first_name,1,3) as nick_name from worker;

#Q-5. Write An SQL Query To Find The Position Of The Alphabet (‘A’) In The First Name Column ‘Amitabh’ 
#From Worker Table.
select first_name, position('a' in first_name) from worker where first_name = 'amitabh';

#Q-6. Write An SQL Query To Print The FIRST_NAME From Worker Table After Removing White Spaces 
#From The Right Side.
select rtrim(first_name) from worker;
 
#Q-7. Write An SQL Query To Print The DEPARTMENT From Worker Table After Removing White Spaces 
#From The Left Side.
select ltrim(department) as department from worker;

#Q-8. Write An SQL Query That Fetches The Unique Values Of DEPARTMENT From Worker Table And 
#Prints Its Length.
select distinct department,length(department) as len_of_dept from worker;

# Q-9. Write An SQL Query To Print The FIRST_NAME From Worker Table After Replacing ‘a’ With ‘K’. 
# (for replacing char is case-sensitive)
select first_name, replace(first_name,'a','k') as rep from worker;

# Q-10. Write An SQL Query To Print The FIRST_NAME And LAST_NAME From Worker Table Into A Single 
#Column COMPLETE_NAME. A Space Char Should Separate Them.
select concat(first_name,' ',last_name) from worker;

#Q-11. Write An SQL Query To Print All Worker Details From The Worker Table Order By FIRST_NAME Ascending.
select* from worker
order by first_name asc;

#Q-12. Write An SQL Query To Print All Worker Details From The Worker Table Order By FIRST_NAME 
#Ascending And DEPARTMENT Descending.
select * from worker order by department desc, first_name asc;

#Q-13. Write An SQL Query To Print Details For Workers With The First Name As “Vipul” And “Satish” From Worker Table.
select * from worker where first_name in('vipul','satish');
select* from worker where firsr_name ='vipul' or 'satish';

#Q-14. Write An SQL Query To Print Details Of Workers Excluding First Names, “Vipul” And “Satish” From Worker Table.
select * from worker where first_name not in('vipul','satish');

#Q-15. Write An SQL Query To Print Details Of Workers With DEPARTMENT Name As “Admin”.
select * from worker where deparment ='Admin';

#Q-16. Write An SQL Query To Print Details Of The Workers Whose FIRST_NAME Contains ‘A’.
select* from worker where first_name like'%a%';

#Q-17. Write An SQL Query To Print Details Of The Workers Whose FIRST_NAME Ends With ‘A’.
select * from worker where first_name like'%a';

#Q-18. Write An SQL Query To Print Details Of The Workers Whose FIRST_NAME Ends With ‘H’ And 
#Contains Six Alphabets.
select *from worker where first_name like '_____h';
select * from worker where length(first_name)=6 and first_name like '%h';

#Q-19. Write An SQL Query To Print Details Of The Workers Whose SALARY Lies Between 100000 And 
#500000.
select * from worker where salary between 100000 and 500000;
select * from worker where salary >= 100000 and salary <= 500000;

#Q-20. Write An SQL Query To Print Details Of The Workers Who Have Joined In Feb’2014.
select * from worker where month(joining_date)= 2 and year(joining_date)= 2014;
select * from worker where joining_date like '2014-02%';

#Q-21. Write An SQL Query To Fetch The Count Of Employees Working In The Department ‘Admin’.
select department, count(department) as no_of_worker from worker where department = 'admin' group by department;

#Q-22. Write An SQL Query To Fetch Worker Names With Salaries >= 50000 And <= 100000.
select concat(first_name, ' ', last_name)as worker_name, salary from worker where salary >= 50000 and salary<= 100000;

# Q-23. Write An SQL Query To Fetch The No. Of Workers For Each Department In The Descending Order.
select count(department) as no_of_worker from worker group by department order by no_of_worker desc;

#Q-24. Write An SQL Query To Print Details Of The Workers Who Are Also Managers.
select * from worker; 
select * from title where worker_id in (select worker_reference_id from title where worker_titile = 'manager');
select w.*,t.* from title join worker on worker_id = worker_ref_id where worker_title ='manager';

#Q-25. Write An SQL Query To Fetch Duplicate Records Having Matching Data In Some Fields Of A Table.
select worker_title, affected_from, count(*) as dup from title group by worker_title, affected_from having dup>1;

#Q-26. Write An SQL Query To Show Only Odd Rows From A Table.
select * from worker where worker_id %2 != 0;

#Q-27. Write An SQL Query To Show Only Even Rows From A Table.
select * from worker where worker_id %2 = 0;

#Q-28. Write An SQL Query To Clone A New Table From Another Table.
create table clone_table as select* from worker;             #this query will clone with informatio
select *from clone_table;
create table clone_info like worker;                      # this query will just clone the structure
select* from clone_info; 

#Q-29. Write An SQL Query To Fetch Intersecting Records Of Two Tables

select * from worker where worker_id in (select worker_ref_id from bonus);

#Q-30. Write An SQL Query To Show Records From One Table That Another Table Does Not Have.
select * from worker;
select * from bonus;
select * from worker where worker_id not in(select worker_ref_id from bonus);

#Q-31. Write An SQL Query To Show The Current Date And Time.
select now();

#Q-32. Write An SQL Query To Show The Top N (Say 5) Records Of A Table.
select* from worker limit 5;
select* from worker where worker_id < 6;

#Q-33. Write An SQL Query To Determine The Nth (Say N=5) Highest Salary From A Table.
select * from worker order by salary desc limit 4,1;
select * from worker order by salary desc limit 1 offset 4;
select *, row_number()over(order by salary desc), rank()over(order by salary desc), dense_rank() over(order by salary desc) from worker;

#Q-34. Write An SQL Query To Determine The 5th Highest Salary Without Using TOP Or Limit Method.
select * from(select *, dense_rank()over(order by salary desc)as dense_rank_info from worker) t where t.dense_rank_info = 5; 

#Q-35. Write An SQL Query To Fetch The List Of Employees With The Same Salary.
select * from (select *, rank()over(order by salary desc) as rank_salary from worker) t where t.rank_salary = 1;
select * from worker where salary in (select salary dup from worker group by salary having count(salary)>1); 

#Q-36. Write An SQL Query To Show The Second Highest Salary From A Table.
select * from (select *, dense_rank()over(order by salary desc) as dense_rank_info from worker) t where t.dense_rank_info = 2;

#Q-37. Write An SQL Query To Show One Row Twice In Results From A Table.
select * from worker union all select * from worker;

#Q-38. Write An SQL Query To Fetch Intersecting Records Of Two Tables.
select w.*, b.* from worker w join bonus b on worker_id = worker_ref_id;

#Q-39. Write An SQL Query To Fetch The First 50% Records From A Table.
select * from worker where worker_id <=(select round(count(worker_id)/2) from worker);

#Q-40. Write An SQL Query To Fetch The Departments That Have Less Than  People In It.
select department, count(department) as no_of_emp  from worker group by department having no_of_emp <3;

#Q-41. Write An SQL Query To Show All Departments Along With The Number Of People In There.
select department, count(department) as no_of_emp from worker group by department;

#Q-42. Write An SQL Query To Show The Last Record From A Table.
select * from worker order by worker_id desc limit 1;

#Q-43. Write An SQL Query To Fetch The First Row Of A Table.
select * from worker order by worker_id limit 1;

#Q-44. Write An SQL Query To Fetch The Last Five Records From A Table.
select * from worker order by worker_id desc limit 5;
select* from(select * from worker order by worker_id desc limit 5) t order by t.worker_id asc;

#Q-45. Write An SQL Query To Print The Name Of Employees Having The Highest Salary In Each Department.
select * from (select *, dense_rank()over(partition by department order by salary desc) dr from worker) t where t.dr = 1;

#Q-46. Write An SQL Query To Fetch Three Max Salaries From A Table.
select * from (select *, dense_rank()over(order by salary desc) dr from worker) t where t.dr <3;

#Q-47. Write An SQL Query To Fetch Three Min Salaries From A Table.
select * from (select *, dense_rank()over(order by salary asc) dr from worker) t where dr<=3;

#Q-48. Write An SQL Query To Fetch Nth Max Salaries From A Table.
select* from(select *, dense_rank() over(order by salary desc) as dr from worker) t where t.dr = 2; 

#Q-49. Write An SQL Query To Fetch Departments Along With The Total Salaries Paid 
select department, sum(salary) from worker group by department;

#Q-50. Write An SQL Query To Fetch The Names Of Workers Who Earn The Highest Salary.
select * from worker where salary = (select max(salary) from worker);
