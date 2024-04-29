CREATE SCHEMA DB01Project;

CREATE TABLE Airport (
AirportCode VARCHAR(7) NOT NULL ,
AirportName VARCHAR(50) ,
NumberOfLoungues INT(4) ,
NumberOfGates INT(4) ,
country VARCHAR(20) ,
city VARCHAR(20) ,
street VARCHAR(20) ,
CONSTRAINT Airport_PK PRIMARY KEY (AirportCode)
);

CREATE TABLE Airlines(
AirLinesName VARCHAR(30) NOT NULL,
numberOfAircraft INT(3) ,
numberOfDestination INT(5) ,
CONSTRAINT Airlines_PK PRIMARY KEY (AirLinesName)
);

CREATE TABLE Employee(
employeeID VARCHAR(7) NOT NULL ,
fName VARCHAR(20) , 
lName VARCHAR(20) ,
workPosition VARCHAR(40) ,
email VARCHAR(30) ,
address VARCHAR(50) ,
AirportCode VARCHAR(7) ,
CONSTRAINT Employee_PK PRIMARY KEY(employeeID) ,
CONSTRAINT Employee_FK FOREIGN KEY(AirportCode) REFERENCES Airport(AirportCode) ON DELETE SET NULL
);

CREATE TABLE AirlineCrew(
SSN VARCHAR(7) NOT NULL ,
fName VARCHAR(20) , 
lName VARCHAR(20) ,
workPosition VARCHAR(40) ,
email VARCHAR(30) ,
address VARCHAR(50) ,
AirLinesName VARCHAR(30) ,
CONSTRAINT AirlineCrew_PK PRIMARY KEY(SSN) ,
CONSTRAINT AirlineCrew_FK FOREIGN KEY(AirLinesName) REFERENCES Airlines(AirLinesName) ON DELETE SET NULL
);

CREATE TABLE Flight(
flightNO VARCHAR(7) NOT NULL ,
gateNO VARCHAR(7) ,
takeOffPoint VARCHAR(20) , 
landingPoint VARCHAR(20) ,
takeOffDate VARCHAR(20) ,
takeOffTime VARCHAR(6) ,
ladingTime VARCHAR(6) ,
flightDuration VARCHAR(20) ,
aircraftName VARCHAR(20) ,
AirLinesName VARCHAR(30) ,
CONSTRAINT Flight_PK PRIMARY KEY(flightNO) ,
CONSTRAINT Flight_FK FOREIGN KEY(AirLinesName) REFERENCES Airlines(AirLinesName) ON DELETE SET NULL
 );
 
 CREATE TABLE Passenger(
passengerNO VARCHAR(7) NOT NULL ,
passengerID INT(10) UNIQUE ,
fName VARCHAR(20) , 
lName VARCHAR(20) ,
classType VARCHAR(20) ,
seatNo VARCHAR(7) ,
luggageWeight VARCHAR(7) ,
cost INT(10.2) ,
flightNO VARCHAR(7) ,
AirLinesName VARCHAR(30) ,
PassPhoneNo VARCHAR(15) ,
CONSTRAINT Passenger_PK PRIMARY KEY(passengerNO) ,
CONSTRAINT Passenger_FK1 FOREIGN KEY(flightNO) REFERENCES Flight(flightNO) ON DELETE SET NULL ,
CONSTRAINT Passenger_FK2 FOREIGN KEY(AirLinesName) REFERENCES Airlines(AirLinesName) ON DELETE SET NULL ,
CONSTRAINT Passenger_FK3 FOREIGN KEY(classType) REFERENCES AirlinesClasses(Class) ON DELETE CASCADE
 );
 
 CREATE TABLE AirlinesRenting(
 AirportCode VARCHAR(7) ,
 AirLinesName VARCHAR(30) ,
 timeOfWaiting VARCHAR(7) ,
 parkingspot VARCHAR(7) ,
 CONSTRAINT AirlinesRenting_PK PRIMARY KEY(AirportCode, AirLinesName), 
 CONSTRAINT AirlinesRenting_FK1 FOREIGN KEY(AirportCode) REFERENCES Airport(AirportCode) ON DELETE CASCADE ,
 CONSTRAINT AirlinesRenting_FK2 FOREIGN KEY(AirLinesName) REFERENCES Airlines(AirLinesName) ON DELETE CASCADE
 );
 
 CREATE TABLE AirlinesClasses(
 Class VARCHAR(20) NOT NULL,
 AirLinesName VARCHAR(30) ,
  CONSTRAINT AirlinesClasses_PK PRIMARY KEY(Class,AirLinesName) ,
  CONSTRAINT AirlinesClasses_FK FOREIGN KEY(AirLinesName) REFERENCES Airlines(AirLinesName) ON DELETE CASCADE
 );
 
 CREATE TABLE EmpPhoneNo(
 EmpPhoneNo VARCHAR(15) NOT NULL ,
 employeeID VARCHAR(7) ,
 CONSTRAINT EmpPhoneNo_PK PRIMARY KEY(EmpPhoneNo,employeeID) ,
 CONSTRAINT EmpPhoneNo_FK FOREIGN KEY(employeeID) REFERENCES Employee(employeeID) ON DELETE CASCADE
 );
 
 CREATE TABLE AirlinesCrewPhoneNo(
 ALCPhoneNo VARCHAR(15) NOT NULL ,
 SSN VARCHAR(7) ,
 CONSTRAINT AirlinesCrewPhoneNo_PK PRIMARY KEY(ALCPhoneNo,SSN) ,
 CONSTRAINT AirlinesCrewPhoneNo_FK FOREIGN KEY(SSN) REFERENCES AirlineCrew(SSN) ON DELETE CASCADE
 );
 
