-- 4). Implementation of tables and necessary integrity constraints.

CREATE TABLE details (
    id INTEGER PRIMARY KEY,
    currency VARCHAR(100),
    park VARCHAR(100),
    stadium VARCHAR(100),
    church VARCHAR(100),
    museum VARCHAR(100),
);

CREATE TABLE location (
    id INTEGER PRIMARY KEY,
    details_id INTEGER,
    address VARCHAR(100),
    postal_code INTEGER,
    city VARCHAR(100),
    country VARCHAR(100),
    FOREIGN KEY(details_id) REFERENCES details(id)
);

CREATE TABLE department (
    id INTEGER PRIMARY KEY,
    department_name VARCHAR(100),
    manager_name VARCHAR(100)
);

CREATE TABLE hotel (
    id INTEGER PRIMARY KEY,
    price INTEGER,
    stars INTEGER,
    room_size INTEGER, 
    no_rooms INTEGER,
    name VARCHAR(100),
    location_id INTEGER,
    FOREIGN KEY(location_id) REFERENCES location(id)
);

CREATE TABLE register (
    id INTEGER PRIMARY KEY,
    username VARCHAR(100),
    password VARCHAR(100),
    email VARCHAR(100),
    phone_number INTEGER
);

CREATE TABLE booking (
    hotel_id INTEGER,
    register_id INTEGER,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    start_book_date DATE,
    end_book_date DATE,
    FOREIGN KEY(hotel_id) REFERENCES hotel(id),
    FOREIGN KEY(register_id) REFERENCES register(id)
);

CREATE TABLE employee (
    id INTEGER,
    hotel_id INTEGER,
    department_id INTEGER,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    email VARCHAR(100), 
    phone_number INTEGER,
    salary INTEGER,
    hire_date DATE,
    FOREIGN KEY(hotel_id) REFERENCES hotel(id),
    FOREIGN KEY(department_id) REFERENCES department(id)
);

-- 5). Insert data.

INSERT INTO details VALUES (1, 'LEU', 'Herastrau', 'National Arena', 'Catedrala Mantuirii Neamului', 'Muzeul Na?ional de Istorie Natural? "Grigore Antipa"');
INSERT INTO details VALUES (2, 'EURO', 'Tiergarten', 'Olympiastadion Berlin', 'Berlin Cathedral', 'Pergamonmuseum');
INSERT INTO details VALUES (3, 'EURO', 'Parc des Buttes-Chaumont', 'Parc des Princes', 'Saint-Sulpice', 'Luvru');
INSERT INTO details VALUES (4, 'EURO', 'Stadtpark', 'Ernst Happel Stadion', 'St. Stephen Cathedral', 'Leopold');
INSERT INTO details VALUES (5, 'EURO', 'Vondelpark', 'Amsterdam Arena', 'Liberty Church', 'Van Gogh Museum');
INSERT INTO details VALUES (6, 'DIRHAM', 'Motiongate', 'Dubai International Stadium', 'United Christian Church of Dubai', 'Etihad Museum');
INSERT INTO details VALUES (7, 'POUND', 'Hyde Park', 'Wembley', 'Southwark Cathedral', 'National Gallery');

INSERT INTO location VALUES (1, 1, 'Bld Nicolae Balcescu 4', 10051, 'Bucharest', 'Romania');
INSERT INTO location VALUES (2, 1, 'Calea 13 Septembrie 90', 50726, 'Bucharest', 'Romania');
INSERT INTO location VALUES (3, 1, 'Strada Episcopiei 1-3', 10292, 'Bucharest', 'Romania');
INSERT INTO location VALUES (4, 2, 'Budapester Str. 2', 10787, 'Berlin', 'Germany');
INSERT INTO location VALUES (5, 3, '2 Rue Scribe', 75009, 'Paris', 'France');
INSERT INTO location VALUES (6, 4, 'Johannesgasse 28', 1030, 'Vienna', 'Austria');
INSERT INTO location VALUES (7, 5, 'Apollolaan 138', 1077, 'Amsterdam', 'Netherlands');
INSERT INTO location VALUES (8, 6, 'Al Seba Street', 394, 'Dubai', 'United Arab Emirates');
INSERT INTO location VALUES (9, 7, '150 Piccadilly, St. James', 7397, 'London', 'United Kingdom');
INSERT INTO location VALUES (10, 7, '41 - 43 Brook Street, Westminster', 7120, 'London', 'United Kingdom');

