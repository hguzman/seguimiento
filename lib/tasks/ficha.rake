namespace :db do
      desc "Llenar El modelo ficha"

      task ficha: :environment do
          Ficha.create(numero: '1963770')
          Ficha.create(numero: '1022121')
          Ficha.create(numero: '1234567')
          Ficha.create(numero: '1098765')
          Ficha.create(numero: '0197825')
          Ficha.create(numero: '1987654')
          Ficha.create(numero: '0982675')
          Ficha.create(numero: '1876543')
          Ficha.create(numero: '1987065')
          Ficha.create(numero: '1456243')

          puts "Fichas Registradas *.*"
      end
  end
