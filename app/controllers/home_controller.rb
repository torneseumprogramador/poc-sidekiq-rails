class HomeController < ApplicationController
    def index
        ConsultaIbgeJob.perform_later
        @distritos = Distrito.all
    end
end