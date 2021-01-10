require 'date'

months = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"]

previous_year = -1
current_year = -2

previous_month = "previous_month"
current_month = "current_month"

previous_week = "previous_week"
current_week = "current_week"

#Generacion de dias
f = DateTime.new(2020, 1, 1)

while f.year <= 2021 do
  date_str = "#{f.day.to_s.rjust(2, "0")}/#{f.month.to_s.rjust(2, "0")}/#{f.year}"
  date = "#{f.year}/#{f.month.to_s.rjust(2, "0")}/#{f.day.to_s.rjust(2, "0")}"
  month = f.month
  month_str = months[(month - 1)]
  week = f.cweek
  week_str = week.to_s.rjust(2, "0")
  year = f.year

  current_year = year
  if current_year != previous_year
    puts '### NEW YEAR ###'
    puts "insert year #{current_year}"
    year_m = Year.create!(year: current_year)
    previous_year = current_year
  end

  if f.month == 1 and week > 51
    year = year - 1
  end

  current_week = "#{year} #{week_str}"
  if current_week != previous_week
    puts '### NEW WEEK ###'
    puts "insert week #{current_week}"
    week_m = Week.create!(week: current_week)
    previous_week = current_week
  end

  current_month = "#{month_str} #{current_year}"
  if current_month != previous_month
    puts '### NEW MONTH ###'
    puts "insert month #{current_month}"
    month_m = Month.create!(year_id: year_m.id, month: current_month)
    previous_month = current_month
  end

  puts "insert day: #{date_str}"
  Day.create!(week_id: week_m.id, month_id: month_m.id, date_str: date_str, date: date)
  f = f + 1
end

puts "Time values generated"

#other catalogs
Reason.create!(reason: "Placer")
Reason.create!(reason: "Enfermedad")
puts "Reasons created"

ipc = Team.create!(team: "IPC")
mstr = Team.create!(team: "MSTR")
puts "Teams created"

Consultant.create!(name: "Alejandro Aranda Parra", team_id: ipc.id)
Consultant.create!(name: "Carlos Enrique Moya Muñoz", team_id: ipc.id)
Consultant.create!(name: "Daniel Mauricio Avendaño Pérez", team_id: ipc.id)
Consultant.create!(name: "Ezequiel Cano Salinas", team_id: ipc.id)
Consultant.create!(name: "Gerardo Garzon Villar", team_id: ipc.id)
Consultant.create!(name: "Ivan Olea Lujano", team_id: ipc.id)
Consultant.create!(name: "Julien Clément Connaulte", team_id: ipc.id)
Consultant.create!(name: "Oscar Roberto Rivera Trejo", team_id: ipc.id)
Consultant.create!(name: "Ruben Valdes Flores", team_id: ipc.id)
Consultant.create!(name: "Valeria Sánchez Rivera", team_id: ipc.id)
Consultant.create!(name: "Daniel Cisneros Medina", team_id: mstr.id)
Consultant.create!(name: "Edgar Antonio Alpizar Villar", team_id: mstr.id)
Consultant.create!(name: "José Ernesto Navarro Carreón", team_id: mstr.id)
Consultant.create!(name: "Marco Antonio Valencia", team_id: mstr.id)
Consultant.create!(name: "Rodrigo Nakamura Lara", team_id: mstr.id)
puts "Consultants created"