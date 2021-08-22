(define (domain logistics)

	(:requirements :typing :durative-actions :fluents :timed-initial-literals :constraints)

	(:types
		location locatable  - object

		vehicle deliverable - locatable

		;; van is a smaller size of trucks that is allowed to move between any location (city or village)
		;; truck is a large size of vehicle that is allowed to move between only between (cities)
		van truck - vehicle

		package - deliverable

		city village - location
	)

	(:predicates 
		(at ?x - locatable ?y - location)
		(in ?x - deliverable ?y - vehicle)
	)

	(:functions

		(duration-driving ?x - location ?y - location)
		(duration-load-unload ?x - deliverable)
	)

	(:durative-action load-van
	:parameters(?d - deliverable ?t - van ?l - location)
	:duration (= ?duration (duration-load-unload ?d))
	:condition
		(and 
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

	(:durative-action unload-van
	:parameters(?d - deliverable ?t - van ?l - location)
	:duration (= ?duration (duration-load-unload ?d))
	:condition
		(and
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

	;;;;;
	(:durative-action load-truck
	:parameters(?d - deliverable ?t - truck ?l - city)
	:duration (= ?duration (duration-load-unload ?d))
	:condition
		(and 
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

	(:durative-action unload-truck
	:parameters(?d - deliverable ?t - truck ?l - city)
	:duration (= ?duration (duration-load-unload ?d))
	:condition
		(and
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
	;;;;


	(:durative-action drive-van
	:parameters (?t - van ?l1 - location ?l2 - location)
	:duration (= ?duration (duration-driving ?l1 ?l2))
	:condition
		(and
		(at start (at ?t ?l1))
		)
	:effect
		(and
		(at start (not (at ?t ?l1))) 
		(at end (at ?t ?l2))
		)
	)

	(:durative-action drive-truck
	:parameters (?t - truck ?l1 - city ?l2 - city)
	:duration (= ?duration (duration-driving ?l1 ?l2))
	:condition
		(and
		(at start (at ?t ?l1))
		)
	:effect
		(and
		(at start (not (at ?t ?l1))) 
		(at end (at ?t ?l2))
		)
	)
)
