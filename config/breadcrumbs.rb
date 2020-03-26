# frozen_string_literal: true

crumb :root do
  link 'Home', root_path
end

# breadcrumbs para especialidades

crumb :especialidades do
  link 'Especialidades', especialidades_path
end

crumb :especialidad_new do
  link 'crear', new_especialidad_path
  parent :especialidades
end

crumb :especialidad_edit do |especialidad|
  link especialidad.nombre, especialidad
  parent :especialidades
end

crumb :especialidad_show do |especialidad|
  link especialidad.nombre, especialidad
  parent :especialidades
end

# breadcrumbs para fichas

crumb :fichas do
  link 'fichas', admin_fichas_path
end

crumb :ficha_new do
  link 'crear', new_admin_ficha_path
  parent :fichas
end

crumb :ficha_edit do |ficha|
  link ficha.numero, edit_admin_ficha_path
  parent :fichas
end

crumb :ficha_show do |ficha|
  link ficha.numero, admin_ficha_path
  parent :fichas
end

# breadcrumbs para users

crumb :users do
  link 'usuarios', users_path
end

# breadcrumbs para anotaciones

crumb :anotaciones do
  link 'anotaciones', anotaciones_path
end

crumb :anotacion_new do
  link 'crear', new_anotacion_path
  parent :anotaciones
end

# breadcrumbs para devise

crumb :devise_edit do |current_user|
  link current_user.nombres, edit_user_registration_path
  parent :root
end

# breadcrumbs para ambientes

crumb :ambientes do |_current_user|
  link 'Ambientes', ambientes_path
  parent :root
end

crumb :ambiente_edit do |ambiente|
  link ambiente.nombre, edit_admin_ambiente_path
  parent :ambientes
end
