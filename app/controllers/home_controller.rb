class HomeController < ApplicationController
  before_action :authenticate_user!
 def index
     @mainTitle = "Migue Arregla esas vistas"
     @mainDesc = "Vamos a Darle Muerganos"
   end

   def minor
   end

end