INSERT INTO Airport VALUES 
('DMMOEDF', 'King Fahd International', 3, 15, 'Saudi Arabia' , 'Al Dammam', 'Downtown of Dammam') , 
('JEDOEJN', 'King Abdulaziz International', 3, 64, 'Saudi Arabia' , 'Jeddah', 'Prince Majed') ,
('MEDOEMA', 'Prince Mohammad Bin Abdulaziz', 1, 26, 'Saudi Arabia' , 'Al Madinah', 'King Salman') ,
('RUHOERK', 'King Khaled International', 7 , 16, 'Saudi Arabia' , 'Riyadh', 'Muhammed Ibn Farj ') ,
('TUUOETB', 'Prince Sultan bin Abdulaziz Airport', 1, 13, 'Saudi Arabia' , 'Tabuk', 'Tabuk Airport');

INSERT INTO Airlines VALUES
('Saudia Airlines', 150, 90) ,
('Qatar Airways', 200, 150) ,
('Emirates Airways', 262, 152) ,
('Etihad Airways' ,101, 71) ,
('Turkish Airlines' , 332, 320);

INSERT INTO Employee VALUES
('JED5OSR' ,'Bandar', 'Jamal', 'security guard', 'Bj22@gmail.com' ,'130 Al Hakima Street, Jeddah', 'JEDOEJN' ),
('RUHSV29', 'Danyal', 'Smith', 'air traffic control', 'Danyal@gmail.com', '207  Al Andalus Street, Riyadh', 'RUHOERK'),
('DMM2QUG', 'Mohammed', 'Al-Nnaseri', 'IT Security Section Head', 'm.20@@gmail.com','105 Sari Street, Al Dammam','DMMOEDF'  ),
('JEDU6PV' ,'Hanan',' Al-Ghazali', 'Nurse', 'Ha_93@gmail.com', '30 Al Falah Street, Jeddah', 'JEDOEJN' ),
('DMMT7BH', 'Jimmy', 'Wilson', 'Receptionist','jimWilson@gmail.com' ,'6  Hira Street, Al Dammam' , 'DMMOEDF'),
('RUHFD4R', 'William', 'Jones','baggage service','W_jon@gmail.com', '310 Al Amal Street, Riyadh','RUHOERK'   ) ,
('MEDEJI9','Ahmed','Al-Ali', 'Receptionist','ahmAl-ali@gmail.com', '80 Al Salam Street, Al Madinah', 'MEDOEMA' ),
('RUH2ECA', 'Kenan', 'Ansari','Director of Personnel','kenanAnsari@gmail.com', '145 Sari Street, Riyadh', 'RUHOERK'  ), 
('JEDFP6A', 'James', 'Brown', 'emergency doctor', 'Ja.brown@gmail.com', '102 Al Haramain Street, Jeddah', 'JEDOEJN'),
('TUUNLB0', 'Maha','Al-Faruqi','Passenger Service Officer','mahaFaruqi@gmail.com' , '50 Al Salam Street, Tabuk', 'TUUOETB' );

