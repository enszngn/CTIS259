--Q1. List the name and surname of students living in ANKARA.
--Q2. List the ISBN and title of available books, sorted by title.
--Q3. List the name, surname and country of authors who are NOT from the USA.
--Q4. List the name, surname and country of authors from the USA or GERMANY.
--Q5. List the titles of books whose title starts with 'P'.
--Q6. List the titles of books whose title contains the word 'Programming'.
--Q7. List id, name and surname of authors whose ID is between 200 and 400.
--Q8. List the countries of authors in alphabetical order (DO NOT display duplicates).
--Q9. List the students sorted by city in ascending order and, within the same city, by surname in descending order.
--Q10. List the borrowings that have not been returned yet.
--Q11. List each book title together with its authors (name and surname), sorted by title.
--Q12. List the titles of books written by American authors (no duplicates).
--Q13. List the students who borrowed the book 'ASP' (no duplicates).
--Q14. List the student names, book titles, and borrow dates of books that have not been returned yet.
--Q15. List the authors of the book 'Object Oriented Programming'.
--Q16. List student names, book titles, and borrow dates, ordered from newest to oldest.
--Q17. Display the name, address, and title of the borrowed book for every student whose address is Ankara or
--Istanbul and who currently has an unreturned book.
--Q18. List the titles of books written by Robert Sedgewick.
--Q19. List each unique pair of students who live in the same city. Do not include a student paired with themselves
--or duplicate pairs.
--Q20. List the ISBNs of books that have never been borrowed.
select isbn
from books
where isbn not in (select bisbn from borrowing);
--Q21. List the books (isbn, title) that have never been borrowed.
select isbn, title
from books
where isbn not in (select bisbn from borrowing);
--Q22. List ALL students with the titles of the books they borrowed (students who have not borrowed any books
--must also appear).
select stname, stsurname, title
from students
left outer join borrowing
    on (stuid = stid)
left outer join books
    on (bisbn = isbn);
--Q24. For every borrowing, list the student ID and book ISBN, and show whether the book has been ‘Returned’ or
--‘Not returned’. Label the result column as borrowing_state.
select stid, isbn,
    case
        when returndate is null then 'Not Returned'
        else 'Returned'
    end borrowing_state
from students
join borrowing
    on (stuid = stid)
join books
    on (bisbn = isbn);
    
select stid, isbn, nvl2(returndate, 'Returned', 'Not Returned')
from students
join borrowing
    on (stuid = stid)
join books
    on (bisbn = isbn);
--Q25. Display the student ID, ISBN, and return date in DD/MM/YYYY format. If the book has not been returned,
--display 'Not returned' instead.
select stid, isbn, nvl(to_char(returndate), 'Not Returned')
from students
join borrowing
    on (stuid = stid)
join books
    on (bisbn = isbn);
--Q26. List the borrowings made in November 2024.
select * from borrowing;
select title, borrowdate
from borrowing
join books
    on (bisbn = isbn)
where to_char(borrowdate, 'MM/YY') = '11/24';
--Q27. List the borrowings made after 1 October 2024, ordered by borrow date.
select title, borrowdate
from borrowing
join books
    on (bisbn = isbn)
where borrowdate > date '2024-10-1'
order by borrowdate;
--Q28. List late returns with student name, title and number of late days, most late first.
select stname, title, returndate - duedate "Number of late days"
from students
join borrowing
    on (stid = stuid)
join books
    on (bisbn = isbn)
where returndate > duedate;
--Q29. List the borrowings that were returned on time (return date on or before the due date), and show how many
--days early each book was returned.
select * from borrowing;
select title, duedate - returndate "How many days early it has been returned"
from borrowing
join books
    on (bisbn = isbn)
where duedate >= returndate;
--Q30. List the students who live in ISTANBUL OR who currently hold an unreturned book
select stname, stsurname, staddress, returndate
from students
join borrowing
    on (stuid = stid)
where staddress = 'ISTANBUL' or returndate is null;
--Q31. List the IDs of students who borrowed BOTH 'Object Oriented Programming' (4-580-20-5)
--and 'Algorithm' (6-201-50-9).
select stuid, bisbn
from borrowing
where stuid = any (select stuid from borrowing where bisbn in ('4-580-20-5', '6-201-50-9'));
--Q32. List the IDs of authors who have written at least one book but do not have any available books.
select * from books;
select aid, aname
from authors
join bookaut aut
    on (auid = aid)
join books b
    on (b.isbn = aut.isbn)
where status = 'N';
--Q33. List the IDs of students who borrowed a book in October 2024 AND returned a book late.
select stuid
from borrowing
where to_char(borrowdate, 'MM/YYYY') = '10/2024'
intersect
select stuid
from borrowing
where returndate > duedate;
--Q34. Display the titles of books borrowed by students who live in ANKARA.
select distinct title
from books, borrowing
where isbn = bisbn and stuid in
    (select stid
    from students
    where staddress = 'ANKARA');
--Q35. Display the titles of books borrowed by the student named ALI OKUR.
select distinct title
from books
join borrowing
    on (isbn = bisbn)
join students
    on (stuid = stid)
where stname = 'ALI' and stsurname = 'OKUR';
--Q36. Display the names and surnames of authors who have written available books.
select distinct aname, asurname
from authors
join bookaut aut
    on (auid = aid)
join books b
    on (b.isbn = aut.isbn)
where status = 'A';
--Q37. Display the titles of books borrowed after the borrowing date of the book with ISBN '0-501-70-6'.
select title
from books
join borrowing
    on (isbn = bisbn)
where borrowdate > 
    (select borrowdate
     from borrowing
     where bisbn = '0-501-70-6');
--Q38. Display the names and surnames of students who borrowed at least one book written by a GERMAN author.
select * from authors;
select distinct stname, stsurname
from students
join borrowing
    on (stid = stuid)
where bisbn = any (
    select b.isbn
    from books b
    join bookaut aut
        on (b.isbn = aut.isbn)
    join authors
        on (aid = auid)
    where country = 'GERMANY');
--Q39. Display the students who borrowed books before the date student 222 borrowed 'ASP'.
select stname, stsurname
from students
join borrowing
    on (stuid = stid)
where borrowdate < any (
    select borrowdate
    from borrowing
    join books
        on (bisbn = isbn)
    where stuid = 222 and title = 'ASP');
--Q40. Display the students (name and surname) who have never borrowed any book.
select stname, stsurname
from students
where stid not in (
    select stuid
    from borrowing);
--Q41. Display the students (name and surname) who returned at least one book late.
select * from borrowing;
select stname, stsurname
from students
where stid in (
    select stuid
    from borrowing
    where returndate > duedate);
--Q42. List the borrowings (student ID, ISBN, and borrow date) made after ALL borrowings of student 111.
select stuid, bisbn, borrowdate
from borrowing
where borrowdate > all (
    select borrowdate
    from borrowing
    where stuid = 111);
--Q43. Display the titles of the books that have at least two authors.
select title
from books
where isbn in (
    select fb.isbn
    from bookaut fb, bookaut sb, authors f, authors s
    where fb.auid = f.aid and sb.auid = s.aid and f.aid < s.aid and fb.isbn = sb.isbn);
--Q44. Display the authors who are from the same country as RICK DECKER (exclude Rick himself).
select aname, asurname
from authors
where country = (
    select country
    from authors
    where aname = 'RICK' and asurname = 'DECKER') and (aname != 'RICK' or asurname != 'DECKER');