INSERT INTO department VALUES (1, 'HR', 'John');
INSERT INTO department VALUES (2, 'front_office', 'Smith');
INSERT INTO department VALUES (3, 'housekeeping', 'Harry');
INSERT INTO department VALUES (4, 'food_production', 'Joe');
INSERT INTO department VALUES (5, 'maintenance', 'James');
INSERT INTO department VALUES (6, 'security', 'Hefner');

INSERT INTO register VALUES (1, 'test123', 'cc03e747a6afbbcbf8be', 'test123@gmail.com', 0721942865);
INSERT INTO register VALUES (2, 'razvan', 'ccf4h47a6safsfd21fdcbf8be', 'razvan621@gmail.com', 0721880805);
INSERT INTO register VALUES (3, 'bogdanp', 'cz03e0kka6aaswcb22e', 'pbogdan@yahoo.com', 0719040832);
INSERT INTO register VALUES (4, 'ioanamaria', 'zcf4h47194c618be', 'ioana_maria@yahoo.com', 0781580295);
INSERT INTO register VALUES (5, 'robert', 'pc03e747a6afc52bf8zw', 'rober5@gmail.com', 0743421697);
INSERT INTO register VALUES (6, 'alexmunteanu', 'ccf4h47a6saf869e', 'a.munteanu@gmail.com', 0751582801);
INSERT INTO register VALUES (7, 'ana', 'cgtyjkb586b6aaswqoghgd2e', 'ana.mrs@yahoo.com', 0779001656);
INSERT INTO register VALUES (8, 'anca123', 'zc50rtyv987194c618be', 'anca123@gmail.com', 0731560215);

INSERT INTO hotel VALUES (1, 95, 5, 29, 200, 'InterContinental', 1);
INSERT INTO hotel VALUES (2, 110, 5, 32, 160, 'JW Marriott', 2);
INSERT INTO hotel VALUES (3, 90, 5, 36, 100, 'Hilton', 3);
INSERT INTO hotel VALUES (4, 130, 5, 35, 300, 'InterContinental', 4);
INSERT INTO hotel VALUES (5, 120, 5, 32, 250, 'InterContinental', 5);
INSERT INTO hotel VALUES (6, 110, 5, 30, 200, 'InterContinental', 6);
INSERT INTO hotel VALUES (7, 135, 5, 38, 185, 'Hilton', 7);
INSERT INTO hotel VALUES (8, 90, 4, 28, 165, 'Wyndham', 8);
INSERT INTO hotel VALUES (9, 160, 5, 40, 110, 'The Ritz', 9);
INSERT INTO hotel VALUES (10, 190, 5, 37, 170, 'Rosewood', 10);

