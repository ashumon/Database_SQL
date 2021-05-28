use carwash;

--Where clause completed by Ashley Szpanelewski

select firstname
      , lastname
	  , persontype
from person
where city like '%Warren%'
order by lastname;

--Join with set operator completed by Ashley Szpanelewski

--The co-owner, Ashley, is experimenting using the database that has just been created. She realizes that 
--using a set operator to see the first and last name of the customers and employees
-- is not the most efficient way to find this data in this particular database
-- but she wants the practice.

select firstname
     , lastname
	 , 'customer' as [Customer/Employee]
from customer join person
    on customer.personid = person.personid
union
select firstname
      ,lastname
	  ,'employee' 
from employee join person
     on employee.personid = person.personid;


-- Multi-Table Join completed by Andrew Shock

--  Employee Matt Damon has been accidentally using windshield fluid to wipe down cars during car washes. 
--A table has been made to find all car washes done by Matt with the order number and the name and phone number of the client 
-- as well as a refund price which is the entire cost of the service performed plus $10 due to the inconvenience.


select 
	o.OrderID
	 , p.FirstName
     , p.LastName
	 , p.Phone
	 , os.EndDate as [Completion Date]
	 , CONCAT('$',cost+10) as [Refund Due]
from person p join ORDERS o
     on p.personid = o.CustomerID
	 join OrdServ os
	 on o.EmployeeID = os.EmployeeID
	 join OrdServices oss
	 on os.ServiceID = oss.ServiceID
	 join Customer c
	 on p.PersonID = c.PersonID
where os.EmployeeID = 102;

--Subquery completed by Andrew Shock

-- Pride & Shine Car Wash is offering a promotion to all clients. A table has been made to advertise this client by sending texts and emails to the clients.

select FirstName
	,LastName
	,Phone
	,Email
from person p join CUSTOMER c
    on p.PersonId = c.PersonID
    where p.PersonId in
    (select PersonID
    from CUSTOMER)

-- Group by statement completed by Andrew Shock

-- A table has been completed to see how many times to service “Exprss Wax” has been performed.

select count(*) as [Exprss Wax Orders]
from OrdServices o join OrdServ os
	 on o.ServiceID = os.ServiceID
where o.serviceID = 11
group by o.serviceID;


--Outer Join completed by Ashley Szpanelewski

--The owners of Pride and Shine want to see what customers have not made an order so they can e-mail them some coupons

select firstname
     , lastname
	 , email
	 , orderid
from person full join orders
     on person.personid = orders.customerid
where orderid is null
order by lastname;

--Having statement completed by Ashley Szpanelewski

-- The owners want to reward those who have at least ordered 1 service with 
--a voucher for a free Bumper2Bumper wash.

select p.firstname as [First Name]
     , p.lastname as [Last Name]
	 , p.email as [EMail]
	 , count(orderid) as [Num Orders]
from person p join ordserv os
     on p.personid = os.employeeid
group by p.firstname, p.lastname, p.email
having count(*) > = 1;
      