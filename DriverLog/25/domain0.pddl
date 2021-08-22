(define (domain driverlog)

	(:requirements :typing :durative-actions :fluents :timed-initial-literals :constraints)

	(:types
		location locatable  - object

		agent vehicle deliverable - locatable

		driver - agent

		truck - vehicle

		package - deliverable
	)

	(:predicates 
		(at ?x - locatable ?y - location)
		(in ?x - deliverable ?y - vehicle)
		(driving ?x - agent ?y - vehicle)
		(empty ?x - vehicle)
		(workhours)
	)

	(:functions

		(duration-driving ?x - location ?y - location ?z - vehicle)
		(duration-walking ?x - location ?y - location)
		(duration-load-unload ?x - deliverable)
		(duration-board-disembark)
	)

	(:durative-action load-vehicle
	:parameters(?d - deliverable ?t - vehicle ?l - location)
	:duration (= ?duration (duration-load-unload ?d))
	:condition
		(and 
		(at start (workhours))
		(at start (at ?t ?l))
		(over all (at ?t ?l))
		(at end (at ?t ?l))
		(at start (at ?d ?l))
		)
	:effect
		(and 
		(at start (not (at ?d ?l))) 
		(at end (in ?d ?t))
		)
	)

	(:durative-action unload-vehicle
	:parameters(?d - deliverable ?t - vehicle ?l - location)
	:duration (= ?duration (duration-load-unload ?d))
	:condition
		(and
		(at start (workhours))
        (at start (at ?t ?l))
		(over all (at ?t ?l))
		(at end (at ?t ?l)) 
        (at start (in ?d ?t))
        )
	:effect
		(and 
		(at start (not (in ?d ?t)))
		(at end (at ?d ?l))
		)
	)

	(:durative-action board-vehicle
	:parameters(?a - agent ?t - vehicle ?l - location)
	:duration (= ?duration (duration-board-disembark))
	:condition
		(and 
		(at start (workhours))	
		(at start (at ?t ?l))
		(over all (at ?t ?l))
		(at end (at ?t ?l))
		(at start (at ?a ?l)) 
		(at start (empty ?t))
		)
	:effect
		(and 
		(at start (not (at ?a ?l))) 
		(at end (driving ?a ?t))
		(at start (not (empty ?t)))
		)
	)

	(:durative-action disembark-vehicle
	:parameters (?a - agent ?t - vehicle ?l - location)
	:duration (= ?duration (duration-board-disembark))
	:condition
 		(and 
 		(at start (workhours))	
		(at start (at ?t ?l))
		(over all (at ?t ?l))
		(at end (at ?t ?l))
		(at start (driving ?a ?t))
		)
	:effect
		(and
		(at start (not (driving ?a ?t))) 
		(at end (at ?a ?l))
		(at end (empty ?t))
		)
	)

	(:durative-action drive-vehicle
	:parameters (?a - agent ?t - vehicle ?l1 - location ?l2 - location)
	:duration (= ?duration (duration-driving ?l1 ?l2 ?t))
	:condition
		(and
		(at start (workhours))	
		(at start (at ?t ?l1))
		(at start (driving ?a ?t))
		(over all (driving ?a ?t))
		(at end (driving ?a ?t))
		)
	:effect
		(and
		(at start (not (at ?t ?l1))) 
		(at end (at ?t ?l2))
		)
	)

	(:durative-action walk
	:parameters (?a - agent ?l1 - location ?l2 - location)
	:duration (= ?duration (duration-walking ?l1 ?l2))
	:condition
		(and
		(at start (workhours))	
		(at start (at ?a ?l1)) 
		)
	:effect
		(and
		(at start (not (at ?a ?l1)))
		(at end (at ?a ?l2))
		)
	)
)