INSERT INTO employee VALUES (1, 1, 1, 'Ana', 'Anghel', 'anaang@gmail.com', 0757129642, 700, TO_DATE('2020-06-16','YYYY-MM-DD'));
INSERT INTO employee VALUES (2, 1, 1, 'Andrei', 'Enescu', 'andrei_enescu@gmail.com', 746845375, 800, TO_DATE('2019-07-10','YYYY-MM-DD'));
INSERT INTO employee VALUES (3, 1, 2, 'David', 'Albu', 'dalbu12@yahoo.com', 732658712, 670, TO_DATE('2020-10-14','YYYY-MM-DD'));
INSERT INTO employee VALUES (4, 1, 2, 'Bogdan', 'Ionescu', 'bogdan.ionescu@gmail.com', 782746319, 730, TO_DATE('2020-12-01','YYYY-MM-DD'));
INSERT INTO employee VALUES (5, 1, 2, 'Ioana', 'Udrea', 'udrea_ioana@gmail.com', 712531289, 880, TO_DATE('2018-02-19','YYYY-MM-DD'));
INSERT INTO employee VALUES (6, 1, 2, 'Albert', 'Roman', 'albertroman@yahoo.com', 789127466, 960, TO_DATE('2017-10-19','YYYY-MM-DD'));
INSERT INTO employee VALUES (7, 1, 3, 'Maria', 'Istrate', 'istratemaria@gmail.com', 789652145, 560, TO_DATE('2020-06-01','YYYY-MM-DD'));
INSERT INTO employee VALUES (8, 1, 3, 'Ramona', 'Dumitrescu', 'dumitresscu_ramona1234@gmail.com', 796412034, 590, TO_DATE('2018-08-19','YYYY-MM-DD'));
INSERT INTO employee VALUES (9, 1, 3, 'Andreea', 'Olaru', 'andreea.olaru@yahoo.com', 797542844, 560, TO_DATE('2020-12-01','YYYY-MM-DD'));
INSERT INTO employee VALUES (10, 1, 3, 'Paula', 'Toma', 'tomapaula@gmail.com', 789981423, 700, TO_DATE('2019-08-05','YYYY-MM-DD'));
INSERT INTO employee VALUES (11, 1, 3, 'Andreea', 'Chivu', 'a.chivu@yahoo.com', 724644312, 820, TO_DATE('2016-12-19','YYYY-MM-DD'));
INSERT INTO employee VALUES (12, 1, 4, 'Paul', 'Achim', 'paulachim@yahoo.com', 789213287, 820, TO_DATE('2019-08-15','YYYY-MM-DD'));
INSERT INTO employee VALUES (13, 1, 4, 'Andrei', 'Marin', 'marin_andrei@gmail.com', 714406959, 900, TO_DATE('2018-09-10','YYYY-MM-DD'));
INSERT INTO employee VALUES (14, 1, 4, 'Stefan', 'Lazar', 'lazar.stefan19912gmail.com', 797111698, 1000, TO_DATE('2017-04-20','YYYY-MM-DD'));
INSERT INTO employee VALUES (15, 1, 5, 'Alin', 'Popa', 'popa23alin@gmail.com', 759021024, 970, TO_DATE('2020-08-01','YYYY-MM-DD'));
INSERT INTO employee VALUES (16, 1, 5, 'Radu', 'Popescu', 'popescu.radu@yahoo.com', 719702159, 1300, TO_DATE('2020-01-01','YYYY-MM-DD'));
INSERT INTO employee VALUES (17, 1, 6, 'Mihai', 'Ion', 'm.ion@yahoo.com', 795497014, 780, TO_DATE('2017-12-19','YYYY-MM-DD'));
INSERT INTO employee VALUES (18, 2, 1, 'Ioana', 'Pirvu', 'pirvuioana@yahoo.com', 758235996, 750, TO_DATE('2019-12-01','YYYY-MM-DD'));
INSERT INTO employee VALUES (19, 2, 2, 'Mircea', 'Iliescu', 'iliescu_mircea@gmail.com', 769824866, 740, TO_DATE('2019-08-01','YYYY-MM-DD'));
INSERT INTO employee VALUES (20, 2, 3, 'Maria', 'Ioan', 'ioan_maria@gmail.com', 721547855, 600, TO_DATE('2020-07-01','YYYY-MM-DD'));
INSERT INTO employee VALUES (21, 2, 3, 'Cristina', 'Filip', 'filip_cristina', 789461849, 620, TO_DATE('2017-06-01','YYYY-MM-DD'));
INSERT INTO employee VALUES (22, 2, 3, 'Alexandra', 'Rosu', 'rosu.alexa@yahoo.com', 799263481, 600, TO_DATE('2018-09-01','YYYY-MM-DD'));
INSERT INTO employee VALUES (23, 2, 4, 'Eugen', 'Cristea', 'eugencristea@gmail.com', 788423128, 800, TO_DATE('2020-09-01','YYYY-MM-DD'));
INSERT INTO employee VALUES (24, 2, 5, 'Adina', 'Coman', 'adina.coman23@gmail.com', 712556199, 920, TO_DATE('2020-04-01','YYYY-MM-DD'));
INSERT INTO employee VALUES (25, 2, 6, 'Denis', 'Radut', 'dennis1995@gmail.com', 731894327, 870, TO_DATE('2019-02-01','YYYY-MM-DD'));
INSERT INTO employee VALUES (26, 3, 1, 'Claudia', 'Vasilescu', 'vasilescu_claudia@yahoo.com', 719505214, 700, TO_DATE('2018-08-01','YYYY-MM-DD'));
INSERT INTO employee VALUES (27, 3, 2, 'Andrei', 'Iancu', 'andrei_iancu@gmail.com', 727028340, 760, TO_DATE('2020-04-01','YYYY-MM-DD'));
INSERT INTO employee VALUES (28, 3, 3, 'Iulia', 'Voinea', 'voineaiulia@gmail.com', 729405175, 670, TO_DATE('2020-12-01','YYYY-MM-DD'));
INSERT INTO employee VALUES (29, 3, 4, 'Ion', 'Nicolae', 'i.nicolae@yahoo.com', 789416386, 860, TO_DATE('2017-11-01','YYYY-MM-DD'));
INSERT INTO employee VALUES (30, 3, 5, 'Andrei', 'Ilie', 'ilieandrei@gmail.com', 711859326, 1450, TO_DATE('2016-08-01','YYYY-MM-DD'));
INSERT INTO employee VALUES (31, 3, 6, 'Razvan', 'Dobre', 'dobrerazvan@yahoo.com', 793481262, 780, TO_DATE('2019-10-19','YYYY-MM-DD'));
INSERT INTO employee VALUES (32, 4, 1, 'Lukas', 'Muller', 'muller.lukas@gmail.com', 493090182, 2300, TO_DATE('2019-07-01','YYYY-MM-DD'));
INSERT INTO employee VALUES (33, 4, 2, 'Manuel', 'Schmidt', 'schmidt_manuel@gmail.com', 493582189, 2600, TO_DATE('2020-05-01','YYYY-MM-DD'));
INSERT INTO employee VALUES (34, 4, 3, 'Marco', 'Becker', 'marco.becker@gmail.com', 497190192, 2100, TO_DATE('2019-04-01','YYYY-MM-DD'));
INSERT INTO employee VALUES (35, 4, 4, 'Ben', 'Meyer', 'b.meyer@yahoo.com', 493697192, 2900, TO_DATE('2020-12-01','YYYY-MM-DD'));
INSERT INTO employee VALUES (36, 4, 5, 'Toni', 'Fischer', 'fischer_toni@yahoo.com', 493396121, 3800, TO_DATE('2020-08-01','YYYY-MM-DD'));
INSERT INTO employee VALUES (37, 4, 6, 'Jonas', 'Werner', 'jonas_wener@gmail.com', 499094188, 3000, TO_DATE('2018-07-01','YYYY-MM-DD'));
INSERT INTO employee VALUES (38, 5, 1, 'Ciel', 'Aubert', 'ciel.aubertl@gmail.com', 331403203, 3100, TO_DATE('2019-07-01','YYYY-MM-DD'));
INSERT INTO employee VALUES (39, 5, 2, 'Amy', 'Bellaire', 'a.bellaire@yahoo.com', 339421207, 3500, TO_DATE('2018-01-01','YYYY-MM-DD'));
INSERT INTO employee VALUES (40, 5, 3, 'Garner', 'Benoit', 'g.benoit@yahoo.com', 334423633, 3900, TO_DATE('2019-02-01','YYYY-MM-DD'));
INSERT INTO employee VALUES (41, 5, 4, 'Elle', 'Brevard', 'e.brevard@gmail.com', 331423288, 4000, TO_DATE('2018-07-01','YYYY-MM-DD'));
INSERT INTO employee VALUES (42, 5, 5, 'Hugo', 'Cartier', 'hugo_cartier@gmail.com', 331403214, 6800, TO_DATE('2015-09-01','YYYY-MM-DD'));
INSERT INTO employee VALUES (43, 5, 6, 'Gilles', 'Gardy', 'gillesgardy@yahoo.com', 331426403, 3500, TO_DATE('2020-07-01','YYYY-MM-DD'));
INSERT INTO employee VALUES (44, 6, 1, 'Tobias', 'Gruber', 'tobiasgruber312@gmail.com', 431742856, 3100, TO_DATE('2019-08-01','YYYY-MM-DD'));
INSERT INTO employee VALUES (45, 6, 2, 'David', 'Huber', 'd.huber@gmail.com', 435792116, 3800, TO_DATE('2018-08-01','YYYY-MM-DD'));
INSERT INTO employee VALUES (46, 6, 3, 'Maximilian', 'Bauer', 'm.bauer@yahoo.com', 439142276, 4500, TO_DATE('2017-11-01','YYYY-MM-DD'));
INSERT INTO employee VALUES (47, 6, 4, 'Lukas', 'Wagner', 'l.wagner@yahoo.com', 431557810, 3900, TO_DATE('2020-12-01','YYYY-MM-DD'));
INSERT INTO employee VALUES (48, 6, 5, 'Sophia', 'Pichler', 'sophia1997@gmail.com', 431742852, 2950, TO_DATE('2020-07-01','YYYY-MM-DD'));
INSERT INTO employee VALUES (49, 6, 6, 'Simon', 'Hofer', 'simonhofer@yahoo.com', 430142059, 3000, TO_DATE('2018-02-01','YYYY-MM-DD'));
INSERT INTO employee VALUES (50, 7, 1, 'Emma', 'De Jong', 'emma58@gmail.com', 318460021, 3800, TO_DATE('2020-05-01','YYYY-MM-DD'));
INSERT INTO employee VALUES (51, 7, 2, 'Ruben', 'Janssen', 'ruben_janssen@gmail.com', 314783647, 4100, TO_DATE('2020-04-01','YYYY-MM-DD'));
INSERT INTO employee VALUES (52, 7, 3, 'Anna', 'Wisser', 'anna.visser@gmail.com', 318960361, 3500, TO_DATE('2019-08-01','YYYY-MM-DD'));
INSERT INTO employee VALUES (53, 7, 4, 'Jesse', 'Van Djik', 'jesse812@gmail.com', 311370921, 5000, TO_DATE('2017-11-01','YYYY-MM-DD'));
INSERT INTO employee VALUES (54, 7, 5, 'Lynn', 'Meijer', 'lynn.meijer@yahoo.com', 318968070, 8500, TO_DATE('2015-05-01','YYYY-MM-DD'));
INSERT INTO employee VALUES (55, 7, 6, 'Milan', 'Smit', 'milansmit@gmail.com', 319479521, 4200, TO_DATE('2019-05-01','YYYY-MM-DD'));
INSERT INTO employee VALUES (56, 8, 1, 'Ali', 'Nahas', 'alinahas@yahoo.com', 971639002, 4500, TO_DATE('2020-03-01','YYYY-MM-DD'));
INSERT INTO employee VALUES (57, 8, 2, 'Fakih', 'Nader', 'f.nader@yahoo.com', 971094022, 6000, TO_DATE('2018-08-01','YYYY-MM-DD'));
INSERT INTO employee VALUES (58, 8, 3, 'Kayley', 'Rahar', 'k.rahar@gmail.com', 971633070, 4200, TO_DATE('2019-10-01','YYYY-MM-DD'));
INSERT INTO employee VALUES (59, 8, 4, 'Haik', 'Hassan', 'haikhassan@yahoo.com', 971829053, 5300, TO_DATE('2019-06-01','YYYY-MM-DD'));
INSERT INTO employee VALUES (60, 8, 5, 'Jabir', 'Isa', 'j.isa@gmail.com', 971239522, 8700, TO_DATE('2018-07-01','YYYY-MM-DD'));
INSERT INTO employee VALUES (61, 8, 6, 'Munir', 'Wasem', 'munir_wasem@yahoo.com', 971432057, 4100, TO_DATE('2018-11-01','YYYY-MM-DD'));
INSERT INTO employee VALUES (62, 9, 1, 'Oliver', 'Adams', 'oliver_adams@gmail.com', 442195385, 3100, TO_DATE('2020-04-01','YYYY-MM-DD'));
INSERT INTO employee VALUES (63, 9, 2, 'Harry', 'Allen', 'h.allen@gmail.com', 449125345, 4900, TO_DATE('2018-08-01','YYYY-MM-DD'));
INSERT INTO employee VALUES (64, 9, 3, 'George', 'Baker', 'george_baker@gmail.com', 440148124, 3600, TO_DATE('2019-02-01','YYYY-MM-DD'));
INSERT INTO employee VALUES (65, 9, 4, 'Amelia', 'Cole', 'amelia_cole@yahoo.com', 442005882, 4700, TO_DATE('2020-12-01','YYYY-MM-DD'));
INSERT INTO employee VALUES (66, 9, 5, 'Harper', 'Dawson', 'h.dawson@yahoo.com', 442125332, 7100, TO_DATE('2020-01-01','YYYY-MM-DD'));
INSERT INTO employee VALUES (67, 9, 6, 'Henry', 'Evans', 'h.evans@gmail.com', 442792700, 3800, TO_DATE('2019-07-01','YYYY-MM-DD'));
INSERT INTO employee VALUES (68, 10, 1, 'Noah', 'Foster', 'n.foster@gmail.com', 446190389, 2900, TO_DATE('2020-12-01','YYYY-MM-DD'));
INSERT INTO employee VALUES (69, 10, 2, 'Oscar', 'Grant', 'oscargrant2910@gmail.com', 442865180, 3800, TO_DATE('2019-10-01','YYYY-MM-DD'));
INSERT INTO employee VALUES (70, 10, 3, 'Harper', 'James', 'h.james007@yahoo.com', 446007492, 3700, TO_DATE('2018-07-01','YYYY-MM-DD'));
INSERT INTO employee VALUES (71, 10, 4, 'Theo', 'Hill', 'theo_hill@gmail.com', 441295282, 4900, TO_DATE('2019-05-01','YYYY-MM-DD'));
INSERT INTO employee VALUES (72, 10, 5, 'Jacob', 'Lee', 'jacoblee@gmail.com', 440135681, 8500, TO_DATE('2017-10-01','YYYY-MM-DD'));
INSERT INTO employee VALUES (73, 10, 6, 'Martin', 'Robinsom', 'martin_robinson@gmail.com', 441590350, 5000, TO_DATE('2016-07-01','YYYY-MM-DD'));