INSERT INTO AirlineCrew VALUES
('QATFMX5', 'Thomas','Wilson','Civil aviation pilot', 'Thomas.11@gmail.com','144 Tihama Street, Al Rayyan', 'Qatar Airways') ,
('ETI9UPJ', 'Henry', 'Davis', 'pilot', 'HenryDavis@gmail.com', '55 Al Maqab Street, Abu Dhabi', 'Etihad Airways') ,
('EMI5UIS', 'Hazae', 'Al-Khalifi', 'flight engineer','h. AlKhalifi@gmail.com', '106 Jumeirah Street, Dubai','Emirates Airways' ),
('SAUTWL4', 'Abdullah', 'Al-Amri', 'Co-pilot', 'AbdullahAmri@gmail.com', '8 Al Falah Street, Jeddah', 'Saudia Airlines') ,
('QATNCA6', 'Hmad', 'Al-Muhanndi', 'Air Host','Hmad_89@gmai.com', '22 Al Najda Street, Doha', 'Qatar Airways') ,
('EMI7K6F', 'Mohammed ', 'Al-Ali', 'Air host','mohaAli@gmail.com', '180 Al Khail Street, Dubai', 'Emirates Airways') ,
('ETID8E2', 'Jenny', 'Smith', 'Air Hostess', 'JennySmith@gmail.com', '138 Muroor Street, Abu Dhabi', 'Etihad Airways') ,
('SAUL0IT', 'Manal', 'Ahmed', 'Air Hostess', 'ManalAhmed@gmail.com', '125 Al-Faisal Street, Riyadh', 'Saudia Airlines') ,
('SAUMN4X', 'Afnan', 'Alshammari', 'Flight Nurse', 'afnanShammari@gmail.com', 'afnanShammari@gmail.com', 'Saudia Airlines') ,
('TURMLE4', 'Arda ', 'Sabanci', 'Chef','ArdaSabanci@gmai.com', '84 Bebek District, Istanbul', 'Turkish Airlines');

INSERT INTO Flight VALUES
('SV 598', 'G105', 'Jeddah', 'Dubai', '28 OCT 2022', '23:10', '03:00', '2h50m', 'Airbus A320', 'Saudia Airlines') ,
('EK414', 'G110', 'Ad Dmmam', 'Sydney', '08 NOV 2022', '20:20', '23:30', '18h10m', 'Boeing 777-300ER', 'Emirates Airways') ,
('QR1175', 'G118','Riyadh', 'Doha', '19 NOV 2022', '04:40', '06:50', '2h10m', 'Airbus A320', 'Qatar Airways') ,
('EY 322', 'G104', 'Ad Dmmam', 'Barcelona', '04 DEC 2022', '10:45', '11:00', '15h26m', 'Airbus A321-100', 'Etihad Airways') ,
('SV 1052', 'G107', 'Jeddah', 'Seoul', '30 OCT 2022', '23:00', '20:50', '15h50m', 'Boeing 787-9', 'Saudia Airlines') ,
('EY 326', 'G103', 'Jeddah ', 'London', '25 NOV 2022', '23:00', '12:10', '10h16m', 'Boeing 787-9', 'Etihad Airways') ,
('SV 127', 'G120', 'Riyadh', 'Zurich', '01 NOV 2022', '08:55', '17:40', '10h45m', 'Airbus A319', 'Saudia Airlines') , 
('EK127', 'G115', 'Riyadh', 'Vienna', '13 NOV 2022', '03:55', '12:25', '10h30m', 'Boeing 777-300ER', 'Emirates Airways') ,
('QR1302', 'G124', 'Cairo', 'Al Madinah', '01 JAN 2023', '19:40', '03:40', '7h', 'Boeing 777-300ER', 'Qatar Airways') ,
('TK145', 'G109', 'Tabuk', 'Istanbul', '10 JAN 2023', '02:10', '11:25', '9h 15m', 'Airbus A321', 'Turkish Airlines');

