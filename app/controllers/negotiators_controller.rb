class NegotiatorsController < ApplicationController
  before_action :set_negotiator, only: [:show, :edit, :update, :destroy]

  # GET /negotiators
  # GET /negotiators.json
  def index
    @negotiators = Negotiator.all_ordered
  end

  # GET /negotiators/1
  # GET /negotiators/1.json
  def show
  end

  # GET /negotiators/new
  def new
    @negotiator = Negotiator.new
    respond_to do |format|
      format.js { render layout: false }
    end
  end

  # GET /negotiators/1/edit
  def edit
    respond_to do |format|
      format.js { render layout: false }
    end
  end

  # POST /negotiators
  # POST /negotiators.json
  def create
    @negotiator = Negotiator.new(negotiator_params)

    respond_to do |format|
      if @negotiator.save

        @negotiators = Negotiator.all_ordered

        format.html { redirect_to @negotiator, notice: 'Negotiator was successfully created.' }
        format.js { render layout: false }
        format.json { render :show, status: :created, location: @negotiator }
      else
        format.html { render :new }
        format.json { render json: @negotiator.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /negotiators/1
  # PATCH/PUT /negotiators/1.json
  def update
    respond_to do |format|
      if @negotiator.update(negotiator_params)

        @negotiators = Negotiator.all_ordered

        format.html { redirect_to @negotiator, notice: 'Negotiator was successfully updated.' }
        format.json { render :show, status: :ok, location: @negotiator }
        format.js   { render layout: false }
      else
        format.html { render :edit }
        format.json { render json: @negotiator.errors, status: :unprocessable_entity }
        format.js   { render layout: false }
      end
    end
  end

  # DELETE /negotiators/1
  # DELETE /negotiators/1.json
  def destroy
    @negotiator.destroy
    respond_to do |format|

      @negotiators = Negotiator.all_ordered


      format.html { redirect_to negotiators_url, notice: 'Negotiator was successfully destroyed.' }
      format.json { head :no_content }
      format.js   { render layout: false}
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_negotiator
      @negotiator = Negotiator.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def negotiator_params
      params.fetch(:negotiator, {}).permit(:name)
    end
end