INSERT INTO booking VALUES (1, 3, 'Alin', 'Neaga', TO_DATE('2020-12-16','YYYY-MM-DD'), TO_DATE('2020-12-23','YYYY-MM-DD'));
INSERT INTO booking VALUES (3, 2, 'Maria', 'Voinea', TO_DATE('2020-12-20','YYYY-MM-DD'), TO_DATE('2020-12-27','YYYY-MM-DD'));
INSERT INTO booking VALUES (10, 3, 'Alin', 'Neaga', TO_DATE('2021-01-19','YYYY-MM-DD'), TO_DATE('2021-01-26','YYYY-MM-DD'));
INSERT INTO booking VALUES (8, 1, 'Elena', 'Ionescu', TO_DATE('2021-03-08','YYYY-MM-DD'), TO_DATE('2021-03-22','YYYY-MM-DD'));
INSERT INTO booking VALUES (2, 6, 'Sorin', 'Marica', TO_DATE('2020-12-28','YYYY-MM-DD'), TO_DATE('2021-01-04','YYYY-MM-DD'));
INSERT INTO booking VALUES (5, 8, 'Sofia', 'Gheorghe', TO_DATE('2021-02-21','YYYY-MM-DD'), TO_DATE('2021-02-28','YYYY-MM-DD'));
INSERT INTO booking VALUES (7, 7, 'Ramona', 'Voicu', TO_DATE('2021-01-11','YYYY-MM-DD'), TO_DATE('2021-01-18','YYYY-MM-DD'));
INSERT INTO booking VALUES (9, 4, 'Flavia', 'Ana', TO_DATE('2021-02-10','YYYY-MM-DD'), TO_DATE('2021-02-17','YYYY-MM-DD'));
INSERT INTO booking VALUES (6, 5, 'Mihai', 'Avram', TO_DATE('2020-12-30','YYYY-MM-DD'), TO_DATE('2021-01-06','YYYY-MM-DD'));
INSERT INTO booking VALUES (4, 7, 'Ramona', 'Voicu', TO_DATE('2021-02-27','YYYY-MM-DD'), TO_DATE('2021-03-03','YYYY-MM-DD'));

