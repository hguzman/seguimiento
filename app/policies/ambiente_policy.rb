class AmbientePolicy
    attr_reader :user, :ambiente

    def initialize(user, ambiente)
      @user = user
      @ambiente = ambiente
    end

    def index?
      @user.has_role? :admin
    end

  end
