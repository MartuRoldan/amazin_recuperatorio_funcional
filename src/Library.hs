module Library where
import PdePreludat

doble :: Number -> Number
doble numero = numero + numero

module Library where
import PdePreludat

doble :: Number -> Number
doble numero = numero + numero

--aplicarPoderEspecial :: Poder
--aplicarPoderEspecial nave = poder nave nave


type Nombre = String
type Felicidad = Number
type Titulo = String
type CantidadDePaginas = Number
type Efecto = Persona -> Persona

-- De las personas que tienen una cuenta en Amazin' conocemos su nick, su índice de felicidad, los libros que adquirió y los libros que efectivamente leyó. 
data Persona = Persona {
    nombre :: Nombre,
    felicidad :: Felicidad,
    librosAdquiridos :: [Libro],
    librosLeidos :: [Libro]
 } deriving Show

-- De cada libro conocemos su título, quien lo escribió, su cantidad de páginas y cómo afecta el género a las personas que lo lean.
data Libro = Libro {
    titulo :: Titulo,
    cantidadDePaginas :: CantidadDePaginas,
    genero :: Efecto
} deriving Show

libro1 :: Libro
libro1 = Libro {titulo = "Martin Fierro", cantidadDePaginas = 200, genero = efectoComediaDramatica}

libro2 :: Libro
libro2 = Libro {titulo = "Viaje al centro de la tierra", cantidadDePaginas = 500, genero = efectoCieniciaFiccion}

libro3 :: Libro
libro3 = Libro {titulo = "Carrie", cantidadDePaginas = 100, genero = efectoCieniciaFiccion}

persona1 :: Persona
persona1 = Persona { nombre = "Lucas", felicidad = 100, librosAdquiridos = [libro1, libro2], librosLeidos = []}

persona2 :: Persona
persona2 = Persona { nombre = "Alf", felicidad = 120, librosAdquiridos = [libro1], librosLeidos = [libro1, libro2]}

modificarFelicidad :: Number -> Efecto
modificarFelicidad cantidad persona = persona { felicidad = felicidad persona + cantidad}

efectoComediaDramatica :: Efecto
efectoComediaDramatica persona = persona

efectoComediaAbsurda :: Efecto
efectoComediaAbsurda = modificarFelicidad 5

efectoComediaSatirica :: Efecto
--efectoComediaSatirica persona = modificarFelicidad (felicidad persona) persona
efectoComediaSatirica persona = persona { felicidad = felicidad persona *2}

efectoComedia :: Efecto
efectoComedia = modificarFelicidad 10

efectoCieniciaFiccion :: Efecto
efectoCieniciaFiccion persona = persona { nombre = reverse (nombre persona)}

efectoTerror :: Efecto
efectoTerror persona = persona { librosAdquiridos = []}

-- cuando lee el libro provoca el efecto a la persona
leerLibro :: Libro -> Efecto
leerLibro libro persona = genero libro persona
