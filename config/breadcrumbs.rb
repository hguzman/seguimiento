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
  link 'Fichas', admin_fichas_path
end

crumb :ficha_new do
  link 'Nueva Ficha', new_admin_ficha_path
  parent :fichas
end

crumb :ficha_show do |ficha|
  link ficha.numero, admin_ficha_path
  parent :fichas
end

crumb :ficha_edit do |ficha|
  link ficha.numero, edit_admin_ficha_path
  parent :fichas
end

# breadcrumbs para anotaciones
crumb :anotaciones do
  link 'Anotaciones', anotaciones_path
end

crumb :anotacion_new do
  link 'Nueva Anotacion', new_anotacion_path
  parent :anotaciones
end
crumb :anotacion_show do |anotacion|
  link anotacion.descripcion, anotacion_path
  parent :anotaciones
end
crumb :anotacion_edit do |anotacion|
  link "Editar Anotacion", edit_anotacion_path(anotacion)
  parent :anotacion_show, anotacion
end

# breadcrumbs para devise
crumb :users do
  link 'Usuarios', users_path
end

crumb :devise_edit do |current_user|
  link "Mi Perfil ", edit_user_path
  parent :root
end

crumb :edit_password do |current_user|
  link "Cambiar Contraseña", change_password_user_path
  parent :devise_edit
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

crumb :ambiente_show do |ambiente|
  link ambiente.nombre, admin_ambiente_path
  parent :ambientes
end
