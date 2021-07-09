-- joins: select all the computers from the products table:
-- using the products table and the categories table, return the product name and the category name
   -- select p.name, c.name from products as p
   -- inner join categories as c on c.categoryID = p.categoryID
   -- where c.categoryID = 1
 
 
-- joins: find all product names, product prices, and products ratings that have a rating of 5
 select p.name, p.price, r.rating from products as p
 inner join reviews as r on r.productID = p.productID
 where r.rating = 5;
 
 
-- joins: find the employee with the most total quantity sold.  use the sum() function and group by
select e.FirstName, e.LastName, Sum(s.Quantity) as "Total" 
from sales as s
inner join employees as e on e.EmployeeID = s.EmployeeID
group by e.EmployeeID
order by Total desc;


-----------------------------------------------------------------
-- joins: find the name of the department, and the name of the category for Appliances and Games
select * from departments as d
inner join categories as c on c.departmentID = d.departmentID
where c.Name = "Appliances" or c.Name = "Games";


-- joins: find the product name, total # sold, and total price sold,
select p.Name, sum(s.quantity) as 'Total Sold', sum(s.quantity * s.priceperunit) as 'Total Price'
from products as p
inner join sales as s on s.ProductID = p.ProductID
where p.ProductID = 97;

select * from sales where productID = 97;


-- joins: find Product name, reviewer name, rating, and comment on the Visio TV. (only return for the lowest rating!)
select p.Name, r.Reviewer, r.Rating, r.Comment
from products as p
inner join reviews as r on r.ProductID = p.ProductID
where p.ProductID = 857 and r.Rating = 1;


-------------------------------------------- Extra - May be difficult
/* Your goal is to write a query that serves as an employee sales report.
This query should return the employeeID, the employee's first and last name, the name of each product, how many of that product they sold */

select e.EmployeeID, e.FirstName, e.LastName, p.Name, sum(s.Quantity) as 'Total_Sold', s.Date
from sales as s
inner join employees as e on e.EmployeeID = s.EmployeeID
inner join products as p on p.ProductID = s.ProductID
group by e.EmployeeID, p.ProductID, s.Date
order by Total_Sold desc;

