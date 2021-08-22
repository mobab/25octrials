(define 
	(problem problem1)
	(:domain healthcare)

	(:objects

		;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
		;;ROBOT
		;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;    

		robot1 robot2 - robot
		
		
		;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
		;; SENIOR CITIZENS
		;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;    

		senior1	senior2 senior3 senior4	senior5	senior6 senior7 senior8 - senior

		;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
		;;LOCATIONS IN ASSISTED HOME
		;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

		corridor1 corridor2 corridor3 - corridor
		bedroom1 bedroom2 - bedroom
		kitchen1 - kitchen
		music_room1 - music_room
		library1 - library
		dinning_room1 - dinning_room
		sunroom1 sunroom2 - sunroom


		;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
		;; KNOWN AND PRECONNECTED IOT ITEMS
		;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
		
			;; DRINKING VESSELS
		glass_ID01 glass_ID02 glass_ID03 glass_ID04 glass_ID05 glass_ID06 glass_ID07 glass_ID08	- drinking_glass

		;; new 
		;;mug_ID01 - mug
		
			;; MUSIC INSTRUMENTS
		violin_ID01 - violin
		guitar_ID01 - guitar
		
			;; Entertaining objects
		pc_ID01 pc_ID02 - desktop
		tv_ID01 - tv
		book_ID01 - book
		magazine_ID01 - magazine
	)


	(:init 
	
		;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
		;;ORIGIN PLACE OF ROBOT  (changed)
		;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(at 35.001 (be robot1 corridor3))
;(be robot1 corridor3)
;(at 5 (be robot2 sunroom2))
;(be robot2 sunroom2)
;(be robot2 corridor2)
;(at 5 (be robot2 corridor1))

		;(terrified senior1)
		(sad senior3)
		;(bored senior5)

		;(at 0.001 (hydration_time senior1))
		;(at 400 (not (hydration_time senior1)))
		;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
		;;ORIGIN PLACES OF SENIORS
		;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
		
(be senior1 dinning_room1)
(be senior2 library1)
(be senior3 library1)
(be senior4 sunroom1)
(be senior5 kitchen1)
(be senior6 music_room1)
(be senior7 corridor2)
(be senior8 sunroom2)

		;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
		;;ORIGIN PLACES OF DRINKING VESSELS
		;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(be glass_ID01 music_room1)
(be glass_ID02 kitchen1)
(be glass_ID03 sunroom1)
(be glass_ID04 sunroom2)
(be glass_ID05 dinning_room1)
(be glass_ID06 sunroom2)
(be glass_ID07 sunroom2)
(be glass_ID08 dinning_room1)
		;;(be mug_ID01 kitchen1)
		
		;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
		;;ORIGIN PLACES OF MUSIC INSTRUMENTS
		;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;initial location of violin
(be violin_ID01 corridor2)
;;initial location of guitar
(be guitar_ID01 corridor3)

		;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
		;;ORIGIN PLACES OF ENTERTAINING OBJECTS
		;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
		(be pc_ID01 library1)
		(be pc_ID02 library1)
		(be tv_ID01 library1)
		(be book_ID01 kitchen1)
		(be magazine_ID01 dinning_room1)
		
		;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
		;;AVAILABITLITY OF OBJECTS
		;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
		;;(available glass_ID01)
		;;(available glass_ID02)
		;;(available glass_ID03)
		;;(available glass_ID04)
		;(available glass_ID05)
		;(available glass_ID06)
		;(available glass_ID07)
		;(available glass_ID08)
		;;(available mug_ID01)
		;;
		;(available violin_ID01)
		;(available guitar_ID01)
		;;
		(available pc_ID01) 
		(available pc_ID02)
		(available tv_ID01)
		;(available book_ID01)
		;(available magazine_ID01)

		;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
		;;TRAVELLING TIME BEETWEEN PLACES
		;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
		;; sun room1
		(= (moving_time sunroom1 sunroom1) 9999)
		(= (moving_time sunroom1 sunroom2) 140)
		(= (moving_time sunroom1 corridor1) 20)
		(= (moving_time sunroom1 corridor2) 70)
		(= (moving_time sunroom1 corridor3) 120)
		(= (moving_time sunroom1 bedroom1) 50)
		(= (moving_time sunroom1 bedroom2) 150)
		(= (moving_time sunroom1 music_room1) 110)
		(= (moving_time sunroom1 library1) 110)
		(= (moving_time sunroom1 dinning_room1) 110)
		(= (moving_time sunroom1 kitchen1) 130)

		;; sunroom2
		(= (moving_time sunroom2 sunroom2) 9999)
		(= (moving_time sunroom2 sunroom1) 140)
		(= (moving_time sunroom2 corridor1) 120)
		(= (moving_time sunroom2 corridor2) 70)
		(= (moving_time sunroom2 corridor3) 20)
		(= (moving_time sunroom2 bedroom1) 150)
		(= (moving_time sunroom2 bedroom2) 50)
		(= (moving_time sunroom2 music_room1) 110)
		(= (moving_time sunroom2 library1) 110)
		(= (moving_time sunroom2 dinning_room1) 110)
		(= (moving_time sunroom2 kitchen1) 130)

		;; corridor 1
		(= (moving_time corridor1 corridor1) 9999)
		(= (moving_time corridor1 corridor2) 50)
		(= (moving_time corridor1 corridor3) 100)
		(= (moving_time corridor1 sunroom1) 20)
		(= (moving_time corridor1 sunroom2) 120)
		(= (moving_time corridor1 bedroom1) 30)
		(= (moving_time corridor1 bedroom2) 130)
		(= (moving_time corridor1 music_room1) 90)
		(= (moving_time corridor1 library1) 90)
		(= (moving_time corridor1 dinning_room1) 90)
		(= (moving_time corridor1 kitchen1) 110)

		;; corridor 3
		(= (moving_time corridor3 corridor3) 9999)
		(= (moving_time corridor3 corridor1) 100)
		(= (moving_time corridor3 corridor2) 50)
		(= (moving_time corridor3 sunroom1) 120)
		(= (moving_time corridor3 sunroom2) 20)
		(= (moving_time corridor3 bedroom1) 130)
		(= (moving_time corridor3 bedroom2) 30)
		(= (moving_time corridor3 music_room1) 90)
		(= (moving_time corridor3 library1) 90)
		(= (moving_time corridor3 dinning_room1) 90)
		(= (moving_time corridor3 kitchen1) 110)

		;; corridor 2
		(= (moving_time corridor2 corridor2) 9999)
		(= (moving_time corridor2 corridor1) 50)
		(= (moving_time corridor2 corridor3) 50)
		(= (moving_time corridor2 sunroom1) 70)
		(= (moving_time corridor2 sunroom2) 70)
		(= (moving_time corridor2 bedroom1) 80)
		(= (moving_time corridor2 bedroom2) 80)
		(= (moving_time corridor2 music_room1) 40)
		(= (moving_time corridor2 library1) 40)
		(= (moving_time corridor2 dinning_room1) 40)
		(= (moving_time corridor2 kitchen1) 60)

		;; bedroom1
		(= (moving_time bedroom1 bedroom1) 9999)
		(= (moving_time bedroom1 bedroom2) 160)
		(= (moving_time bedroom1 corridor1) 30)
		(= (moving_time bedroom1 corridor2) 80)
		(= (moving_time bedroom1 corridor3) 130)
		(= (moving_time bedroom1 sunroom1) 50)
		(= (moving_time bedroom1 sunroom2) 150)
		(= (moving_time bedroom1 music_room1) 120)
		(= (moving_time bedroom1 library1) 120)
		(= (moving_time bedroom1 dinning_room1) 120)
		(= (moving_time bedroom1 kitchen1) 140)

		;; bedroom2
		(= (moving_time bedroom2 bedroom2) 9999)
		(= (moving_time bedroom2 bedroom1) 160)
		(= (moving_time bedroom2 corridor1) 130)
		(= (moving_time bedroom2 corridor2) 80)
		(= (moving_time bedroom2 corridor3) 30)
		(= (moving_time bedroom2 sunroom1) 150)
		(= (moving_time bedroom2 sunroom2) 50)
		(= (moving_time bedroom2 music_room1) 120)
		(= (moving_time bedroom2 library1) 120)
		(= (moving_time bedroom2 dinning_room1) 120)
		(= (moving_time bedroom2 kitchen1) 140)

		;; music_room
		(= (moving_time music_room1 music_room1) 9999)
		(= (moving_time music_room1 bedroom1) 120)
		(= (moving_time music_room1 bedroom2) 120)
		(= (moving_time music_room1 corridor1) 90)
		(= (moving_time music_room1 corridor2) 40)
		(= (moving_time music_room1 corridor3) 90)	
		(= (moving_time music_room1 sunroom1) 110)
		(= (moving_time music_room1 sunroom2) 110)
		(= (moving_time music_room1 library1) 80)
		(= (moving_time music_room1 dinning_room1) 80)
		(= (moving_time music_room1 kitchen1) 100)

		;; library
		(= (moving_time library1 library1) 9999)
		(= (moving_time library1 bedroom1) 120)
		(= (moving_time library1 bedroom2) 120)
		(= (moving_time library1 corridor1) 90)
		(= (moving_time library1 corridor2) 40)
		(= (moving_time library1 corridor3) 90)	
		(= (moving_time library1 sunroom1) 110)
		(= (moving_time library1 sunroom2) 110)
		(= (moving_time library1 music_room1) 80)
		(= (moving_time library1 dinning_room1) 80)
		(= (moving_time library1 kitchen1) 100)
		;; dinning_room
		(= (moving_time dinning_room1 dinning_room1) 9999)
		(= (moving_time dinning_room1 bedroom1) 120)
		(= (moving_time dinning_room1 bedroom2) 120)
		(= (moving_time dinning_room1 corridor1) 90)
		(= (moving_time dinning_room1 corridor2) 40)
		(= (moving_time dinning_room1 corridor3) 90)	
		(= (moving_time dinning_room1 sunroom1) 110)
		(= (moving_time dinning_room1 sunroom2) 110)
		(= (moving_time dinning_room1 music_room1) 80)
		(= (moving_time dinning_room1 library1) 80)
		(= (moving_time dinning_room1 kitchen1) 20)
		;; kitchen
		;; dinning_room
		(= (moving_time kitchen1 kitchen1) 9999)
		(= (moving_time kitchen1 bedroom1) 140)
		(= (moving_time kitchen1 bedroom2) 140)
		(= (moving_time kitchen1 corridor1) 110)
		(= (moving_time kitchen1 corridor2) 60)
		(= (moving_time kitchen1 corridor3) 110)	
		(= (moving_time kitchen1 sunroom1) 130)
		(= (moving_time kitchen1 sunroom2) 130)
		(= (moving_time kitchen1 music_room1) 100)
		(= (moving_time kitchen1 library1) 100)
		(= (moving_time kitchen1 dinning_room1) 20)		
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;new end

		
		;; OTHER DURATIONS
		(= (carry_time) 10)
		(= (give_time) 10)
		(= (suggest_time) 5)
		(= (dummy_duration) 30)
		(= (filling_duration) 10)
		
		;; PENALTY COST OF SUGGESTING ACTION	
		(= (suggestion_cost) 100)


		

		;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
		;;PENALTY TOTAL COST TO BE MINIMIZED
		;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

		(= (total_cost) 0 )

	)

	(:goal 
		(and 
		(cheerful senior3)
;		(entertained senior5)
		;(soothed senior1)
		)
	)
	
;	(:constraints 
;		(and
;			(at end(cheerful senior3))
;			(at end(entertained senior5))
;			(at end(soothed senior1))
;		)
;	)
	(:metric minimize 
		(+
		(* 5 (total_cost))
		(total-time)
		)
	)	

)