-- 6). A stored function subprogram, which receives three names and returns the index accompanied by the salary of each.

CREATE TYPE obj AS OBJECT (
    id     NUMBER,
    salary NUMBER
);
/
CREATE TYPE tabl IS TABLE OF obj;
/
CREATE OR REPLACE FUNCTION f (v_name1 employee.last_name%TYPE DEFAULT 'Robinsom', v_name2 employee.last_name%TYPE DEFAULT 'Lee', v_name3 employee.last_name%TYPE DEFAULT 'Hill') RETURN tabl AS
    l_tabl tabl := tabl();
    salary1 employee.salary%type;
    salary2 employee.salary%type;
    salary3 employee.salary%type;
BEGIN
    SELECT salary 
    INTO salary1 
    FROM employee 
    WHERE last_name = v_name1;
    
    SELECT salary 
    INTO salary2 
    FROM employee 
    WHERE last_name = v_name2;
    
    SELECT salary 
    INTO salary3 
    FROM employee 
    WHERE last_name = v_name3; 
    
    l_tabl.extend;
    l_tabl(l_tabl.last) := obj(1, salary1);
    
    l_tabl.extend;
    l_tabl(l_tabl.last) := obj(2, salary2);
    
    l_tabl.extend;
    l_tabl(l_tabl.last) := obj(3, salary3);
    
    RETURN l_tabl;
