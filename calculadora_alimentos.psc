Funcion croqueta_perro <- croketadPERRO (tam, act, peso, nom)
	
	Definir fact, DER, RER Como Real
	
	//calcular RER
	Segun tam Hacer
		p, M, g:
			RER<-(30*peso)+70
		m, G:
			RER<-70*(peso^75)
		De Otro Modo:
			Escribir "Tamaño NO válido"
	Fin Segun
	
	//pedir info de la edad del perrito
	//calcular DER
	Segun AdCach Hacer
		2:
			Escribir "¿Cuántos meses tiene", nom, "?"
			Leer ECach
			Segun ECach Hacer
				ECach<4 o Ecach>1:
					fact<-3
					DER<-RER*fact
				ECach>4 o Ecach<12:
					fact<-2
					DER<-RER*fact
				De Otro Modo:
					Escribir "El cachorro aún no debe comer croquetas"
			Fin Segun
			
		1:
			Escribir "¿Cuántos años tiene", nom, "?"
			Leer edad
			Segun edad Hacer
				edad>1 o edad<=7:
				//averiguar actividad de perro
				Escribir "¿" nom, " es un perro activo o sedentario?, escriba la letra correspondiente"
				Escribir "[a] = activo       [s] = sedentario"
				Leer act
				
				Si act=a Entonces
					fact<-4
					DER<-RER*fact
				SiNo
					fact<-1.8
					DER<-RER*fact
				FinSi
				
				edad>=7:
					fact<-1.4
					DER<-RER*fact
			Fin Segun
		De Otro Modo:
			Escribir "Caracter inválido"
	Fin Segun
	
	//Calcular X (gr de comida al día para el perro)
	Escribir "En una porción de 100g, las croquetas de mi perro aportan_____calorías"
	Escribir "(Revise el empaque donde viene el alimento de su perro"
	Leer cal
	XPerro<-(DER/cal)*(100)
	Escribir XPerro
	
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
	//averiguar tamaño de perro
	Escribir "¿De qué tamaño es ", nom, "?, escriba la letra correspondiente"
	Escribir "[m] = mini (1 a 5 kg)"
	Escribir "[p] = pequeño (6 a 10 kg)"
	Escribir "[M] = mediano (11 a 25 kg)"
	Escribir "[g] = grande (26 a 45 kg)"
	Escribir "[G] = gigante (+ 45 kg)"
	
	Leer tam
	
	Escribir "¡De acuerdo!"

	//averiguar peso de perro
	Escribir "Finalmente, ¿cuánto pesa ", nom, "?, escriba el peso en kg"
	Leer peso
	
	Escribir "Calculando cantidad ideal de croquetas para ", nom, "..."
	
	croqueta_perro<- croketadPERRO (tam, act, peso, nom)
	
	Escribir nom, "requiere" croqueta_perro "g diarios de croqueta"
	
FinAlgoritmo
