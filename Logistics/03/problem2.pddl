(define (problem log-1)
	(:domain logistics)
	(:objects
	truck0 - truck
	van0 van1 - van
	package0 - package
	valencia - city
	granada - city
	sagunto chulilla chelva - village
	;;sagunto,chulilla chelva villages in Valencia
	)
	(:init

		(at 345.004 (at van0 sagunto))
		;(at van0 sagunto)
		(at 345.004 (at van1 valencia))
		;(at van1 valencia)
		(at 345.004 (at truck0 valencia))
		;(at truck0 valencia)

		;(at package0 valencia)
		(at 345.004 (at package0 valencia))

		;;durations driving with truck0

		(= (duration-driving valencia granada) 300)
		(= (duration-driving valencia sagunto) 30)
		(= (duration-driving valencia chulilla) 30)
		(= (duration-driving valencia chelva) 50)		
		(= (duration-driving valencia valencia) 80000)

		(= (duration-driving granada valencia) 300)		
		(= (duration-driving granada sagunto) 330)
		(= (duration-driving granada chulilla) 330)
		(= (duration-driving granada chelva) 350)
		(= (duration-driving granada granada) 80000)


		(= (duration-driving sagunto valencia) 30)
		(= (duration-driving sagunto granada) 330)
		(= (duration-driving sagunto chulilla) 60)
		(= (duration-driving sagunto chelva) 80)
		(= (duration-driving sagunto sagunto) 80000)

		(= (duration-driving chulilla valencia) 30)
		(= (duration-driving chulilla granada) 330)
		(= (duration-driving chulilla sagunto) 60)
		(= (duration-driving chulilla chelva) 80)
		(= (duration-driving chulilla chulilla) 80000)

		(= (duration-driving chelva valencia) 80)
		(= (duration-driving chelva granada) 350)
		(= (duration-driving chelva sagunto) 80)
		(= (duration-driving chelva chulilla) 80)
		(= (duration-driving chelva chelva) 80000)


		;; duration of loading/ubloading 
		(= (duration-load-unload package0) 20)
	)
	(:goal 
		(and
			(at package0 Chulilla)
		)
	)

	(:metric minimize (total-time))
)