Funcion croqueta_perro <- croketadPERRO (tam, act, peso, nom)
	//calcular RER
	
	Segun tam Hacer
		tam>2 o tam<45:
			RER<-(30*peso)+70
		tam<2 o tam>45 o tam<80:
			RER<-70*(peso^75)
		De Otro Modo:
			Escribir "Lo sentimos, puede que por el peso de ", nom, " no podamos calcular la cantidad de comida correspondiente"
			Escribir "Para estimar la cantidad de alimento adecuada para su perro, consulte a un veterinario"
	Fin Segun
	
	Segun edad Hacer
		opcion_1:
			secuencia_de_acciones_1
		opcion_2:
			secuencia_de_acciones_2
		opcion_3:
			secuencia_de_acciones_3
		De Otro Modo:
			secuencia_de_acciones_dom
	Fin Segun
Fin Funcion

Algoritmo calculadora_alimentos
	Definir edad, AdCach, ECach, EAd Como Entero
	Definir nom, tam, act Como Caracter
	Definir peso Como Real
	
	Escribir "Calculadora de croquetas para perro"
	//Leer nombre de perro
	Escribir "Ingrese el nombre de su perro"
	Leer nom
	//averiguar edad de perro
	Escribir "¿", nom, " es adulto o cachorro?, seleccione la opción"
	Escribir "[1] = adulto (+12 meses)        [2] = cachorro (-12 meses)"
	Leer AdCach
	Segun AdCach Hacer
		2:
			Escribir "¿Cuántos meses tiene", nom, "?"
			Leer ECach
			Segun ECach Hacer
				ECach<4 o Ecach>1:
					fact<-3
				ECach>4 o Ecach<12:
					fact<-2
				De Otro Modo:
					Escribir "El cachorro aún no debe comer croquetas"
			Fin Segun
		1:
			Escribir "¿Cuántos años tiene", nom, "?"
			Leer EAd
			
		De Otro Modo:
			Escribir "Caracter inválido"
	Fin Segun
	
	
	Si AdCach==2 Entonces
		
	FinSi
	//averiguar tamaño de perro
	Escribir "¿De qué tamaño es ", nom, "?, escriba la letra correspondiente"
	Escribir "[m] = mini (1 a 5 kg)"
	Escribir "[p] = pequeño (6 a 10 kg)"
	Escribir "[M] = mediano (11 a 25 kg)"
	Escribir "[g] = grande (26 a 45 kg)"
	Escribir "[G] = gigante (+ 45 kg)"
	Leer tam
	Escribir "¡De acuerdo!"
	//averiguar actividad de perro
	Escribir "¿" nom, " es un perro activo o sedentario?, escriba la letra correspondiente"
	Escribir "[a] = activo       [s] = sedentario"
	Leer act
	//averiguar peso de perro
	Escribir "Finalmente, ¿cuánto pesa ", nom, "?, escriba el peso en kg"
	Leer peso
	Escribir "Calculando cantidad ideal de croquetas para ", nom, "..."
	
	
	
	
	
FinAlgoritmo