END;
/
SELECT *
FROM TABLE(f);

-- 7). A stored function subprogram, which receives three departments and returns, with the help of a cursor, the id of each and the manager of the respective department. 

CREATE TYPE obj7 AS OBJECT (
    id NUMBER,
    manager_name VARCHAR2(100)
);
/
CREATE TYPE tabl7 IS TABLE OF obj7;
/
CREATE OR REPLACE FUNCTION f7 (v_dept1 department.department_name%TYPE DEFAULT 'front_office', v_dept2 department.department_name%TYPE DEFAULT 'housekeeping', v_dept3 department.department_name%TYPE DEFAULT 'food_production') RETURN tabl7 AS
    l_tabl7 tabl7 := tabl7();
    CURSOR c IS
        SELECT *
        FROM department
        WHERE department_name IN (v_dept1, v_dept2, v_dept3);
BEGIN
    FOR i IN c LOOP
        l_tabl7.extend;
        l_tabl7(l_tabl7.last) := obj7(i.id, i.manager_name);
    END LOOP;
    RETURN l_tabl7;
END;
/
SELECT * 
FROM TABLE(f7);
/

-- 8). Un subprogram stocat de tip functie, care primeste numele unui angajat si returneaza orasul in care lucreaza acesta.

CREATE OR REPLACE FUNCTION test (v_nume employee.last_name%TYPE DEFAULT 'Werner') RETURN VARCHAR2 IS
    loc location.city%type;
