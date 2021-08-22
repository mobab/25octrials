(define (domain healthcare)

	(:requirements
		:typing
		:durative-actions
		:timed-initial-literals
		:fluents
		:preferences
		:constraints
	)
	
	(:types
		;; the robot, the senior patient, the location
		locatable - object
		robot senior location tool communication_device - locatable
		
		;; for helping with the terrified emotion (give water)
		drinking_vessel - tool
		
		;; for helping with the sad emotion (give music instrument) 
		making_music - tool 
		
		;; for helping with the bored emotion
		solving reading - tool
		
		;; hierarchy of alternatives + new mug
	
		drinking_glass mug - drinking_vessel
		violin guitar  - making_music	
		puzzle yoyo - solving
		magazine book  - reading
		tv desktop - communication_device
		
		;; rooms in the floor
		dinning_room kitchen music_room library bedroom corridor sunroom - location
	)
	
	(:predicates
		
		;locatable is in ?loc
		(be ?locatable - locatable ?loc - location)
			

		;controls priority of drinking over other activities.
		(hydration_time ?senior - senior)

		;; negative three feelings 
		(terrified ?senior - senior)
		(sad ?senior - senior)
		(bored ?senior - senior)
		;; opposites of negative feeling
		(soothed ?senior - senior)
		(cheerful ?senior - senior)
		(entertained ?senior - senior)
		
		;; AVAILABLITY OF AN OBJECT
		(available ?object - communication_device)
		
		;; STATUS OF AN DRINKING VESSEL
		(filled ?item - drinking_vessel)
		
		;; ROBOT IS CARRYING AN OBJECT
		(holding ?robot - robot ?item - tool)
		
		;; AN OBJECT HAS ALREADY BEEN GIVEN TO A SENIOR
		(given ?item - tool ?senior - senior)
		
		;; A SUGGESTION HAS ALREADY BEEN PROVIDED TO A SENIOR
		(suggested ?item - communication_device ?senior - senior)	

	)
	
	(:functions
		;moving time between ?to and ?from 
		(moving_time ?to - location ?from - location)

		;TOTAL COST related to suggestions
		(total_cost)
		(suggestion_cost)

		;FETCHING TIME OF AN ITEM
		(carry_time)
		;GIVING AN ITEM TIME
		(give_time)
		;;SUGGESTING AN ACTIVITY
		(suggest_time)
		
		;; A DURATION THAT WE USE FOR SATISFACTION OF NEED DURATION
		(dummy_duration)
		(filling_duration)
	)
	
	;; ---------- a robot can move between connected locations ----------
	(:durative-action move
		:parameters	(?robot - robot ?loc1 - location ?loc2 - location)
		:duration 	(= ?duration (moving_time ?loc1 ?loc2))
		:condition	
			(and
				(at start (be ?robot ?loc1))
			)
		:effect	
			(and
				(at start (not (be ?robot ?loc1)))
				(at end (be ?robot ?loc2))
			)
	)
	
	;; ---------- a robot can carry a tool item ----------
	(:durative-action carry
		:parameters (?robot - robot 
					 ?item - tool
					 ?location - location)
		:duration (= ?duration (carry_time))
		:condition
			(and
				(at start (be ?robot ?location))
				(over all (be ?robot ?location))
				(at end   (be ?robot ?location))

				(at start (be ?item ?location))
			)
		:effect
			(and 
				(at end (holding ?robot ?item))
				(at end (not (be ?item ?location)))
			)
	)
	;; ---------- a robot can fill a drinking_vessel item ----------
	(:durative-action fill
		:parameters (?robot - robot 
					 ?item - drinking_vessel
					 ?location - kitchen)
		:duration (= ?duration (filling_duration))
		:condition
			(and
				;(over all (be ?robot ?location))
				(at start (be ?robot ?location))
				(over all (be ?robot ?location))
				(at end   (be ?robot ?location))
				

				(at start (holding ?robot ?item))
				(over all (holding ?robot ?item))
				(at end   (holding ?robot ?item))

			)
		:effect
			(and 
				(at end (filled ?item))
			)
	)

	;; ---------- a robot can give tool item to a senior ----------
	(:durative-action give
		:parameters (?robot - robot 
					 ?senior - senior
					 ?item - tool
					 ?location - location)
		:duration (= ?duration (carry_time))
		:condition
			(and
				(at start (be ?robot ?location))
				(over all (be ?robot ?location))
				(at end   (be ?robot ?location))
				
				(at start (be ?senior ?location))
				(over all (be ?senior ?location))
				(at end   (be ?senior ?location))


				(at start (holding ?robot ?item))
			)
		:effect
			(and 
				(at end (not (holding ?robot ?item)))
				(at end (given ?item ?senior))
			)
	)
	
	; ---------- to satisfy a goal state of soothed  ----------
	(:durative-action soothedrecieved
		:parameters (?senior - senior ?item - drinking_vessel ?loc - location)
		:duration (= ?duration (dummy_duration))
		:condition
			(and
				(at start (be ?senior ?loc))
				(at start (terrified ?senior))
				(at start (hydration_time ?senior))
				(at start (given ?item ?senior))
				(over all (given ?item ?senior))
				(at end   (given ?item ?senior))
				(at start (filled ?item))
			)
		:effect
			(and
				(at end (not (terrified ?senior)))
				(at end (soothed ?senior))
				(at end (not (filled ?item)))
				(at end (be ?item ?loc))
			)
	)
	
	; ---------- to satisfy a goal state of cheerful  ----------
	(:durative-action cheerrecieved
		:parameters (?senior - senior ?item - making_music ?loc - location)
		:duration (= ?duration (dummy_duration))
		:condition
			(and
				(at start (be ?senior ?loc))
				(at start (sad ?senior))
				;(over all (be ?robot ?location))
				(at start (given ?item ?senior))
				(over all (given ?item ?senior))
				(at end   (given ?item ?senior))
			)
		:effect
			(and
				(at end (not (sad ?senior)))
				(at end (be ?item ?loc))
				(at end (cheerful ?senior))
			)
	)
	
	; ---------- to satisfy a goal state of entertained since our simulator do not deal with derived predicates ----------
	(:durative-action entertainment1recieved
		:parameters (?senior - senior ?item - (either solving reading) ?loc - location)
		:duration (= ?duration (dummy_duration))
		:condition
			(and
			
				(at start (be ?senior ?loc))
				(at start (bored ?senior))
				(at start (given ?item ?senior))
				(over all (given ?item ?senior))
				(at end   (given ?item ?senior))
			)
		:effect
			(and
				(at end (not (bored ?senior)))
				(at end (be ?item ?loc))
				(at end (entertained ?senior))
			)
	)
	;; ---------- a robot can suggest entertainment to senior if it cannot give him tools with cost ---------- 
	;; 				(so the planner initially favors giving actions rather than suggestion actions)
	(:durative-action suggestentertianment2
		:parameters (?robot - robot 
					 ?senior - senior
					 ?item - communication_device
					 ?location - location)
		:duration (= ?duration (suggest_time))
		:condition
			(and
				(at start (available ?item))
				
				;(over all (be ?robot ?location))
				(at start (be ?robot ?location))
				(over all (be ?robot ?location))
				(at end   (be ?robot ?location))
				
				(at start (be ?senior ?location))
				(over all (be ?senior ?location))
				(at end   (be ?senior ?location))
			)
		:effect
			(and 
				(at end (suggested ?item ?senior))
				(at end (increase (total_cost) (suggestion_cost) ))
			)
	)
	
	; ---------- to satisfy a goal state of entertained since our simulator do not deal with derived predicates ----------
		(:durative-action entertainment2suggested
		:parameters (?senior - senior ?item - communication_device)
		:duration (= ?duration (dummy_duration))
		:condition
			(and
				(at start (available ?item))
				(at start (bored ?senior))
				;(over all (be ?robot ?location))
				(at start (suggested ?item ?senior))
				(over all (suggested ?item ?senior))
				(at end   (suggested ?item ?senior))
			)
		:effect
			(and
				(at start (not (available ?item)))
				(at end (not (bored ?senior)))
				(at end (entertained ?senior))
				(at end (available ?item))
			)
	)
	
	
)
