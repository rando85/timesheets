require 'date'

class ReportsController < ApplicationController
  def daily
    #get current date to find the current week
    d = DateTime.now
    #var to simulate any other week
    #d = DateTime.new(2021, 1, 25)
    today = Day.find_by(date_str: d.strftime("%d/%m/%Y"))
    @days = Day.where(week_id: today.week.id).order(:date)
    @dh = DailyHour.where(day: @days)
    teams = Team.all.order(:team)
    @result = {}
    teams.each do |t|
      @result[t.team] = {}
      consultants = Consultant.includes(:vacations).where({team_id: t.id, is_active: 1}).order(:name)
      consultants.each do |c|
        @result[t.team][c.name] = {}
        @days.each do |d|
          cell_class = ""
          if c.vacations.where(day_id: d.id).length > 0
            cell_class = "table-info"
          end
          @result[t.team][c.name][d.date_str] = {hours: 0, cell_class: cell_class, format: ""}
        end
      end
    end
    @dh.each do |dh|
      @result[dh.consultant.team.team][dh.consultant.name][dh.day.date_str][:hours] += dh.hours
      #To-Do: validate in the iterations where we reach at least 8 hrs
    end
  end

  def weekly
  end
end
