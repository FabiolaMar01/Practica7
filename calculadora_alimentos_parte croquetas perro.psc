Algoritmo calculadora_alimentos
	//ECach=Edad del cachorro; EAd=Edad del perro adulto; Tantas=cantidad de veces que se alimenta al perro al día
	Definir AdultoOCachorro, ECach, EAd, Tantas Como Entero
	//nom=nombre del perro; tam=tamaño; act=actividad
	Definir nom, tam, act Como Caracter
	//RER, DER y fact=valores para calcular cantidad de croquetas
	//CroquetaPerro=tazas de croqueta por día; CroquetaPerroDiv=tazas de croqueta por porción
	Definir peso, RER, DER, fact, Kcal, CroquetaPerro, CroquetaPerroDiv Como Real
	//validaciones
	Definir pesobien, ECachBien, EAdBien Como Logico
	
	Escribir "Calculadora de croquetas para perro"
	//Leer nombre de perro
	Escribir "Ingrese el nombre de su perro"
	Leer nom
	
	//averiguo tamaño de perro
	Escribir "¿De qué tamaño es ", nom, "? Escriba la letra correspondiente"
	Escribir "[m] = mini (1 a 5 kg)"
	Escribir "[p] = pequeño (6 a 10 kg)"
	Escribir "[M] = mediano (11 a 25 kg)"
	Escribir "[g] = grande (26 a 45 kg)"
	Escribir "[G] = gigante (+ 45 kg)"
	//valido que el usuario sí escoja un tamaño de la lista
	Repetir
		Leer tam
		Si tam<>"m" y tam<>"p" y tam<>"M" y tam<>"g" y tam<>"G"
			Escribir "La opción seleccionada es inexistente. Escriba la letra correspondiente"
		FinSi
		
	Hasta Que tam="m" o tam="p" o tam="M" o tam="g" o tam="G"
	
	
	Escribir "¡De acuerdo!"
	//averiguar peso de perro y ver que sea un peso válido, dentro del rango establecido
	Escribir "¿cuánto pesa ", nom, "?, escriba el peso en kg"
	Repetir
		pesobien<-Verdadero
		Leer peso
		
		Segun tam Hacer
			"p":
				Si peso>=6 y peso<=10 Entonces
					pesobien<-Verdadero
				SiNo
					pesobien<-Falso	
				FinSi
			"M":
				Si peso>=11 y peso<=25 Entonces
					pesobien<-Verdadero
				SiNo
					pesobien<-Falso	
				FinSi
			"g":
				Si peso>=26 y peso<=45 Entonces
					pesobien<-Verdadero
				SiNo
					pesobien<-Falso
				FinSi
			"m":
				Si peso>=1 y peso<=5 Entonces
					pesobien<-Verdadero
				SiNo
					pesobien<-Falso
				FinSi
			"G":
				Si peso>=45 y peso<=110 Entonces
					pesobien<-Verdadero
				SiNo
					pesobien<-Falso
				FinSi
		Fin Segun
		
		Si peso<=0 Entonces
			pesobien<-Falso
			//el peso debe ser un número positivo y mayor a 0, por eso pongo:
			Escribir "El perrito no puede pesar eso. Escriba el peso correctamente"
		FinSi
		
		Si NO pesobien Entonces
			Escribir"El perrito no puede pesar eso. Escriba el peso correctamente"
		FinSi
		
	Hasta Que pesobien
	
	
	//calcular RER (Requerimiento Energético en Reposo)
	Segun tam Hacer
		"p", "M", "g":
			RER<-(30*peso)+70
		"m", "G":
			RER<-70*(peso^0.75)
	Fin Segun
	
	//calcular DER (Requerimiento Energético Diario)
	//averiguar edad de perro
	Escribir "¿", nom, " es adulto o cachorro?, seleccione la opción"
	Escribir "[1] = adulto (+12 meses)        [2] = cachorro (-12 meses)"
	//valido que el usuario escoja una de las dos opciones dadas
	Repetir
		Leer AdultoOCachorro
		
		Si AdultoOCachorro<>1 y AdultoOCachorro<>2
			Escribir "El valor insertado no es válido"
			Escribir "Ingrese el número [1] o [2] según la edad que tenga su perro"
		FinSi
		
	Hasta Que AdultoOCachorro=1 o AdultoOCachorro=2
	
	//teniendo certeza de que escogió 1 o 2, veo la edad del adulto o cachorro 
	Segun AdultoOCachorro Hacer
		2:
			//esta es la opción para cachorros, por eso pido la info. en meses
			Escribir "¡Excelente!"
			Escribir "¿Cuántos meses tiene ", nom, "?"
			//valido que la edad del cachorro esté entre los 1 y 12 meses (ECachBien)
			Repetir
				ECachBien<-Verdadero
				Leer ECach
				//dependiendo de la edad indico los factores correspondientes a la condición del cachorro
				//también obtengo DER
				Si ECach>=1 y ECach<4 Entonces
					ECachBien<-Verdadero
					fact<-3
					DER<-RER*fact
				SiNo
					Si ECach>=4 y ECach<12
						ECachBien<-Verdadero
						fact<-2
						DER<-RER*fact
					SiNo
						ECachBien<-Falso
						//si no se cumple ninguna condición, significa que es MUY pequeño y:
						Escribir "El cachorro aún es lactante, no debe consumir croquetas"
					FinSi
				FinSi
			Hasta Que ECachBien
			
		1:
			//esta es la opción para adultos, por eso pido la info. en años
			Escribir "¡Excelente!"
			Escribir "¿Cuántos años tiene ", nom, "?"
			//valido que la edad del adulto esté entre los 1 y 18 años de edad (EAdBien)
			Repetir
				EAdBien<-Verdadero
				Leer EAd
				//dependiendo de la edad (EAd), busco los factores correspondientes a la condición del perrito adulto
				//también obtengo DER e indico cuántas veces se tiene que alimentar al día (Tantas)
				Si EAd>=1 y EAd<=7 Entonces
					EAdBien<-Verdadero
					X<-"adulto entre 1 y 7 años de edad "
					Tantas<-2
					//averiguar actividad de perro, porque a esta edad la cantidad de croquetas cambia dependiendo actividad
					Escribir "¿" nom, " es un perro activo o sedentario?, escriba la letra correspondiente"
					Escribir "[a] = activo       [s] = sedentario"
					//valido que el usuario escoja una de las dos opciones dadas"
					Repetir
						Leer act
					Hasta Que act=a o act=s
					//dependiendo de la cantidad de actividad, indico los factores correspondientes a la cond. del perrito adulto
					Si act="a" Entonces
						fact<-4
						DER<-RER*fact
					SiNo
						fact<-1.8
						DER<-RER*fact
					FinSi
				SiNo
					//a esta edad ya se considera adulto mayor, no influye la actividad 
					Si EAd>=7 y EAd<=18
						EAdBien<-Verdadero
						X<-"adulto mayor "
						Tantas<-1
						fact<-1.4
						DER<-RER*fact
					SiNo
						EAdBien<-Falso
						Escribir "Su perro requiere una dieta especial, consulte a un veterinario"
					FinSi
				FinSi
			Hasta Que EAdBien
			
			
		De Otro Modo:
			Escribir "Caracter inválido"
	Fin Segun
	
	
	//SI EL USUARIO ELIGE CROQUETAS SE HACE LO SIGUIENTE:
	//Calcular la cantidad de tazas que se le deben dar de croquetas
	//el valor en DER se divide entre 400 porque es el promedio de kcal que aporta un alimento de perro por taza
	CroquetaPerro<-DER/400
	
	
	Escribir "Calculando cantidad ideal de croquetas para ", nom, "..."
	Escribir "..."
	//se indica la cantidad de tazas de croqueta que el perro requiere al día
	Escribir nom, " requiere ", CroquetaPerro, " tazas de croqueta al día"
	
	//calculo cuántas veces debe alimentarse al día un cachorro con base en su edad
	//esto ya lo había hecho antes para los adultos, pero en los cachorros no se puede hacer igual porque varían los meses
	Si AdultoOCachorro=2 Entonces
		Si ECach<=6 y ECach>1 Entonces
			X<-"cachorro entre 1 a 6 meses de edad "
			Tantas<-3
		SiNo
			Si ECach>6 y ECach<=12 Entonces
				X<-"cachorro entre 7 a 12 meses de edad "
				Tantas<-2
			FinSi
		FinSi
	FinSi
	
	Escribir " "
	//le digo al usuario cuántas veces debe comer su perro al día basándonos en su edad
	Escribir "Ya que ", nom, " es un ", X,"los veterinarios recomiendan alimentarlo con croquetas: ", Tantas, " vez/veces al día,"
	
	//hago esta parte porque si no, el código indica que "Tantas" puede ser un valor que divide entre 0
	Si Tantas>0 Entonces
		CroquetaPerroDiv<-CroquetaPerro/Tantas
	FinSi
	
	//le digo al usuario cuántas tazas de croqueta debe comer su perrito en cada porción que le da durante el día para llegar al total diario
	Escribir "eso significa que en un día, ", nom, " debe comer ", CroquetaPerroDiv, " tazas de croquetas por porción." 
	
	
	//SI EL USUARIO ELIGE ZANAHORA SE HACE LO SIGUIENTE
	
	Segun AdultoOCachorro Hacer
		2:
			//esta es la opción para cachorros
			Escribir "Las zanahorias deben ser un snack ocasional para cachorros (no sustituye dieta)"
			Escribir "Recomendación: cortar la zanahoria en trozos muy pequeños para evitar riesgos de asfixia"
			Escribir "Recomendación: las zanahorias frías pueden ser útiles para aliviar las molestias de la dentición"
			Escribir " "
			Escribir "Ya que ", nom, " es un ", X, "... puede consumir: 1 zanahoria pequeña al día"
		1:
			//esta es la opción para adultos
			Escribir "Asegúrese de que la zanahoria sea un complemento a su dieta balanceada,"
			Escribir "no un sustituto de su comida principal."
			Si EAd>=1 y EAd<=7 Entonces
				Escribir  " "
				Escribir "Ya que ", nom, " es un ", X, "... puede consumir: 2 zanahorias pequeñas al día"
			SiNo
				//esta es la opción para adultos mayores
				Si EAd>=7 y EAd<=18
					Escribir " "
					Escribir "Ya que ", nom, " es un ", X, "... puede consumir: 2 zanahorias pequeñas al día"
					Escribir "Recomendación: Si su perro tiene alguna enfermedad, consulte al veterinario si puede ingerir este alimento"
				SiNo
					Escribir "Su perro requiere una dieta especial, consulte a un veterinario"
				FinSi
			FinSi
	Fin Segun
	
	
	//SI EL USUARIO ELIGE MANZANA SE HACE LO SIGUIENTE
	

	Segun AdultoOCachorro Hacer
		2:
			//esta es la opción para cachorros
			Escribir "Las manzanas deben ser un snack ocasional para cachorros y no sustituyen su dieta"
			Escribir "Recomendación: cortar la manzana en trozos muy pequeños para evitar riesgos de asfixia"
			Escribir "Recomendación: evite que su cachorro ingiera las semillas"
			Escribir " "
			Escribir "Ya que ", nom, " es un ", X, "... puede consumir trozos pequeños de manzana:
			Escribir "                1 o 2 veces por semana, como premio"
		1:
			//esta es la opción para adultos
			Escribir "Asegúrese de que la manzana sea un snack ocasional y no sustituya su comida principal."
			Escribir "Recomendación: corte la manzana en trozos para evitar que ingiera el corazón o semillas"
			Si EAd>=1 y EAd<=7 Entonces
				Escribir  " "
				Escribir "Ya que ", nom, " es un ", X, "... puede consumir manzana:
				Escribir "           1 o 2 veces por semana, como premio"
			SiNo
				//esta es la opción para adultos mayores
				Si EAd>=7 y EAd<=18
					Escribir " "
					Escribir "Ya que ", nom, " es un ", X, "... puede consumir manzana:
					Escribir "           1 o 2 veces por semana, como premio"
					Escribir "Recomendación: Si su perro tiene alguna enfermedad, consulte al veterinario si puede ingerir este alimento"
				SiNo
					Escribir "Su perro requiere una dieta especial, consulte a un veterinario"
				FinSi
			FinSi
	Fin Segun
	
	
	
FinAlgoritmo
