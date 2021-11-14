# Explicación del Programa
- instalé Ruby la versión recomendada en la pagina:  [Descargar Ruby]( https://www.ruby-lang.org/en/), segun tu sistema operativo: 
[Linux-rbenv]( https://github.com/rbenv/rbenv),
[Linux-RVM]( http://rvm.io/),
[macOS-rbenv]( https://github.com/rbenv/rbenv),
[macOS-RVM](http://rvm.io/),
[Windows]( https://rubyinstaller.org/)
- instalé rest-client , para consumir la Api con el comando " gem install rest-client"
- Requerí los modulos necesarios para consumir la Api,
- declaré una variable "dominio" y un hash con los id de cada portafolio para manejar mejor las url,
- creé un hash para asignar la clave y valor de las tasa de interes anual que aplica cada portafolio ,
- declaré variables y les asigne el valor de los interes mensuales y diarios que se le aplicaria al monto de inversión segun el portafolio,
- declaré una variable global "$time_now" y le asigné la fecha actual,
-creé los input para obtener del usuario: la fecha de inversión, el monto y que tipo de portafolio le gustaria información
- se calcula el tiempo transcurrido desde la fecha de inversión hasta la fecha actual en días, meses, y años,
- aplicamos una condicional para hacer los calculos, si selecciona el portafolio 1 entonces aplica la url de 1 y respodes con un json,
- declaré una variable para enviarle el valor de la acción a la fecha de la inversión
-declare variables con los datos requeridos para el calculo del valor actual y aplique las formulas para obtener el valor de la acción actualmente.