INSERT INTO Passenger VALUES
('DOHA22', 1249702856, 'Hamdan', 'Al Madini', 'Classic', '12A', '35kg', 3516.54, 'QR1175', 'Qatar Airways', '+966502590046+') ,
('SYDA05', 1178994604, 'Muhra', 'Al-Khalifi', 'Business', '10G', '40kg', 46970.00, 'EK414', 'Emirates Airways', '+966555378123') ,
('DUI31L', 1112424587, 'Layan', 'Abdullah', 'Guest', '31L', '2x23 kg', 1574.00, 'SV 598', 'Saudia Airlines', '+966532978013') ,
('DUI5D', 1345568879, 'Amer', 'Mohammed','Business', '5D', '2x23 kg', 2812.00, 'SV 598', 'Saudia Airlines', '+966542114807') ,
('LON13A', 1475001788, 'Nouf', 'Al-Kathiri', 'Economy', '13A', '35kg', 14636.00, 'EY 326', 'Etihad Airways', '+966583269008') ,
('BAR1D', 2014587798, 'Henry', 'Smith', 'Business', '1D', '40kg', 13092.00, 'EY 322', 'Etihad Airways', '+966505553214') ,
('DOH02A', 1230011455, 'Arwa', 'Al-Nnaseri', 'Elite', '02A', '50 kg', 7609.54, 'QR1175', 'Qatar Airways', '+966596470099') ,
('SEL23L', 1665227801, 'Sara', 'Al-Ghazali', 'Guest', '23L', '2x23 kg', 2608.00, 'SV 1052', 'Saudia Airlines', '+966502115344') ,
('SEL23K', 1457809934, 'Jamal', 'Ansari', 'Guest', '23K', '2x23 kg', 2608.00,  'SV 1052', 'Saudia Airlines', '+966571557804') ,
('VIE2A', 2014478520, 'James', 'Jones', 'First', '2A', '50 kg', 51988.00, 'EK127', 'Emirates Airways', '+966542590045' ) ,
('IST03F', 2013354787, 'Aynur', 'Ciner', 'Business', '03F', '30 kg', 3880.00, 'TK145', 'Turkish Airlines', '+966553985311') ,
('DOH02D', 2145875524, 'Joseph', 'Wilson', 'Elite', '02D', '50 kg', 7609.54, 'QR1175', 'Qatar Airways', '+966577074125') ,
('ZUR4H', 1235877001, 'Sama', 'Ahmed', 'Business', '4H', '2x23 kg', 16237.00, 'SV 127', 'Saudia Airlines', '+966555551185');

INSERT INTO AirlinesRenting VALUES
('DMMOEDF', 'Etihad Airways','2h45m','A05N'),
('JEDOEJN', 'Saudia Airlines','6h27m','B103S'),
('MEDOEMA', 'Qatar Airways','1h56m','D316W'),
('RUHOERK', 'Emirates Airways','7h32m','C209E'),
('TUUOETB', 'Turkish Airlines','12h10m','B111S');

