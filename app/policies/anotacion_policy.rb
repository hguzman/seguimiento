class AnotacionPolicy
    attr_reader :user, :anotacion

    def initialize(user, especialidad)
        @user = user
        @anotacion = anotacion
    end

    def index?
        @user.has_role? :admin
    end

    def new?
        @user.has_role? :admin
    end

end