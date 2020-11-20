#lang racket

"Type (State x) to start the program, where x is a number 1-4";Instructions to start program

;STATES TABLE
(define StateTable
  '(
    (1 (("A" "Green") ("B" "Red") ("C" "Green") ("D" "Red")));contains the light label and the colour of the light
    (2 (("A" "Red") ("B" "Red") ("C" "Red") ("D" "Green")))
    (3 (("A" "Red") ("B" "Green") ("C" "Red") ("D" "Red")))
    (4 (("A" "Red") ("B" "Red") ("C" "Red") ("D" "Red")))
    ))

;GLOBAL VARIABLES
(define Pa "red");previous colour of a
(define Pb "red")
(define Pc "red")
(define Pd "red")
(define Na "red");next colour of a
(define Nb "red")
(define Nc "red")
(define Nd "red")

;IN-BETWEEN STATE LOOP
(define inb (λ (w y z) (cond ;this loop is called in the main loop
                              ((equal? w y) (displayln (string-append "Light " z " is " w)));if the light doesn't change, output previous light
                              ((equal? y "Red") (displayln (string-append "Light " z " is " "Yellow")));if the light changes to red (from green) then output yellow light
                              (#t (displayln (string-append "Light " z " is " "Red and Yellow")));otherwise (if light changes from red to green) then output red and yellow light
                              )
              ))

;MAIN LOOP
(define State (λ (x) (cond
                           ((= x 1);checks if state is 1

                            ;IN-BETWEEN STATE 4-1
                            ;(displayln "4-1") ;(for testing)
                            (set! Na (first (rest (first (first (rest (first  StateTable)))))));set next light a to what it will be in the main state (1 here)
                            (set! Nb (first (rest (second (first (rest (first  StateTable)))))))
                            (set! Nc (first (rest (third (first (rest (first  StateTable)))))))
                            (set! Nd (first (rest (fourth (first (rest (first  StateTable)))))))
                            (inb Pa Na (first (first (first (rest (first  StateTable))))));calls the in-between loop with the previous light, next light and the letter "a"
                            (inb Pb Nb (first (second (first (rest (first  StateTable))))))
                            (inb Pc Nc (first (third (first (rest (first  StateTable))))))
                            (inb Pd Nd (first (fourth (first (rest (first  StateTable))))))
                            (displayln "");line break
                            (sleep 5);wait a few seconds
                            
                            ;STATE 1
                            ;(displayln "1")
                            (displayln (string-append "Light " (first (first (first (rest (first  StateTable))))) " is " Na))
                            (displayln (string-append "Light " (first (second (first (rest (first  StateTable))))) " is " Nb))
                            (displayln (string-append "Light " (first (third (first (rest (first  StateTable))))) " is " Nc))
                            (displayln (string-append "Light " (first (fourth (first (rest (first  StateTable))))) " is " Nd))
                            (displayln " ")
                            (sleep 5)
                            (set! Pa (first (rest (first (first (rest (first  StateTable)))))));saving what colour light a is in this state to the global variable
                            (set! Pb (first (rest (second (first (rest (first  StateTable)))))))
                            (set! Pc (first (rest (third (first (rest (first  StateTable)))))))
                            (set! Pd (first (rest (fourth (first (rest (first  StateTable)))))))
                            (set! x 2);switches state to next state
                            (State x);calls the loop again, after the state was changed
                            )
                           
                           ((= x 2)
                            
                            ;IN-BETWEEN STATE 1-2
                            ;(displayln "1-2")
                            (set! Na (first (rest (first (first (rest (second  StateTable)))))))
                            (set! Nb (first (rest (second (first (rest (second  StateTable)))))))
                            (set! Nc (first (rest (third (first (rest (second  StateTable)))))))
                            (set! Nd (first (rest (fourth (first (rest (second  StateTable)))))))
                            (inb Pa Na (first (first (first (rest (second  StateTable))))))
                            (inb Pb Nb (first (second (first (rest (second  StateTable))))))
                            (inb Pc Nc (first (third (first (rest (second  StateTable))))))
                            (inb Pd Nd (first (fourth (first (rest (second  StateTable))))))
                            (displayln "")
                            (sleep 5)

                            ;STATE 2
                            ;(displayln "2")
                            (displayln (string-append "Light " (first (first (first (rest (second  StateTable))))) " is " Na))
                            (displayln (string-append "Light " (first (second (first (rest (second  StateTable))))) " is " Nb))
                            (displayln (string-append "Light " (first (third (first (rest (second  StateTable))))) " is " Nc))
                            (displayln (string-append "Light " (first (fourth (first (rest (second  StateTable))))) " is " Nd))
                            (displayln " ")
                            (sleep 5)
                            (set! Pa (first (rest (first (first (rest (second  StateTable)))))))
                            (set! Pb (first (rest (second (first (rest (second  StateTable)))))))
                            (set! Pc (first (rest (third (first (rest (second  StateTable)))))))
                            (set! Pd (first (rest (fourth (first (rest (second  StateTable)))))))
                            (set! x 3)
                            (State x)
                            )
                           
                           ((= x 3)

                            ;IN-BETWEEN STATE 2-3
                            ;(displayln "2-3")
                            (set! Na (first (rest (first (first (rest (third  StateTable)))))))
                            (set! Nb (first (rest (second (first (rest (third  StateTable)))))))
                            (set! Nc (first (rest (third (first (rest (third  StateTable)))))))
                            (set! Nd (first (rest (fourth (first (rest (third  StateTable)))))))
                            (inb Pa Na (first (first (first (rest (third  StateTable))))))
                            (inb Pb Nb (first (second (first (rest (third  StateTable))))))
                            (inb Pc Nc (first (third (first (rest (third  StateTable))))))
                            (inb Pd Nd (first (fourth (first (rest (third  StateTable))))))
                            (displayln "")
                            (sleep 5)

                            ;STATE 3
                            ;(displayln "3")
                            (displayln (string-append "Light " (first (first (first (rest (third  StateTable))))) " is " Na))
                            (displayln (string-append "Light " (first (second (first (rest (third  StateTable))))) " is " Nb))
                            (displayln (string-append "Light " (first (third (first (rest (third  StateTable))))) " is " Nc))
                            (displayln (string-append "Light " (first (fourth (first (rest (third  StateTable))))) " is " Nd))
                            (displayln " ")
                            (sleep 5)
                            (set! Pa (first (rest (first (first (rest (third  StateTable)))))))
                            (set! Pb (first (rest (second (first (rest (third  StateTable)))))))
                            (set! Pc (first (rest (third (first (rest (third  StateTable)))))))
                            (set! Pd (first (rest (fourth (first (rest (third  StateTable)))))))
                            (set! x 4)
                            (State x)
                            )
                           
                           ((= x 4)

                            ;IN-BETWEEN STATE 3-4
                            ;(displayln "3-4")
                            (set! Na (first (rest (first (first (rest (fourth  StateTable)))))))
                            (set! Nb (first (rest (second (first (rest (fourth  StateTable)))))))
                            (set! Nc (first (rest (third (first (rest (fourth  StateTable)))))))
                            (set! Nd (first (rest (fourth (first (rest (fourth  StateTable)))))))
                            (inb Pa Na (first (first (first (rest (fourth  StateTable))))))
                            (inb Pb Nb (first (second (first (rest (fourth  StateTable))))))
                            (inb Pc Nc (first (third (first (rest (fourth  StateTable))))))
                            (inb Pd Nd (first (fourth (first (rest (fourth  StateTable))))))
                            (displayln "")
                            (sleep 5)

                            ;STATE 4
                            ;(displayln "4")
                            (displayln (string-append "Light " (first (first (first (rest (fourth  StateTable))))) " is " Na))
                            (displayln (string-append "Light " (first (second (first (rest (fourth  StateTable))))) " is " Nb))
                            (displayln (string-append "Light " (first (third (first (rest (fourth  StateTable))))) " is " Nc))
                            (displayln (string-append "Light " (first (fourth (first (rest (fourth  StateTable))))) " is " Nd))
                            (displayln " ")
                            (sleep 5)
                            (set! Pa (first (rest (first (first (rest (fourth  StateTable)))))))
                            (set! Pb (first (rest (second (first (rest (fourth  StateTable)))))))
                            (set! Pc (first (rest (third (first (rest (fourth  StateTable)))))))
                            (set! Pd (first (rest (fourth (first (rest (fourth  StateTable)))))))
                            (set! x 1)
                            (State x)
                            )
                          )))

;to see what colour each light should be in the StateTable, the following function is used:
;(NO (NO (light a-d (NO (NO (state 1-4 StateTable))))))
;^^^where NO means not important, just used to navigate through the list

;e.g. :
;(first (rest (first (first (rest (first  StateTable))))))
;this outputs what light 'a' should be in the first state
