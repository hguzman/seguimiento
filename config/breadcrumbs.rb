# frozen_string_literal: true

crumb :root do
  link 'Home', root_path
end

# breadcrumbs para especialidades

crumb :especialidades do
  link 'Especialidades', admin_especialidades_path
end

crumb :especialidad_new do
  link 'crear', new_admin_especialidad_path
  parent :especialidades
end

crumb :especialidad_edit do |especialidad|
  link especialidad.nombre, edit_admin_especialidad_path
  parent :especialidades
end

crumb :especialidad_show do |especialidad|
  link especialidad.nombre, admin_especialidad_path(especialidad)
  parent :especialidades
end

# breadcrumbs para programas

crumb :programas do |especialidad|
  link 'Programas', admin_especialidad_programas_path(especialidad)
  parent :especialidad_show, especialidad
end

crumb :programa_new do |especialidad|
  link 'crear', new_admin_especialidad_programa_path(especialidad)
  parent :programas, especialidad
end

crumb :programa_edit do |programa, especialidad|
  link programa.nombre, edit_admin_especialidad_programa_path(especialidad)
  parent :programas, especialidad
end

crumb :programa_show do |programa, especialidad|
  link programa.nombre, admin_especialidad_programa_path(especialidad)
  parent :programas, especialidad
end

# breadcrumbs para users

crumb :users do
  link 'usuarios', users_path
end

crumb :user_show do |user|
  link "#{user.nombres} #{user.apellidos}", user_path(user)
  parent :users
end

# breadcrumbs para users<anotaciones

crumb :user_anotaciones do |user|
  link 'anotaciones', user_anotaciones_path(user)
  parent :user_show, user
end

crumb :user_anotacion_new do |user|
  link 'Crear', new_user_anotacion_path(user)
  parent :user_anotaciones, user
end

crumb :user_anotacion_edit do |anotacion, user|
  link anotacion.id, edit_user_anotacion_path(user)
  parent :user_show, user
end

crumb :user_anotacion_show do |anotacion, user|
  link anotacion.id, user_anotacion_path(user)
  parent :user_show, user
end

# breadcrumbs para devise

crumb :devise_edit do |current_user|
  link current_user.nombres, edit_user_registration_path
  parent :root
end

# breadcrumbs para admin<ambientes

crumb :admin_ambientes do
  link 'Adiministracion/Ambientes', admin_ambientes_path
  parent :root
end

crumb :admin_ambiente_new do
  link 'Crear', new_admin_ambiente_path
  parent :admin_ambientes
end

crumb :admin_ambiente_edit do |ambiente|
  link ambiente.nombre, edit_admin_ambiente_path
  parent :admin_ambientes
end

crumb :admin_ambiente_show do |ambiente|
  link ambiente.nombre, admin_ambiente_path
  parent :admin_ambientes
end

# breadscrumbs ambientes

crumb :ambientes do
  link 'Ambientes', ambientes_path
  parent :root
end

crumb :ambiente_show do |ambiente|
  link ambiente.nombre, ambiente_path(ambiente)
  parent :ambientes
end

# breadcrumbs ambientes<anotaciones

crumb :ambientes_anotaciones do |ambiente|
  link 'Anotaciones', ambiente_anotaciones_path(ambiente)
  parent :ambiente_show, ambiente
end

crumb :ambiente_anotacion_new do |ambiente|
  link 'Anotaciones/Crear', new_ambiente_anotacion_path(ambiente)
  parent :admin_ambientes
end

crumb :ambiente_anotacion_edit do |anotacion, ambiente|
  link anotacion.id, edit_ambiente_anotacion_path(ambiente)
  parent :ambiente_show, ambiente
end

crumb :ambiente_anotacion_show do |anotacion, ambiente|
  link anotacion.id, ambiente_anotacion_path(ambiente)
  parent :ambiente_show, ambiente
end

# breadcrumbs para admin_Tipo_documentos

crumb :admin_tipo_documentos do
  link 'Tipo documentos', admin_tipo_documentos_path
end

crumb :admin_tipo_documento_new do
  link 'crear', new_admin_tipo_documento_path
  parent :admin_tipo_documentos
end

crumb :admin_tipo_documento_edit do |tipodocumento|
  link tipodocumento.nombre, edit_admin_tipo_documento_path(tipodocumento)
  parent :admin_tipo_documentos
end

crumb :admin_tipo_documento_show do |tipodocumento|
  link tipodocumento.nombre, admin_tipo_documento_path(tipodocumento)
  parent :admin_tipo_documentos
end
