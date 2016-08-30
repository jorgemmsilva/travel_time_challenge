class WelcomeController < ApplicationController
    def index

        @negotiators = Negotiator.all_ordered

        @current_negotiator = @negotiators.first

        respond_to do |format|
            format.html
        end
    end
end
