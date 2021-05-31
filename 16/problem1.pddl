(define (problem DLOG-2-2-2)
	(:domain driverlog)
	(:objects
	driver0 driver1 driver2 driver3 - driver
	truck0 - truck
	package0 - package
	s0 - location
	s1 - location
	s2 - location
	)
	(:init

		(at 5 (workhours))

		(driving driver3 truck0)
		(at truck0 s0)

		(at driver1 s2)
		(at driver2 s1)
		


		(at package0 s0)


		(= (duration-walking s0 s1) 800)
		(= (duration-walking s0 s2) 800)
		(= (duration-walking s0 s0) 80000)

		(= (duration-walking s1 s0) 800)		
		(= (duration-walking s1 s2) 800)
		(= (duration-walking s1 s1) 80000)

		(= (duration-walking s2 s0) 800)
		(= (duration-walking s2 s1) 800)
		(= (duration-walking s2 s2) 80000)


		;;durations driving with truck0

		(= (duration-driving s0 s1 truck0) 200)
		(= (duration-driving s0 s2 truck0) 200)
		(= (duration-driving s0 s0 truck0) 80000)

		(= (duration-driving s1 s0 truck0) 200)		
		(= (duration-driving s1 s2 truck0) 200)
		(= (duration-driving s1 s1 truck0) 80000)

		(= (duration-driving s2 s0 truck0) 200)
		(= (duration-driving s2 s1 truck0) 200)
		(= (duration-driving s2 s2 truck0) 80000)

		;; duration of loading/ubloading 
		(= (duration-load-unload package0) 20)

		;; duration of board/disembark
		(= (duration-board-disembark) 10)
	)
	(:goal 
		(and
			(at package0 s1)
		)
	)

	(:metric minimize (total-time))
)