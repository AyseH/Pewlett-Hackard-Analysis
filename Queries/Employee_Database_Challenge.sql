--DELIVERABLE 1
--#1.
SELECT
	emp_no,
	first_name,
	last_name
FROM employees;

--#2.
SELECT
	title,
	from_date,
	to_date
FROM titles;

--#3.
SELECT e.emp_no,
	   e.first_name,
	   e.last_name,
       t.title,
	   t.from_date,
	   t.to_date
INTO retirement_titles
FROM employees as e
LEFT JOIN titles as t
ON e.emp_no= t.emp_no
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY "emp_no" ;

SELECT * FROM retirement_titles;

--Use Dictinct with Orderby to remove duplicate rows

SELECT DISTINCT ON (emp_no) emp_no, 
first_name,
last_name,
title
INTO unique_titles
FROM retirement_titles
ORDER BY emp_no, to_date DESC;

--Retrieve the number of employees by their 
--most recent job title who are about to retire
SELECT COUNT(emp_no) AS "count",title
INTO retiring_titles
FROM unique_titles
GROUP BY title
ORDER BY "count" DESC;
--SELECT * FROM unique_titles;


--DELIVERABLE 2
SELECT emp_no,
	 first_name,
	 last_name,
	 birth_date
FROM employees;

SELECT from_date, to_date,
FROM dept_emp;

SELECT title
FROM titles;

SELECT DISTINCT ON (e.emp_no) e.emp_no,
	 e.first_name,
	 e.last_name,
	 e.birth_date,
	 de.from_date, 
	 de.to_date,
	 t.title
INTO mentorship_eligibility
FROM employees AS e
JOIN dept_emp AS de
ON (e.emp_no=de.emp_no)
JOIN titles AS t
ON(e.emp_no = t.emp_no)
WHERE (birth_date BETWEEN '1965-01-01' AND '1965-12-31') AND (de.to_date='9999-01-01')
ORDER BY "emp_no" ;