INSERT INTO AirlinesClasses VALUES 
('Guest','Saudia Airlines'),
('Business', 'Saudia Airlines') , 
('Classic', 'Qatar Airways'),
('Elite', 'Qatar Airways') ,
('Business', 'Emirates Airways') ,
('First', 'Emirates Airways') ,
('Economy', 'Emirates Airways') ,
('Economy' ,'Etihad Airways') ,
('Business' ,'Etihad Airways') ,
('Business', 'Turkish Airlines');


INSERT INTO EmpPhoneNo VALUES
('+966502224128', 'JED5OSR') , 
('+966533501277', 'RUHSV29') ,
('+966570532693', 'DMM2QUG') ,
('+966588124880', 'JEDU6PV') ,
('+966542560078', 'DMMT7BH') ,
('+966904990012', 'RUHFD4R') ,
('+966532490044', 'MEDEJI9') ,
('+966565558281', 'RUH2ECA') ,
('+966596345212', 'JEDFP6A') ,
('+966553491278', 'TUUNLB0') ;

INSERT INTO AirlinesCrewPhoneNo VALUES
('+966502457981', 'QATFMX5') , 
('+966554789124', 'ETI9UPJ') ,
('+966578422479', 'EMI5UIS') ,
('+966555578422', 'SAUTWL4') ,
('+966588842177', 'QATNCA6') ,
('+966533322110', 'EMI7K6F') ,
('+966500007894', 'ETID8E2') ,
('+966552149752', 'SAUL0IT') ,
('+966532468745', 'SAUMN4X') ,
('+966505478944', 'TURMLE4') ;

UPDATE AirlinesRenting
SET timeOfWaiting = '7h15m'
WHERE timeOfWaiting = '6h27m';

SELECT PassengerNO , Cost
FROM  Passenger  
WHERE  Cost > 3000.00
ORDER BY Cost;

SELECT PassengerNO , Cost
FROM  Passenger  
WHERE Cost BETWEEN 1200.00 AND 4500.00
ORDER BY Cost;

SELECT AirLinesName, COUNT(PassengerNO) AS count, SUM(Cost) AS sum 
FROM Passenger
GROUP BY AirLinesName
ORDER BY AirLinesName;

SELECT flightNO, flightDuration
FROM Flight
WHERE flightDuration > (SELECT AVG(flightDuration) FROM Flight);

SELECT classType, COUNT(passengerID) AS total , SUM(cost) AS totalOfCost 
FROM Passenger
GROUP BY classType 
HAVING COUNT(classType)>=2;

SELECT i.airportCode, airportName, employeeID, workPosition 
FROM Airport i, Employee c
WHERE i.airportCode = c.airportCode
ORDER BY employeeID DESC;

SELECT fName, lName, classType, seatNo, f.flightNO, gateNo, takeOffPoint, TakeOffTime, landingPoint, p.AirLinesName
FROM Passenger p, Flight f
WHERE p.AirLinesName = 'Saudia Airlines' AND f.flightNo = p.flightNo
ORDER BY takeOffPoint;

SELECT 		numberOfAircraft, AirLinesName
FROM 		Airlines
WHERE		AirLinesName IN ( 
							SELECT  AirLinesName
                            FROM 	AirlineCrew
                            WHERE 	workPosition ='air host');
                            
SELECT		AirLinesName, COUNT(AirLinesName) AS NumberOfAirlineCrew
FROM 		AirlineCrew
GROUP BY	AirLinesName
ORDER BY	AirLinesName;

DELETE FROM Employee 
WHERE workPosition = 'IT Security Section';
 
SELECT        *
FROM        Airlines
ORDER BY    numberOfDestination,AirLinesName,numberOfAircraft DESC;


SELECT        AirportName, NumberOfLoungues, NumberOfGates
FROM           Airport
WHERE         NumberOfGates< (SELECT AVG(NumberOfGates)
						      FROM airport)
ORDER BY NumberOfGates;

SELECT AirlinesName, numberOfAircraft
FROM Airlines
WHERE numberOfAircraft BETWEEN 100 AND 250
ORDER BY numberOfAircraft ASC;

SELECT MAX(cost), passengerNO
FROM passenger;