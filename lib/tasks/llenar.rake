namespace :db do
    desc "Llenar datos iniciales de la aplicacion"
    task llenar: :environment do
        Tipodocumento.create(nombre: "Cédula")
        Tipodocumento.create(nombre: "Tarjeta de identidad")
        puts "Tipos de documentos Registrados *.*"
        Role.create(nombre:"admin")
        Role.create(nombre:"instructor")
        puts "Roles Registrados *.*"
        Especialidad.create(nombre:"SISTEMAS")
        e = Especialidad.first
        p = e.programas.create(nombre:"ADSI")
        puts "Programas Registrados *.*"
        p.fichas.create(numero: 1693770, numero_aprendices: 35, fecha_fin_at: "2020-10-20")
        puts "Fichas Registrada *.*"
    end
end
