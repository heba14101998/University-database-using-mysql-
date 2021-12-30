https://github.com/heba14101998/University-database-using-mysql-.git

# The University Accommodation Office Case Study
The director of the University Accommodation Office requires you to design a database to assist with the administration of the office. The requirements collection and analysis phase of the database design process has provided the following data requirements specification for the University Accommodation Office database followed by examples of query transactions that should be supported by the database.

# Data Requirements 
## Students
The data stored for each full-time student includes: the banner number, name (first and last name),
home address (street, city, postcode), mobile phone number, email, date of birth, gender, category of student (for example, first-year undergraduate, postgraduate), nationality, special needs, any additional comments, status (placed/waiting), major, and minor. The student information stored relates to those currently renting a room and those on the waiting list.
Students may rent a room in a hall of residence or student apartment. When a student joins the university, he or she is assigned to a member of staff who acts as his or her
Adviser. The Adviser is responsible for monitoring the student’s welfare and academic progression throughout his or her time at the university. The data held on a student’s Adviser includes full name, position, name of department, internal telephone number, email, and room number.

## Halls of residence 
Each hall of residence has a name, address, telephone number, and a hall manager, who supervises the operation of the hall. The halls provide only single rooms, which have a room number, place number, and monthly rent rate. The place number uniquely identifies each room in all halls controlled by the Residence Office and is
used when renting a room to a student.

## Student flats 
The Residence Office also offers student apartments. These are fully furnished and provide single-room accommodation for groups of three, four, or five students. The information held on student apartments includes an apartment number, address, and the number of single bedrooms available in each apartment. The flat number uniquely identifies each apartment. Each bedroom in an apartment has a monthly rent rate, room number, and a place number. The place number uniquely identifies each room available in all student apartments and is used when renting a room to a student.

## Leases
A student may rent a room in a hall or student apartment for various periods of time. New lease agreements
are negotiated at the start of each academic year, with a minimum rental period of one semester and a
maximum rental period of one year, which includes semesters 1 and 2 and the summer semester. Each
individual lease agreement between a student and the Residence Office is uniquely identified using a lease
number.
The data stored on each lease includes the lease number, duration of the lease (given as semesters),
student’s name and banner number, place number, room number, address details of the hall or student
apartment, and the date the student wishes to enter the room, and the date the student wishes to leave the
room (if known).

## Invoices
At the start of each semester, each student is sent an invoice for the following rental period. Each invoice has a
unique invoice number.
The data stored on each invoice includes the invoice number, lease number, semester, payment due,
student’s full name and banner number, place number, room number, and the address of the hall or apartment.
Additional data is also held regarding the payment of the invoice and includes the date the invoice was paid, the
method of payment (check, cash, Visa, and so on), the date the first and second reminder was sent (if
necessary).

## Student apartment inspections
Student apartments are inspected by staff on a regular basis to ensure that the accommodation is well
maintained. The information recorded for each inspection is the name of the member of staff who carried out
the inspection, the date of inspection, an indication of whether the property was found to be in a satisfactory
condition (yes or no), and any additional comments.
Residence staff
Some information is also held on members of staff of the Residence Office and includes the staff number, name
(first and last name), email, home address (street, city, postcode), date of birth, gender, position (for example,
Hall Manager, Administrative Assistant, Cleaner) and location (for example, Residence Office or Hall).

## Courses
The Residence Office also stores a limited amount of information on the courses offered by the university,
including the course number, course title (including year), course instructor, instructor’s on-campus telephone
number, email, room number, and department name. Each student is also associated with a single programme
of studies.

## Next-of-kin
Whenever possible, information on a student’s next-of-kin is stored, which includes the name, relationship,
address (street, city, postcode), and contact telephone number.

# Requirements Queries

Listed below some examples of query transactions that should be supported by the University Accom-
modation Office database system. Use MySQL to query the following:

1. Present a report listing the Manager’s name and telephone number for each hall of residence.
2. Present a report listing the names and banner numbers of students with the details of their lease agreements.
3. Display the details of lease agreements that include the summer semester. 
4. Display the details of the total rent paid by a given student. 
5. Present a report on students who have not paid their invoices by a given date.
6. Display the details of apartment inspections where the property was found to be in an unsatisfactory condition.
7. Present a report of the names and banner numbers of students with their room number and number in a particular hall of residence.
8. Present a report listing the details of all students currently on the waiting list for accommodation; that is; who were not placed.
9. Display the total number of students in each student category.
10. Present a report of the names and banner numbers for all students who have not supplied details of their next-of-kin.
11. Display the name and internal telephone number of the Adviser for a particular student. l) Display the minimum, maximum, and average monthly rent for rooms in residence halls. 
12. Display the total number of places in each residence hall.
13. Display the staff number, name, age, and current location of all members of the residence staff who are over 60 years old today.