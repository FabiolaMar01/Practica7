Algoritmo calculadora_alimentos
	//ECach=Edad del cachorro; EAd=Edad del perro adulto; Tantas=cantidad de veces que se alimenta al perro al d�a
	Definir AdultoOCachorro, ECach, EAd, Tantas Como Entero
	//nom=nombre del perro; tam=tama�o; act=actividad
	Definir nom, tam, act Como Caracter
	//RER, DER y fact=valores para calcular cantidad de croquetas
	//CroquetaPerro=tazas de croqueta por d�a; CroquetaPerroDiv=tazas de croqueta por porci�n
	Definir peso, RER, DER, fact, Kcal, CroquetaPerro, CroquetaPerroDiv Como Real
	//validaciones
	Definir pesobien, ECachBien, EAdBien Como Logico
	
	Escribir "Calculadora de croquetas para perro"
	//Leer nombre de perro
	Escribir "Ingrese el nombre de su perro"
	Leer nom
	
	//averiguo tama�o de perro
	Escribir "�De qu� tama�o es ", nom, "? Escriba la letra correspondiente"
	Escribir "[m] = mini (1 a 5 kg)"
	Escribir "[p] = peque�o (6 a 10 kg)"
	Escribir "[M] = mediano (11 a 25 kg)"
	Escribir "[g] = grande (26 a 45 kg)"
	Escribir "[G] = gigante (+ 45 kg)"
	//valido que el usuario s� escoja un tama�o de la lista
	Repetir
		Leer tam
		Si tam<>"m" y tam<>"p" y tam<>"M" y tam<>"g" y tam<>"G"
			Escribir "La opci�n seleccionada es inexistente. Escriba la letra correspondiente"
		FinSi
		
	Hasta Que tam="m" o tam="p" o tam="M" o tam="g" o tam="G"
	
	
	Escribir "�De acuerdo!"
	//averiguar peso de perro y ver que sea un peso v�lido, dentro del rango establecido
	Escribir "�cu�nto pesa ", nom, "?, escriba el peso en kg"
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
			//el peso debe ser un n�mero positivo y mayor a 0, por eso pongo:
			Escribir "El perrito no puede pesar eso. Escriba el peso correctamente"
		FinSi
		
		Si NO pesobien Entonces
			Escribir"El perrito no puede pesar eso. Escriba el peso correctamente"
		FinSi
		
	Hasta Que pesobien
	
	
	//calcular RER (Requerimiento Energ�tico en Reposo)
	Segun tam Hacer
		"p", "M", "g":
			RER<-(30*peso)+70
		"m", "G":
			RER<-70*(peso^0.75)
	Fin Segun
	
	//calcular DER (Requerimiento Energ�tico Diario)
	//averiguar edad de perro
	Escribir "�", nom, " es adulto o cachorro?, seleccione la opci�n"
	Escribir "[1] = adulto (+12 meses)        [2] = cachorro (-12 meses)"
	//valido que el usuario escoja una de las dos opciones dadas
	Repetir
		Leer AdultoOCachorro
		
		Si AdultoOCachorro<>1 y AdultoOCachorro<>2
			Escribir "El valor insertado no es v�lido"
			Escribir "Ingrese el n�mero [1] o [2] seg�n la edad que tenga su perro"
		FinSi
		
	Hasta Que AdultoOCachorro=1 o AdultoOCachorro=2
	
	//teniendo certeza de que escogi� 1 o 2, veo la edad del adulto o cachorro 
	Segun AdultoOCachorro Hacer
		2:
			//esta es la opci�n para cachorros, por eso pido la info. en meses
			Escribir "�Excelente!"
			Escribir "�Cu�ntos meses tiene ", nom, "?"
			//valido que la edad del cachorro est� entre los 1 y 12 meses (ECachBien)
			Repetir
				ECachBien<-Verdadero
				Leer ECach
				//dependiendo de la edad indico los factores correspondientes a la condici�n del cachorro
				//tambi�n obtengo DER
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
						//si no se cumple ninguna condici�n, significa que es MUY peque�o y:
						Escribir "El cachorro a�n es lactante, no debe consumir croquetas"
					FinSi
				FinSi
			Hasta Que ECachBien
			
		1:
			//esta es la opci�n para adultos, por eso pido la info. en a�os
			Escribir "�Excelente!"
			Escribir "�Cu�ntos a�os tiene ", nom, "?"
			//valido que la edad del adulto est� entre los 1 y 18 a�os de edad (EAdBien)
			Repetir
				EAdBien<-Verdadero
				Leer EAd
				//dependiendo de la edad (EAd), busco los factores correspondientes a la condici�n del perrito adulto
				//tambi�n obtengo DER e indico cu�ntas veces se tiene que alimentar al d�a (Tantas)
				Si EAd>=1 y EAd<=7 Entonces
					EAdBien<-Verdadero
					X<-"adulto entre 1 y 7 a�os de edad "
					Tantas<-2
					//averiguar actividad de perro, porque a esta edad la cantidad de croquetas cambia dependiendo actividad
					Escribir "�" nom, " es un perro activo o sedentario?, escriba la letra correspondiente"
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
			Escribir "Caracter inv�lido"
	Fin Segun
	
	
	//SI EL USUARIO ELIGE CROQUETAS SE HACE LO SIGUIENTE:
	//Calcular la cantidad de tazas que se le deben dar de croquetas
	//el valor en DER se divide entre 400 porque es el promedio de kcal que aporta un alimento de perro por taza
	CroquetaPerro<-DER/400
	
	
	Escribir "Calculando cantidad ideal de croquetas para ", nom, "..."
	Escribir "..."
	//se indica la cantidad de tazas de croqueta que el perro requiere al d�a
	Escribir nom, " requiere ", CroquetaPerro, " tazas de croqueta al d�a"
	
	//calculo cu�ntas veces debe alimentarse al d�a un cachorro con base en su edad
	//esto ya lo hab�a hecho antes para los adultos, pero en los cachorros no se puede hacer igual porque var�an los meses
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
	//le digo al usuario cu�ntas veces debe comer su perro al d�a bas�ndonos en su edad
	Escribir "Ya que ", nom, " es un ", X,"los veterinarios recomiendan alimentarlo con croquetas: ", Tantas, " vez/veces al d�a,"
	
	//hago esta parte porque si no, el c�digo indica que "Tantas" puede ser un valor que divide entre 0
	Si Tantas>0 Entonces
		CroquetaPerroDiv<-CroquetaPerro/Tantas
	FinSi
	
	//le digo al usuario cu�ntas tazas de croqueta debe comer su perrito en cada porci�n que le da durante el d�a para llegar al total diario
	Escribir "eso significa que en un d�a, ", nom, " debe comer ", CroquetaPerroDiv, " tazas de croquetas por porci�n." 
	
	
	//SI EL USUARIO ELIGE ZANAHORA SE HACE LO SIGUIENTE
	
	Segun AdultoOCachorro Hacer
		2:
			//esta es la opci�n para cachorros
			Escribir "Las zanahorias deben ser un snack ocasional para cachorros (no sustituye dieta)"
			Escribir "Recomendaci�n: cortar la zanahoria en trozos muy peque�os para evitar riesgos de asfixia"
			Escribir "Recomendaci�n: las zanahorias fr�as pueden ser �tiles para aliviar las molestias de la dentici�n"
			Escribir " "
			Escribir "Ya que ", nom, " es un ", X, "... puede consumir: 1 zanahoria peque�a al d�a"
		1:
			//esta es la opci�n para adultos
			Escribir "Aseg�rese de que la zanahoria sea un complemento a su dieta balanceada,"
			Escribir "no un sustituto de su comida principal."
			Si EAd>=1 y EAd<=7 Entonces
				Escribir  " "
				Escribir "Ya que ", nom, " es un ", X, "... puede consumir: 2 zanahorias peque�as al d�a"
			SiNo
				//esta es la opci�n para adultos mayores
				Si EAd>=7 y EAd<=18
					Escribir " "
					Escribir "Ya que ", nom, " es un ", X, "... puede consumir: 2 zanahorias peque�as al d�a"
					Escribir "Recomendaci�n: Si su perro tiene alguna enfermedad, consulte al veterinario si puede ingerir este alimento"
				SiNo
					Escribir "Su perro requiere una dieta especial, consulte a un veterinario"
				FinSi
			FinSi
	Fin Segun
	
	
	//SI EL USUARIO ELIGE MANZANA SE HACE LO SIGUIENTE
	

	Segun AdultoOCachorro Hacer
		2:
			//esta es la opci�n para cachorros
			Escribir "Las manzanas deben ser un snack ocasional para cachorros y no sustituyen su dieta"
			Escribir "Recomendaci�n: cortar la manzana en trozos muy peque�os para evitar riesgos de asfixia"
			Escribir "Recomendaci�n: evite que su cachorro ingiera las semillas"
			Escribir " "
			Escribir "Ya que ", nom, " es un ", X, "... puede consumir trozos peque�os de manzana:
			Escribir "                1 o 2 veces por semana, como premio"
		1:
			//esta es la opci�n para adultos
			Escribir "Aseg�rese de que la manzana sea un snack ocasional y no sustituya su comida principal."
			Escribir "Recomendaci�n: corte la manzana en trozos para evitar que ingiera el coraz�n o semillas"
			Si EAd>=1 y EAd<=7 Entonces
				Escribir  " "
				Escribir "Ya que ", nom, " es un ", X, "... puede consumir manzana:
				Escribir "           1 o 2 veces por semana, como premio"
			SiNo
				//esta es la opci�n para adultos mayores
				Si EAd>=7 y EAd<=18
					Escribir " "
					Escribir "Ya que ", nom, " es un ", X, "... puede consumir manzana:
					Escribir "           1 o 2 veces por semana, como premio"
					Escribir "Recomendaci�n: Si su perro tiene alguna enfermedad, consulte al veterinario si puede ingerir este alimento"
				SiNo
					Escribir "Su perro requiere una dieta especial, consulte a un veterinario"
				FinSi
			FinSi
	Fin Segun
	
	
	
FinAlgoritmo
