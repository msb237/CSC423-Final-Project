import cx_Oracle
import pandas as pd

cx_Oracle.init_oracle_client(lib_dir = r"..\instantclient_19_9")
connection = cx_Oracle.connect(
    "user", "mypass", "lawtech.law.miami.edu/CSC_423")
cursor = connection.cursor()

print("Which query would you like to try?\n")
print("Query 1: List the designated employee(s) and the days they work for the client Zach Dennis.\n")
print("Query 2: Show the dates and time for cleaning, and the equipment description and time it is used for Scott Cooley.\n")
print("Query 3: Show which person and their phone number the squeegee is used for.\n")
print("Query 4: Show how many employees work for BusyBee that have an A in their name.\n")
print("Query 5: Show all of the equipment that costs between 15-150, in order.\n")
print("Please enter the number: ")
query = int(input())

if query == 1:
	print("\n")
	cursor.execute("""
		SELECT e.fName, e.lName, x.daysWorked
		FROM Services s
		INNER JOIN Client c ON s.clientNo = c.clientNo
		INNER JOIN employeeWork x ON s.requirementNo = x.requirementNo
		INNER JOIN Employees e ON x.staffNo = e.staffNo
		WHERE c.fName LIKE 'Zach' AND c.lName LIKE 'Dennis'
		""")
	columns = [c[0] for c in cursor.description]
	data = cursor.fetchall()
	df = pd.DataFrame(data, columns = columns)
	print(df)
elif query == 2:
	print("\n")
	cursor.execute("""
		SELECT e.description, x.timeUsed, s.dayOfWeek, s.startTime, s.endTime
		FROM Services s
		INNER JOIN equipmentUsed x ON s.requirementNo = x.requirementNo
		INNER JOIN Equipment e ON x.equipmentNo = e.equipmentNo
		INNER JOIN Client c ON s.clientNo = c.clientNo
		WHERE c.fName LIKE 'Scott' AND c.lName LIKE 'Cooley'
		""")
	columns = [c[0] for c in cursor.description]
	data = cursor.fetchall()
	df = pd.DataFrame(data, columns = columns)
	print(df) 
elif query == 3:
	print("\n")
	cursor.execute("""
		SELECT c.fName, c.lName, c.phonenum
		FROM Services s
		INNER JOIN Client c ON s.clientNo = c.clientNo
		INNER JOIN equipmentUsed x ON s.requirementNo = x.requirementNo
		INNER JOIN Equipment e ON x.equipmentNo = e.equipmentNo
		WHERE description = 'Squeegee'
		""")
	columns = [c[0] for c in cursor.description]
	data = cursor.fetchall()
	df = pd.DataFrame(data, columns = columns)
	print(df)
elif query == 4:
	print("\n")
	cursor.execute("""
		SELECT COUNT(*) AS employeesWithA
		FROM Employees
		WHERE fName LIKE '%a%' OR fName LIKE '%A' OR lName LIKE '%a%' OR lName LIKE '%A%'
		""")
	columns = [c[0] for c in cursor.description]
	data = cursor.fetchall()
	df = pd.DataFrame(data, columns = columns)
	print(df)
elif query == 5:
	print("\n")
	cursor.execute("""
		SELECT *
		FROM Equipment
		WHERE cost > 14 AND cost < 151
		ORDER BY cost
		""")
	columns = [c[0] for c in cursor.description]
	data = cursor.fetchall()
	df = pd.DataFrame(data, columns = columns)
	print(df)
else:
	print("You entered an invalid query number, please try again.")