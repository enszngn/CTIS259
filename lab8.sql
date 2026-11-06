select * from storecustomer;

select firstname, lastname, city
from storecustomer
where city = 'Istanbul';

select firstname, lastname, city
from storecustomer
where city != 'Ankara';

select firstname, lastname
from storecustomer
where lastname like 'A%';

select firstname, lastname
from storecustomer
where firstname like '%e%';

select firstname, lastname, city
from storecustomer
where city not in ('Ankara', 'Bursa');

select firstname, lastname, customerno, city
from storecustomer
where customerno > 1002 and city = 'Antalya';

select firstname, lastname, customerno
from storecustomer
where customerno > 1002 and customerno < 1004;

select firstname, lastname
from storecustomer
order by firstname asc;

select modelname, price
from phonemodel
order by price desc;

select modelname, price
from phonemodel
where price > &givenprice;

select modelname, price
from phonemodel 
where price > 30000 and price < 100000;

select modelname
from phonemodel
where modelname like '%Galaxy%';

select modelname, country
from phonemodel p, brand b
where p.brandno = b.brandno and country in ('USA', 'South Korea');

select firstname, lastname, phoneno
from storecustomer c, customerphone cp
where c.customerno = cp.customerno;

select firstname, lastname, purchasedate, amount
from storecustomer c, purchase p
where c.customerno = p.customerno;

select firstname, lastname, modelname
from storecustomer c, phonemodel p, purchase purc
where p.phoneid = purc.phoneid and purc.customerno = c.customerno;

select firstname, lastname, modelname, amount
from storecustomer c, purchase purc, phonemodel p
where p.phoneid = purc.phoneid and purc.customerno = c.customerno and amount > 50000;
