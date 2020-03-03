class FichaPolicy
    attr_reader :user, :ficha

    def initialize(user, ficha)
      @user = user
      @ficha = ficha
    end

    def index?
        @user.has_role? :admin
    end
end