BEGIN
    SELECT l.city
    INTO loc
    FROM employee e JOIN hotel h ON (e.hotel_id = h.id)
                    JOIN location l ON (h.location_id = l.id)
    WHERE e.last_name = v_nume;
    RETURN loc;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RAISE_APPLICATION_ERROR(-20000, 'Nu exista angajati cu numele dat!');
    WHEN TOO_MANY_ROWS THEN
        RAISE_APPLICATION_ERROR(-20001, 'Exista mai multi angajati cu numele dat!');
    WHEN OTHERS THEN
        RAISE_APPLICATION_ERROR(-20002, 'Alta eroare!');
END test;
/
SELECT test
FROM DUAL;
/

-- 9). A stored procedure subprogram, which receives the email of a person who has made a reservation and displays the museum in the city where the reservation was made.

CREATE OR REPLACE PROCEDURE p9 (v_email register.email%TYPE) IS
    sol details.museum%TYPE;
BEGIN
    SELECT d.museum
    INTO sol
    FROM register r JOIN booking b ON (r.id = b.register_id)
                    JOIN hotel h ON (b.hotel_id = h.id)
                    JOIN location l ON (h.location_id = l.id)
                    JOIN details d ON (l.details_id = d.id)
    WHERE  r.email = v_email;
    DBMS_OUTPUT.PUT_LINE(sol);
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RAISE_APPLICATION_ERROR(-20000, 'Nu exista inregistrari cu acest email!');
    WHEN TOO_MANY_ROWS THEN
        RAISE_APPLICATION_ERROR(-20001, 'Exista mai multe inregistrari cu acest email!');
    WHEN OTHERS THEN
        RAISE_APPLICATION_ERROR(-20002, 'Alta eroare!');
