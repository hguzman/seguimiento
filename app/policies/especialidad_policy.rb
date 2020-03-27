class EspecialidadPolicy
    attr_reader :user, :especialidad

    def initialize(user, especialidad)
      @user = user
      @especialidad = especialidad
    end

    def index?
      # @user.has_role? :admin
    end
end
