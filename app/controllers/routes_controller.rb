class RoutesController < ApplicationController
    before_action :set_route, only: [:show, :edit, :update, :destroy]


    def show
    end

    def new
        @route = Route.new
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

        @route = Route.new(route_params)

        respond_to do |format|
            if @route.save
                format.html { redirect_to @route, notice: 'Negotiator was successfully created.' }
                format.js { render layout: false }
                format.json { render :show, status: :created, location: @route }
            else
                format.html { render :new }
                format.json { render json: @route.errors, status: :unprocessable_entity }
            end
        end
    end


    def update
        respond_to do |format|
            if @route.update(date: DateTime.parse(params[:date]))

                points = params[:points]

                #delete removed points
                ids = @route.points.pluck :id
                ids = ids - points.keys

                Point.where(id: ids).destroy_all


                points.each do |k,v|
                    if Point.exists?(k)
                        point = Point.find(k)
                        point.update(name: v[:name], lat: v[:lat], lon: v[:lon], visit_duration: v[:duration], position: v[:position]);
                    else
                        point = Point.create(name: v[:name], lat: v[:lat], lon: v[:lon], visit_duration: v[:duration], position: v[:position]);
                    end
                    @route.points << point
                end


                @route.save

                @route.updateDuration()


                format.html { redirect_to @route, notice: 'Route was successfully updated.' }
                format.json { render :show, status: :ok, location: @route }
                format.js   { render layout: false }
            else
                format.html { render :edit }
                format.json { render json: @route.errors, status: :unprocessable_entity }
                format.js   { render layout: false }
            end
        end
    end


    def destroy
        @route.destroy
        respond_to do |format|
            format.html { redirect_to routes_url, notice: 'Route was successfully destroyed.' }
            format.json { head :no_content }
            format.js   { render layout: false}
        end
    end




    private
    # Use callbacks to share common setup or constraints between actions.
    def set_route
        @route = Route.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def route_params
        params.fetch(:route, {}).permit(:negotiator_id)
    end
end
