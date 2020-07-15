namespace :db do
    desc "Llenar datos iniciales de la aplicacion"
    task llenar: :environment do
        Tipodocumento.create(nombre: "Cédula")
        Tipodocumento.create(nombre: "Tarjeta de identidad")
        Especialidad.create(nombre:"SISTEMAS")
        e = Especialidad.first
        p = e.programas.create(nombre:"ADSI")
        p.fichas.create(numero: 1693770, numero_aprendices: 15, fecha_fin_at: "2020-10-20")
    end
end
