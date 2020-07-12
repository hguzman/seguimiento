OperatorRecordable.config = {
  operator_class_name: "User",
  creator_column_name: "created_by",
  updater_column_name: "updated_by",
  deleter_column_name: "deleted_by",
  operator_association_options: { optional: true },
  operator_association_scope: -> { nil },
  store: :current_attributes_store
}