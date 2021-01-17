class LoadsController < ApplicationController
  def daily
    @daily = DailyHour.new
  end

  def create_daily
    process_daily_cvs(params[:file])
    redirect_to loads_daily_path, notice: 'File was processed.'
  end

  def weekly
  end

  private
    def process_daily_cvs(file)
      #hash to store valid consultants
      consultants = {}
      #recover valid consultants
      c = Consultant.all
      #fill hash with valid consultants
      c.each {|e| consultants[e.name] = e.id}
      CSV.foreach(file.path, headers: true) do |row|
        hours = row['horasTrabajadas']
        registrador = row['registrador']
        issue = row['descripcion']
        fecha_inicio = row['fecha_inicio'][0..9]
        if !consultants[registrador].nil?
          #the row has a valid consultant
          #find the id of the day
          day = Day.find_by(date: fecha_inicio)
          #create a new row
          dh = DailyHour.new
          dh.day_id = day.id
          dh.consultant_id = consultants[registrador]
          dh.hours = hours
          dh.issue = issue
          #save the row
          dh.save
        end
      end
    end
end
