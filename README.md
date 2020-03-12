## Pasos para colaborar en repositorios Open-Source.


Para la aportación a proyectos Open-Source, se deben seguir unos pasos sencillos que garantizan la acertada interacción entre

desarrolladores y un flujo organizado de trabajo; a continuación, se detallan los pasos a seguir.

1.	Fork del repositorio origen:

        ingresa a tu cuenta de github.

        Ubica el repositorio en el que vas a colaborar.

        En la esquina superior derecha ubica el icno de fork y click en el.

        Esto realiza una copia exacta del repositorio en el perfil del usuario colaborador.

2.	Clonar el repositorio:

        Una vez se realiza el Fork, se debe clonar el repositorio forkeado, con el siguiente

        Comando:  git clone  https://github.com/User/NombreRepo.git

3.	Ingresa a la carpeta clonada:

        cd NombreRepo

4.	Verificar las conexiones con fuentes remotas:

        git remote -v

5.	Adicionar una conexión remota con el repositorio original:

        git remote add upstream https://github.com/User/RepoOriginal(Forkeado)

6.	Opcional, renombrar la conexión remota.

        En haras de evitar confuciones, en el paso anterior se creo una conexión local con el 

        repositorio original de nombre upstream, este nombre se puede cambiar por otro mas 

        personalizado con el siguiente comando:

        git remote rename origin fork

## Ya tenemos una copia del repositorio origina, ahora trabajaremos el flujo diario de trabajo.

1.	Antes de todo actualizar rama master local con últimos cambios, con el comando: git pull -r (nombre del remoto origen) master

2.	Creamos el requerimiento o funcionalidad, en la herramienta de flujo de trabajo, trello o github issues(nuestro github)

3.	Opcional creamos una rama para el desarrollo de la tarea.

4.	Trabajamos  y completamos las tareas.

5.	Ejecutamos git status y verificamos los archivos que sufrieron cambios.

6.	Ejecutamos git add . y adicionamos todos los cambios al stash.

7.	Comiteamos los cambios con: git commit -m “Aquí el titulo del commit”

8.	Realizamos un push a nuestro repositorio con:  git push origin master (Teniendo en cuenta que el remoto de nuestro repositorio se llame origin

    y la rama a la que vamos a enviar el trabajo se llama master).

9.	Vamos a la pagina de github e ingresamos a nuestro repositorio.

10.	Creamos un nuevo pull request, que se envía al repositorio original.