END p9;
/
BEGIN
    p9('ioana_maria@yahoo.com');
END;
/

-- 10). Command level LMD trigger that blocks changes in the register table between 12-14.

CREATE OR REPLACE TRIGGER trig10
    BEFORE INSERT OR UPDATE OR DELETE  ON register
BEGIN
    IF(TO_CHAR(SYSDATE, 'HH24') BETWEEN 12 AND 14)
        THEN RAISE_APPLICATION_ERROR(-20001, 'Tabelul nu poate fi actualizat!');
    END IF;
END;
/

-- 11). LMD trigger at line level that does not allow the modification of an email in the register table.

CREATE OR REPLACE TRIGGER trig11
    BEFORE UPDATE OF email ON register
    FOR EACH ROW
BEGIN
    IF (:NEW.email != :OLD.email)
        THEN RAISE_APPLICATION_ERROR(-20002, 'Email-ul nu poate fi modificat!');
    END IF;
END;
/

-- 12). LDD trigger that enters data into the table.

CREATE TABLE audit1
    (utilizator VARCHAR2(100),  
     nume_bd VARCHAR2(100), 
     eveniment VARCHAR2(100), 
     nume_obiect VARCHAR2(100), 
     data DATE); 
CREATE OR REPLACE TRIGGER trig12 
    AFTER CREATE OR DROP OR ALTER ON SCHEMA 
BEGIN 
    INSERT INTO audit1 VALUES (SYS.LOGIN_USER, SYS.DATABASE_NAME, SYS.SYSEVENT, SYS.DICTIONARY_OBJ_NAME, SYSDATE); 
END; 
/ 
CREATE INDEX ind ON register(username); 
DROP INDEX ind; 
SELECT * FROM audit1;  
DROP TRIGGER trig12;
