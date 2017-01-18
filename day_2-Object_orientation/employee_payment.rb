require "pry"

class Employee
	attr_reader :name, :email
	def initialize(name, email)
		@name = name
		@email = email
	end
end

class HourlyEmployee < Employee

	attr_accessor :hourly_rate, :hours_worked

	def initialize(name, email, hourly_rate, hours_worked)
		super(name, email)
		@hourly_rate = hourly_rate
		@hours_worked = hours_worked
	end

	def calculate_salary
		@hourly_rate * @hours_worked
	end
end

class SalariedEmployee < Employee

	attr_accessor :yearly_salary

	def initialize(name, email, yearly_salary)
		super(name, email)
		@yearly_salary = yearly_salary
	end

	def calculate_salary
		@yearly_salary / 54
	end
end

class MultiPaymentEmployee < Employee

	attr_accessor :hourly_rate, :hours_worked, :yearly_salary

	def initialize(name, email, yearly_salary, hourly_rate, hours_worked)
		super(name, email)
		@yearly_salary = yearly_salary
		@hourly_rate = hourly_rate
		@hours_worked = hours_worked
	end

	def calculate_salary
		if @hours_worked > 40
			@yearly_salary / 54 + (@hours_worked - 40)* @hourly_rate
		else
			@yearly_salary / 54
		end
	end
end

class Payroll
	def initialize(employees)
		@employees = employees
	end

	def pay_employees
		total = @employees.reduce(0) do |sum, emp|
			puts "#{emp.name}\'s salary is: #{(emp.calculate_salary * 0.82).round(2)}"
			sum + emp.calculate_salary
		end
		puts total
	end
	def notify_employee
		@employees.each do |emp|
			puts "send email to #{emp.email}"
		end
	end
end


josh = HourlyEmployee.new('Josh', 'nachoemail@example.com', 35, 50)

nizar = SalariedEmployee.new('Nizar', 'starcraftrulez@gmail.com', 1000000)

ted = MultiPaymentEmployee.new('Ted', 'fortranr0x@gmail.com', 60000, 275, 55)

mario = HourlyEmployee.new('mario', 'nachoemail@example.com', 15, 50)

dani = HourlyEmployee.new('dani', 'nachoemail@example.com', 15, 50)



employees = [josh, nizar, ted, mario, dani]

ih_employees = Payroll.new(employees)
ih_employees.pay_employees
ih_employees.notify_employee
