class PointsController < ApplicationController
    before_action :set_point, only: [:show, :edit, :update, :destroy]


    def show
    end

    def new
        @point = Point.new
        respond_to do |format|
            format.js { render layout: false }
        end
    end

    def edit
        respond_to do |format|
            format.js { render layout: false }
        end
    end

    def create
        @point = Point.new(point_params)

        respond_to do |format|
            if @point.save
                format.html { redirect_to @point, notice: 'Negotiator was successfully created.' }
                format.js { render layout: false }
                format.json { render :show, status: :created, location: @point }
            else
                format.html { render :new }
                format.json { render json: @point.errors, status: :unprocessable_entity }
            end
        end
    end

    def update
        respond_to do |format|
            if @point.update(point_params)
                format.html { redirect_to @point, notice: 'Point was successfully updated.' }
                format.json { render :show, status: :ok, location: @point }
                format.js   { render layout: false }
            else
                format.html { render :edit }
                format.json { render json: @point.errors, status: :unprocessable_entity }
                format.js   { render layout: false }
            end
        end
    end


    def destroy
        @point.destroy
        respond_to do |format|
            format.html { redirect_to Points_url, notice: 'Point was successfully destroyed.' }
            format.json { head :no_content }
            format.js   { render layout: false}
        end
    end




    private
    # Use callbacks to share common setup or constraints between actions.
    def set_point
        @point = Point.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def point_params
        params.fetch(:point, {}).permit()
    end


end
