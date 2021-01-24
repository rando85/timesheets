class ConsultantsController < ApplicationController
  before_action :set_consultant, only: [:show, :edit, :update, :destroy]

  # GET /consultants
  # GET /consultants.json
  def index
    @consultants = Consultant.all.includes(:team).order(:team_id, :name)
  end

  # GET /consultants/1
  # GET /consultants/1.json
  def show
  end

  # GET /consultants/new
  def new
    @consultant = Consultant.new
  end

  # GET /consultants/1/edit
  def edit
  end

  # POST /consultants
  # POST /consultants.json
  def create
    @consultant = Consultant.new(consultant_params)

    respond_to do |format|
      if @consultant.save
        format.html { redirect_to @consultant, notice: 'Consultant was successfully created.' }
        format.json { render :show, status: :created, location: @consultant }
      else
        format.html { render :new }
        format.json { render json: @consultant.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /consultants/1
  # PATCH/PUT /consultants/1.json
  def update
    respond_to do |format|
      if @consultant.update(consultant_params)
        format.html { redirect_to @consultant, notice: 'Consultant was successfully updated.' }
        format.json { render :show, status: :ok, location: @consultant }
      else
        format.html { render :edit }
        format.json { render json: @consultant.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /consultants/1
  # DELETE /consultants/1.json
  def destroy
    @consultant.destroy
    respond_to do |format|
      format.html { redirect_to consultants_url, notice: 'Consultant was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_consultant
      @consultant = Consultant.friendly.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def consultant_params
      params.require(:consultant).permit(:team_id, :name, :is_active)
    end
end
