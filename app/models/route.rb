class Route < ApplicationRecord
    has_many :points, -> { order(position: :asc) }, dependent: :destroy
    scope :by_date, -> { order(:date) }

    # When a trip is created, populate it automatically with the first point on the rentify office
    after_create do
        self.points << Point.create(lat:"51.519984", lon:"-0.098404", name: "Rentify" )
    end


    def updateDuration
        if points.count > 1
            point_a = points.first
            self.duration = point_a.visit_duration
            point_a.update(arrival_time: self.date)
            self.points.order(:position).each_with_index do |p,index|
                #skip 0
                if index > 0
                    point_b = p

                    uri = URI("https://developer.citymapper.com/api/1/traveltime/?"+
                            "key=" + ENV["CITYMAPPER_API_KEY"] +
                            "&startcoord=#{point_a.lat},#{point_a.lon}"+
                            "&endcoord=#{point_b.lat},#{point_b.lon}"+
                            "&time=#{date.year}-#{date.month}-#{date.day}T#{date.hour}:#{date.min}:00Z"+
                            "&time_type=arrival")

                    Net::HTTP.start(uri.host, uri.port, :use_ssl => uri.scheme == 'https') do |http|
                        request = Net::HTTP::Get.new uri

                        response = http.request request

                        result = JSON.parse(response.body)["travel_time_minutes"]

                        self.duration = self.duration + result + point_b.visit_duration

                        point_b.update(arrival_time: (point_a.arrival_time + result.minutes + point_a.visit_duration.minutes))

                        point_a = p
                    end

                end
            end
            self.save
        end
    end



end
