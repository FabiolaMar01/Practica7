Algoritmo calculadora_alimentos
	
	Definir especie, nombre, tam, actividad como Cadena
	Definir edad, CachorroOAdultoOAdultoMayor, tipo_comida, ECach, EAd, EAdM Como Entero
	Definir act Como Caracter
	Definir peso, RER, DER, fact, Kcal, CroquetaPerro Como Real
	Definir pesobien Como Logico
	
	Escribir "�Bienvenido a la calculadora de alimento para su mascota!"
	Escribir "�Qu� mascota tiene? (perro, gato o conejo): "
	Leer especie
	
		//Si el usuario escribe perro, entonces
		//Se solicita el nombre
		Si especie = "perro" Entonces
			Escribir "Ingrese el nombre de su perro"
			Leer nombre
			
			//Se solicita el tama�o del perro
			Escribir "�De qu� tama�o es ", nombre, "? Escriba la letra correspondiente"
			Escribir "[m] = mini (1 a 5 kg)"
			Escribir "[p] = peque�o (6 a 10 kg)"
			Escribir "[M] = mediano (11 a 25 kg)"
			Escribir "[g] = grande (26 a 45 kg)"
			Escribir "[G] = gigante (+ 45 kg)"
			Repetir
				Leer tam
				Si tam<>"m" y tam<>"p" y tam<>"M" y tam<>"g" y tam<>"G"
					Escribir "La opci�n seleccionada es inexistente. Escriba la letra correspondiente"
				FinSi
				
			Hasta Que tam="m" o tam="p" o tam="M" o tam="g" o tam="G"
			
			//Se solicita el peso del perro
			Escribir "�Cu�nto pesa ", nombre, "? Escriba el peso en kilogramos (kg)"
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
					Escribir "Su perrito no puede pesar eso. Escriba el peso correctamente"
				FinSi
				
				Si NO pesobien Entonces
					Escribir "Su perrito no puede pesar eso. Escriba el peso correctamente"
				FinSi
				
			Hasta Que pesobien
			
			//Calcular RER
			Segun tam Hacer
				"p", "M", "g":
					RER<-(30*peso)+70
				"m", "G":
					RER<-70*(peso^0.75)
					
			Fin Segun
			
			//calcular Requerimiento Energ�tico Diario (DER)
			//averiguar edad de perro
			Escribir "�", nombre, " es cachorro, adulto o adulto mayor? Seleccione la opci�n"
			Escribir "[1] = cachorro (-12 meses)"
			Escribir "[2] = adulto (1-7 a�os)"
			Escribir "[3] = adulto mayor (+7 a�os)"
			Repetir
				Leer CachorroOAdultoOAdultoMayor
				
				Si CachorroOAdultoOAdultoMayor<>1 y CachorroOAdultoOAdultoMayor<>2 y CachorroOAdultoOAdultoMayor<>3
					Escribir "El valor insertado no es v�lido"
					Escribir "Ingrese el n�mero [1], [2] o [3] seg�n la edad que tenga su perro"
				FinSi
				
			Hasta Que CachorroOAdultoOAdultoMayor=1 o CachorroOAdultoOAdultoMayor=2 o CachorroOAdultoOAdultoMayor=3
			
			Segun CachorroOAdultoOAdultoMayor Hacer
				1:
					Escribir "�Excelente!"
					Escribir "�Cu�ntos meses tiene ", nombre, "?"
					Repetir
						Leer ECach
						Si ECach<1 o ECach>=12 Entonces
							Escribir "La edad ingresada no corresponde a la de un cachorro, int�ntelo de nuevo"
						FinSi
					Hasta Que ECach>=1 y ECach<12
					
					Si ECach>=1 y ECach<4 Entonces
						fact<-3
						DER<-RER*fact
					SiNo
						Si ECach>=4 y ECach<12
							fact<-2
							DER<-RER*fact
						FinSi
					FinSi
					
				2:
					Escribir "�Excelente!"
					Escribir "�Cu�ntos a�os tiene ", nombre, "?"
					Repetir
						Leer EAd
						Si EAd<1 o EAd>7 Entonces
							Escribir "La edad ingresada no corresponde a la de un adulto, int�ntelo de nuevo"
						FinSi
					Hasta Que EAd>=1 y EAd<=7
					
					Si EAd>=1 y EAd<=7 Entonces
						//averiguar actividad de perro
						Escribir "�" nombre, " es un perro activo o sedentario? Escriba la letra correspondiente"
						Escribir "[a] = activo       [s] = sedentario"
						Repetir
							Leer act
						Hasta Que act="a" o act="s"
						
						Si act="a" Entonces
							X <- "adulto activo"
							fact<-4
							DER<-RER*fact
						SiNo
							Si act="s" Entonces
								X <- "adulto sedentario"
								fact<-1.8
								DER<-RER*fact
							FinSi
						FinSi
					FinSi
					
				3:	
					Escribir "�Excelente!"
					Escribir "�Cu�ntos a�os tiene ", nombre, "?"
					Repetir
						Leer EAdM
						Si EAd<7 o EAd>18 Entonces
							Escribir "La edad ingresada no corresponde a la de un adulto mayor, int�ntelo de nuevo"
						FinSi
					Hasta Que EAdM>=7 y EAdM<=18
					
					Si EAdM>=7 y EAdM<=18 Entonces
						fact<-1.4
						DER<-RER*fact
					FinSi
					
				De Otro Modo:
					Escribir "Caracter inv�lido"
			Fin Segun
			
			//Preguntar qu� alimento quiere calcular
			Escribir "�Qu� alimento quiere calcular?"
			Escribir "[1] = Procesado (croqueta)"
			Escribir "[2] = S�lido salado (zanahoria)"
			Escribir "[3] = S�lido dulce (pera o manzana)"
			Repetir
				Leer tipo_comida
				
				Si tipo_comida<>1 y tipo_comida<>2 y tipo_comida<>3
					Escribir "El valor insertado no es v�lido"
					Escribir "Ingrese el n�mero [1], [2] o [3] seg�n el alimento que desea calcular"
				FinSi
				
			Hasta Que tipo_comida=1 o tipo_comida=2 o tipo_comida=3
			
			Segun tipo_comida Hacer
				1:	//Si el usuario elige croqueta, entonces
					//Calcular la cantidad de tazas que se le deben dar de croquetas
					//el valor en DER se divide entre 400 porque es el promedio de kcal que aporta un alimento de perro por taza
					CroquetaPerro<-DER/400
					
					Escribir "Calculando cantidad ideal de croquetas para ", nombre, "..."
					Escribir "..."
					//se indica la cantidad de tazas de croqueta que el perro requiere al d�a
					Escribir nombre, " requiere ", CroquetaPerro, " tazas de croqueta al d�a"
					
					//Iniciar variables 
					Definir X Como Cadena
					Definir croquetaPerroDiv Como Real
					Definir Tantas Como Entero
					Tantas <- 0
					
					//Si es cachorro
					Si CachorroOAdultoOAdultoMayor=1 Entonces
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
					
					//Si es adulto o adulto mayor
					Si CachorroOAdultoOAdultoMayor=2 Entonces
						Tantas <- 2
					SiNo
						Si CachorroOAdultoOAdultoMayor=3 Entonces
							X <- "adulto mayor"
							Tantas <- 2
						FinSi
					FinSi
					
					Escribir " "
					//le digo al usuario cu�ntas veces debe comer su perro al d�a bas�ndonos en su edad
					Escribir "Ya que ", nombre, " es un ", X,", los veterinarios recomiendan alimentarlo con croquetas: ", Tantas, " vez/veces al d�a,"
					
					//hago esta parte porque si no, el c�digo indica que "Tantas" puede ser un valor que divide entre 0
					Si Tantas>0 Entonces
						CroquetaPerroDiv <- CroquetaPerro/Tantas
					FinSi
					
					//AQU� PODEMOS CONVERTIR LO DE LAS TAZAS COMO CON EL CONEJO, PERO LUEGO
					
					//le digo al usuario cu�ntas tazas de croqueta debe comer su perrito en cada porci�n que le da durante el d�a para llegar al total diario
					Escribir "eso significa que en un d�a, ", nombre, " debe comer ", CroquetaPerroDiv " tazas de croquetas por porci�n." 
					
				2: //Si el usuario elige s�lido salado, entonces
					Escribir "Calculando cantidad ideal de s�lido salado (zanahorias) para ", nombre, "..."
					Escribir "..."
					
					Segun CachorroOAdultoOAdultoMayor Hacer
						1: //Cachorro
							Escribir nombre, " debe consumir 1 zanahoria peque�a al d�a."
							Escribir "RECOMENDACIONES: "
							Escribir "Las zanahorias deben ser un snack ocasional para ", nombre
							Escribir "Se recomienda cortar la zanahoria en trozos muy peque�os para evitar riesgos de asfixia."
							Escribir "Las zanahorias fr�as pueden ser �tiles para aliviar las molestias de la dentici�n."
							
						2: //Adulto
							Escribir nombre, " debe consumir en promedio 2 zanahorias peque�as al d�a."
							Escribir "RECOMENDACIONES: "
							Escribir "Las zanahorias pueden ser un buen premio si ", nombre, " est� a dieta." 
							Escribir "Aseg�rate de que la zanahoria sea un complemento a su dieta balanceada, no un sustituto de su comida principal."
							
						3: //Adulto mayor
							Escribir nombre, " debe consumir 2 zanahorias peque�as al d�a, de preferencia cocidas."
							Escribir "RECOMENDACIONES: "
							Escribir "Si " nombre, " tiene algunas enfermedades, es mejor consultar su ingesta con el veterinario."
					FinSegun
					
				3: //Si el usuario elige s�lido dulce, entonces
					Escribir "Calculando cantidad ideal de s�lido dulce (manzana o pera) para ", nombre, "..."
					Escribir "..."
					
					Segun CachorroOAdultoOAdultoMayor Hacer
						1, 2: //Cachorro o Adulto
							Escribir nombre, " debe consumir unos trozos de manzana o pera, sin coraz�n ni semillas, una o dos veces por semana."
							Escribir "RECOMENDACI�N: "
							Escribir "Es una buena opci�n �nicamente como premio."
							
						3: // Adulto mayor
							Escribir nombre, " debe consumir unos trozos de manzana o pera, sin coraz�n ni semillas, una o dos veces por semana."
							Escribir "RECOMENDACIONES: "
							Escribir "Es una buena opci�n �nicamente como premio."
							Escribir "Es importante observar cualquier se�al de problemas digestivos y ajustar la cantidad si es necesario."
							Escribir "Si es el caso, consultarlo con el veterinario."
					FinSeguN
					
			FinSegun	
			
		SiNo
			//--------------------------------------------------------------------------------------------------------------------------------------------------
			//                   /          /          /          AQU� EMPIEZA LO DEL GATO              /          /           /
			//--------------------------------------------------------------------------------------------------------------------------------------------------
			Si especie = "gato" Entonces
				Escribir "Ingrese el nombre de su gato"
				Leer nombre
				
				//Se solicita el peso del gato
				Escribir "�Cu�nto pesa ", nombre, "? Escriba el peso en kilogramos (kg)"
				Repetir
					Leer peso
					
					Si peso<=0 Entonces
						Escribir "Su gatito no puede pesar eso. Escriba el peso correctamente"
					FinSi
					
					
				Hasta Que peso>0
				
				//Calcular RER
				RER<-70*(peso)^0.75
				
				//averiguar edad de gatito
				Escribir "�", nombre, " es cachorro, adulto o adulto mayor? Seleccione la opci�n."
				Escribir "[1] = cachorro (0-12 meses)"
				Escribir "[2] = adulto (1-7 a�os)"
				Escribir "[3] = adulto mayor (+7 a�os)"
				Repetir
					Leer CachorroOAdultoOAdultoMayor
					
					Si CachorroOAdultoOAdultoMayor<>1 y CachorroOAdultoOAdultoMayor<>2 y CachorroOAdultoOAdultoMayor<>3
						Escribir "El valor insertado no es v�lido"
						Escribir "Ingrese el n�mero [1], [2] o [3] seg�n la edad que tenga su perro"
					FinSi
					
				Hasta Que CachorroOAdultoOAdultoMayor=1 o CachorroOAdultoOAdultoMayor=2 o CachorroOAdultoOAdultoMayor=3
				
				Segun CachorroOAdultoOAdultoMayor Hacer
					1:
						Escribir "�Excelente!"
						Escribir "�Cu�ntos meses tiene ", nombre, "?"
						Repetir
							Leer ECach
							Si ECach<1 o ECach>=12 Entonces
								Escribir "La edad ingresada no corresponde a la de un cachorro, int�ntelo de nuevo"
							FinSi
						Hasta Que ECach>=1 y ECach<12
						
						Tantas<-5
						X<-"cachorro"
						
						Si ECach>=3 y ECach<=4 Entonces
							fact<-3
							DER<-RER*fact
						SiNo
							Si ECach>=4 y ECach<=6 Entonces
								fact<-2.5
								DER<-RER*fact
							SiNo
								Si ECach>=7 y ECach<=11 Entonces
									fact<-2
									DER<-RER*fact
								FinSi
							FinSi
						FinSi
						
					2:
						Escribir "�Excelente!"
						Escribir "�Cu�ntos a�os tiene ", nombre, "?"
						Repetir
							Leer EAd
							Si EAd<1 y EAd>7 Entonces
								Escribir "La edad ingresada no corresponde a la de un adulto, int�ntelo de nuevo"
							FinSi
						Hasta Que EAd>=1 y EAd<=7
						
						Tantas<-3
						
						Si EAd>=1 y EAd<=7 Entonces
							//averiguar actividad del gato
							//esta es de gatitos obesos :c
							
							Escribir "�" nombre, " es un gato activo o sedentario? Escriba la letra correspondiente"
							Escribir "[a] = activo       [s] = sedentario"
							Repetir
								Leer act
							Hasta Que act="a" o act="s"
							
							Si act="a" Entonces
								X<-"adulto activo"
								fact<-1.6
								DER<-RER*fact
							SiNo
								Si act="s" Entonces
									X<-"adulto sedentario"
									fact<-1.2
									DER<-RER*fact
									
									//este es para gatitos obesos :C
									Si peso>5 Entonces
										X<-"adulto obeso o con sobrepeso"
										fact<-1
										DER<-RER*fact
									FinSi
									
								FinSi
							FinSi
							
							
						FinSi
						
					3:	
						Escribir "�Excelente!"
						Escribir "�Cu�ntos a�os tiene ", nombre, "?"
						Repetir
							Leer EAdM
							Si EAdM<7 Entonces
								Escribir "La edad ingresada no corresponde a la de un adulto mayor, int�ntelo de nuevo"
							FinSi
						Hasta Que EAdM>7
						
						Tantas<-3
						X<-"adulto mayor"
						
						Si EAdM>7 Entonces
							fact<-1.1
							DER<-RER*fact
						FinSi
						
					De Otro Modo:
						Escribir "Caracter inv�lido"
				Fin Segun
				
				//Preguntar qu� alimento quiere calcular
				Escribir "�Qu� alimento quiere calcular?"
				Escribir "[1] = Procesado (croqueta)"
				Escribir "[2] = S�lido salado (zanahoria)"
				Escribir "[3] = S�lido dulce (pera o manzana)"
				Repetir
					Leer tipo_comida
					
					Si tipo_comida<>1 y tipo_comida<>2 y tipo_comida<>3
						Escribir "El valor insertado no es v�lido"
						Escribir "Ingrese el n�mero [1], [2] o [3] seg�n el alimento que desea calcular"
					FinSi
					
				Hasta Que tipo_comida=1 o tipo_comida=2 o tipo_comida=3
				
				Segun tipo_comida Hacer
					1:	//Si el usuario elige croqueta, entonces
						//Calcular la cantidad de tazas que se le deben dar de croquetas
						//el valor en DER se divide entre 450 porque es el promedio de kcal que aporta un alimento de gato por taza
						CroquetaGato<-DER/450
						
						Escribir "Calculando cantidad ideal de croquetas para ", nombre, "..."
						Escribir "..."
						//se indica la cantidad de tazas de croqueta que el gato requiere al d�a
						Escribir nombre, " requiere ", CroquetaGato, " tazas de croqueta al d�a"
						
						//Iniciar variables 
						Definir croquetaGatoDiv Como Real
						
						Escribir " "
						//le digo al usuario cu�ntas veces debe comer su perro al d�a bas�ndonos en su edad
						Escribir "Ya que ", nombre, " es un ", X,", los veterinarios recomiendan alimentarlo con croquetas: ", Tantas, " vez/veces al d�a,"
						
						//hago esta parte porque si no, el c�digo indica que "Tantas" puede ser un valor que divide entre 0
						Si Tantas>0 Entonces
							CroquetaGatoDiv <- CroquetaGato/Tantas
						FinSi
						
						//AQU� PODEMOS LUEGO HACER LA EQUIVALENCIA DE LAS TAZAS !
						
						//le digo al usuario cu�ntas tazas de croqueta debe comer su perrito en cada porci�n que le da durante el d�a para llegar al total diario
						Escribir "eso significa que en un d�a, ", nombre, " debe comer ", CroquetaGatoDiv, " tazas de croquetas por porci�n." 
						
					2: //Si el usuario elige s�lido salado, entonces
						Escribir "Calculando cantidad ideal de s�lido salado (zanahorias) para ", nombre, "..."
						Escribir "..."
						
						Segun CachorroOAdultoOAdultoMayor Hacer
							1: //Cachorro
								Escribir nombre, " debe consumir 1 zanahoria pelada, cocida y en trozos, por semana."
								Escribir "RECOMENDACIONES: "
								Escribir "Se recomienda distribuir la porci�n en toda la semana."
								Escribir "Las zanahorias deben ser un snack ocasional para ", nombre							
								
							2: //Adulto
								Escribir nombre, " debe consumir 1 o 2 zanahorias peladas, cocidas y en trozos, por semana."
								Escribir "RECOMENDACIONES: "
								Escribir "Las zanahorias pueden ser un buen premio si ", nombre, " est� a dieta." 
								Escribir "Aseg�rate de que la zanahoria sea un complemento a su dieta balanceada, no un sustituto de su comida principal."
								
							3: //Adulto mayor
								Escribir nombre, " debe consumir 1 o 2 zanahorias peladas, cocidas y en trozos, por semana."
								Escribir "RECOMENDACIONES: "
								Escribir "Por la edad de ", nombre, " se recomienda que est� bien cocida para que sea f�cil de masticar."
								Escribir "Si " nombre, " tiene algunas enfermedades, es mejor consultar su ingesta con el veterinario."
						FinSegun
						
					3: //Si el usuario elige s�lido dulce, entonces
						Escribir "Calculando cantidad ideal de s�lido dulce (manzana o pera) para ", nombre, "..."
						Escribir "..."
						
						Segun CachorroOAdultoOAdultoMayor Hacer
							1: //Cachorro
								Escribir nombre, " debe consumir una cucharadita, ya sea en trozos muy peque�os o rallados de manzana o pera cocida, una vez por d�a."
								Escribir "RECOMENDACI�N: "
								Escribir "No olvides evitar darle el coraz�n o las semillas."
								Escribir "Es mejor ofrecer un solo tipo de fruta a la vez para identificar posibles reacciones adversas."
								
							2: //Adulto
								Escribir nombre, " debe consumir un trozo de manzana o pera cocida, al d�a."
								Escribir "RECOMENDACI�N: "
								Escribir "No olvides evitar darle el coraz�n o las semillas."
								Escribir "Es una buena opci�n �nicamente como premio."	
								
							3: // Adulto mayor
								Escribir nombre, " debe consumir un trozo de manzana o pera cocida y sin c�scara, al d�a."
								Escribir "RECOMENDACIONES: "
								Escribir "No olvides evitar darle el coraz�n o las semillas."
								Escribir "Es una buena opci�n �nicamente como premio."	
						FinSegun
				FinSegun	
				
			SiNo
				//--------------------------------------------------------------------------------------------------------------------------------------------------
				//               /          /           /        AQU� EMPIEZA LO DEL CONEJO             /          /          /
				//--------------------------------------------------------------------------------------------------------------------------------------------------
				Si especie = "conejo" Entonces
					Escribir "Ingrese el nombre de su conejo"
					Leer nombre
					
					//Se solicita el tama�o del conejo
					Escribir "�De qu� tama�o es ", nombre, "? Escriba la letra correspondiente"
					Escribir "[m] = mini (menos de 1.75 kg)"
					Escribir "[p] = peque�o (1.75 a 2.25 kg)"
					Escribir "[M] = mediano (2.25 a 5 kg)"
					Escribir "[g] = grande (5 a 8 kg)"
					Repetir
						Leer tam
						Si tam<>"m" y tam<>"p" y tam<>"M" y tam<>"g"
							Escribir "La opci�n seleccionada es inexistente. Escriba la letra correspondiente"
						FinSi
						
					Hasta Que tam="m" o tam="p" o tam="M" o tam="g" 
					
					//Se solicita el peso del conejo
					Escribir "�Cu�nto pesa ", nombre, "? Escriba el peso en kilogramos y con dos decimales (kg)"
					Repetir
						pesobien<-Verdadero
						Leer peso
						
						Segun tam Hacer
							"m":
								Si peso>=.500 y peso<=1.75 Entonces
									pesobien<-Verdadero
								SiNo
									pesobien<-Falso	
								FinSi
							"p":
								Si peso>=1.75 y peso<=2.25 Entonces
									pesobien<-Verdadero
								SiNo
									pesobien<-Falso	
								FinSi
							"M":
								Si peso>=2.25 y peso<=5.00 Entonces
									pesobien<-Verdadero
								SiNo
									pesobien<-Falso
								FinSi
							"g":
								Si peso>=5.00 y peso<=8.00 Entonces
									pesobien<-Verdadero
								SiNo
									pesobien<-Falso
								FinSi
						Fin Segun
						
						Si peso<=0 Entonces
							pesobien<-Falso
							Escribir "Su conejo no puede pesar eso. Escriba el peso correctamente"
						FinSi
						
						Si NO pesobien Entonces
							Escribir "Su conejo no puede pesar eso. Escriba el peso correctamente"
						FinSi
					Hasta Que pesobien
					
					//averiguar edad del conejo
					Escribir "�", nombre, " es un gazapo, adulto o adulto mayor? Seleccione la opci�n"
					Escribir "[1] = gazapo (-9 meses)"
					Escribir "[2] = adulto (9 meses a 5 a�os)"
					Escribir "[3] = adulto mayor (+5 a�os)"
					Repetir
						Leer CachorroOAdultoOAdultoMayor
						
						Si CachorroOAdultoOAdultoMayor<>1 y CachorroOAdultoOAdultoMayor<>2 y CachorroOAdultoOAdultoMayor<>3
							Escribir "El valor insertado no es v�lido"
							Escribir "Ingrese el n�mero [1], [2] o [3] seg�n la edad que tenga su conejo"
						FinSi
						
					Hasta Que CachorroOAdultoOAdultoMayor=1 o CachorroOAdultoOAdultoMayor=2 o CachorroOAdultoOAdultoMayor=3
					
					Segun CachorroOAdultoOAdultoMayor Hacer
						1: //Cachorro
							X="gazapo"
							Escribir "�Excelente!"
							Escribir "�Cu�ntos meses tiene ", nombre, "?"
							Repetir
								Leer ECach
								Si ECach < 0 o ECach >= 9 Entonces
									Escribir "Por favor ingrese un n�mero v�lido entre 0 y 9."
								FinSi
							Hasta Que ECach >= 0 y ECach < 9
							
						2: //Adulto
							X="adulto"
							Escribir "�Excelente!"
							Escribir "�Cu�ntos a�os tiene ", nombre, "?"
							Repetir
								Leer EAd
								Si EAd < 1 o EAd >= 5 Entonces
									Escribir "Por favor ingrese un n�mero v�lido entre 1 y 5."
								FinSi
							Hasta Que EAd >= 1 y eAd <= 5 
							
						3:	//Adulto mayor
							X="adulto mayor"
							Escribir "�Excelente!"
							Escribir "�Cu�ntos a�os tiene ", nombre, "?"
							Repetir
								Leer EAdM
								Si EAdM < 5 Entonces
									Escribir "Por favor ingrese un n�mero v�lido (mayor o igual a 5)."
								FinSi
							Hasta Que EAdM >= 5
							
						De Otro Modo:
							Escribir "Caracter inv�lido"
					Fin Segun
					
					//Preguntar qu� alimento quiere calcular
					Escribir "�Qu� alimento quiere calcular?"
					Escribir "[1] = Procesado (pellets)"
					Escribir "[2] = S�lido salado (zanahoria)"
					Escribir "[3] = S�lido dulce (pera o manzana)"
					Repetir
						Leer tipo_comida
						
						Si tipo_comida<>1 y tipo_comida<>2 y tipo_comida<>3
							Escribir "El valor insertado no es v�lido"
							Escribir "Ingrese el n�mero [1], [2] o [3] seg�n el alimento que desea calcular"
						FinSi
						
					Hasta Que tipo_comida=1 o tipo_comida=2 o tipo_comida=3
					
					Segun tipo_comida Hacer
						1:	//Si el usuario elige pellets, entonces
							Escribir "Calculando cantidad ideal de pellets para ", nombre, "..."
							Escribir "..."
							
							//Calcular gramos diarios seg�n edad
							Segun CachorroOAdultoOAdultoMayor Hacer
								1: //Cachorro
									gramos_pellets <- peso*0.04
								2: //Adulto
									gramos_pellets <- peso*0.03
								3: //Adulto mayor
									gramos_pellets <- peso*0.02
							FinSegun
							
							//Convertir gramos a tazas (1 taza = 100g)
							tazas_dec <- gramos_pellets / 100
							
							//Determinar fracci�n de taza m�s cercana
							Si tazas_dec < 0.375 Entonces
								taza_aprox <- "1/4 taza"
							Sino
								Si tazas_dec < 0.625 Entonces
									taza_aprox <- "1/2 taza"
								Sino
									Si tazas_dec < 0.875 Entonces
										taza_aprox <- "3/4 taza"
									Sino
										taza_aprox <- ConvertirATexto(Trunc(tazas_dec + 0.5)) + " tazas"
									FinSi
								FinSi
							FinSi
							
							//le digo al usuario cu�ntas veces debe comer su conejo al d�a bas�ndonos en su edad
							Escribir "Ya que ", nombre, " es un ", X,", debe consumir: ", gramos_pellets, "gr de pellets al d�a"
							Escribir "Esto equivale aproximadamente a ", taza_aprox, "."
							Escribir "RECOMENDACI�N:"
							Escribir "No olvides ofrecer heno ilimitado adem�s del pellet."
							
						2: //Si el usuario elige s�lido salado, entonces
							Escribir "Calculando cantidad ideal de s�lido salado (zanahorias) para ", nombre, "..."
							Escribir "..."		
							
							Segun CachorroOAdultoOAdultoMayor Hacer
								1: //Cachorro
									Escribir nombre, " debe consumir 1 zanahoria a la semana."
									Escribir "RECOMENDACIONES: "
									Escribir "Distribuir la raci�n durante toda la semana, en trozos peque�os."
									Escribir "No exceder la porci�n sugerida ya que podr�a generar problemas en su salud a largo plazo."
									Escribir "No olvides incluir otras verduras y heno en su dieta."
									
								2: //Adulto 
									Escribir nombre, " debe consumir de 1 a 2 zanahorias a la semana."
									Escribir "RECOMENDACIONES: "
									Escribir "Distribuir la raci�n durante toda la semana."
									Escribir "No exceder la porci�n sugerida ya que podr�a generar problemas en su salud a largo plazo."
									Escribir "No olvides incluir otras verduras y heno en su dieta."
									
								3: //Adulto mayor
									Escribir nombre, " debe consumir 1 y 1/2 zanahorias a la semana."
									Escribir "RECOMENDACIONES: "
									Escribir "Distribuir la raci�n durante toda la semana, en trozos peque�os."
									Escribir "No exceder la porci�n sugerida ya que podr�a generar problemas en su salud a largo plazo."
									Escribir "No olvides incluir otras verduras y heno en porciones controladas en su dieta."
							FinSegun
							
						3: //Si el usuario elige s�lido dulce, entonces
							Escribir "Calculando cantidad ideal de s�lido dulce (manzana o pera) para ", nombre, "..."
							Escribir "..."
							
							Segun CachorroOAdultoOAdultoMayor Hacer
								1: //Cachorro
									Escribir "No es recomendable darle manzana o pera a " nombre, " en esta etapa."
									
								2: //Adulto
									Escribir nombre, " debe consumir 1 o 2 rebanadas de pera o manzana a la semana."
									Escribir "RECOMENDACIONES: "
									Escribir "Distribuir la raci�n durante toda la semana."
									Escribir "No olvides quitar las semillas de las frutas ya que pueden generar problemas en la salud de " nombre, "."
									Escribir "No exceder la porci�n sugerida ya que podr�a generar problemas en la salud de " nombre, " a largo plazo." 
									Escribir "No olvides incluir heno en su dieta."
									
								3: // Adulto mayor
									Escribir nombre, " debe consumir 1 rebanada de pera o manzana a la semana."
									Escribir "RECOMENDACIONES: "
									Escribir "Distribuir la raci�n durante toda la semana."
									Escribir "No olvides quitar las semillas de las frutas ya que pueden generar problemas en la salud de " nombre, "."
									Escribir "No exceder la porci�n sugerida ya que podr�a generar problemas en la salud de " nombre, " a largo plazo." 
									Escribir "No olvides incluir heno de forma controlada en su dieta."
							FinSegun
							
					FinSegun
					
					//este FinSi es del conejo
				FinSi
				
				//este FinSi es del gato
			FinSi
			
			//este FinSi es del perro
		FinSi
		
FinAlgoritmo