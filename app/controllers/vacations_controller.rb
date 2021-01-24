class VacationsController < ApplicationController
  before_action :set_vacation, only: [:show, :edit, :update, :destroy]
  before_action :set_vars, only: [:new, :edit]

  # GET /vacations
  # GET /vacations.json
  def index
    @vacations = Vacation.order(:day_id).order(:consultant_id)
  end

  # GET /vacations/1
  # GET /vacations/1.json
  def show
  end

  # GET /vacations/new
  def new
    @vacation = Vacation.new
  end

  # GET /vacations/1/edit
  def edit
  end

  # POST /vacations
  # POST /vacations.json
  def create
    @vacation = Vacation.new(vacation_params)

    respond_to do |format|
      if @vacation.save
        format.html { redirect_to @vacation, notice: 'Vacation was successfully created.' }
        format.json { render :show, status: :created, location: @vacation }
      else
        format.html { render :new }
        format.json { render json: @vacation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /vacations/1
  # PATCH/PUT /vacations/1.json
  def update
    respond_to do |format|
      if @vacation.update(vacation_params)
        format.html { redirect_to @vacation, notice: 'Vacation was successfully updated.' }
        format.json { render :show, status: :ok, location: @vacation }
      else
        format.html { render :edit }
        format.json { render json: @vacation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vacations/1
  # DELETE /vacations/1.json
  def destroy
    @vacation.destroy
    respond_to do |format|
      format.html { redirect_to vacations_url, notice: 'Vacation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vacation
      @vacation = Vacation.find(params[:id])
    end

    # Create var contents for combo box
    def set_vars
      @days = Day.all
      @consultants = Consultant.where({is_active: 1}).order(:name)
      @reasons = Reason.all
    end

    # Only allow a list of trusted parameters through.
    def vacation_params
      params.require(:vacation).permit(:day_id, :consultant_id, :reason_id)
    end
end
