class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  include OperatorRecordable::Extension
end
