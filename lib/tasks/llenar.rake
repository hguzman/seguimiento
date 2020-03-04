namespace :db do
    desc "Llenar la información del campo Tipo de documento"
    task llenar: :environment do
        Tipodocumento.create(nombre: "Cédula")
        Tipodocumento.create(nombre: "Tarjeta de identidad")
    end
end
