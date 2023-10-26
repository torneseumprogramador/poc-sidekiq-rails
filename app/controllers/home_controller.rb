class HomeController < ApplicationController
    def index

    @distritos = Distrito.all
    end
end