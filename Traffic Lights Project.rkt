#lang racket


;STATES TABLE


(define StateTable
  '(
    (1 (("A" "Green") ("B" "Red") ("C" "Green") ("D" "Red")))
    (2 (("A" "Red") ("B" "Red") ("C" "Red") ("D" "Green")))
    (3 (("A" "Red") ("B" "Green") ("C" "Red") ("D" "Red")))
    (4 (("A" "Red") ("B" "Red") ("C" "Red") ("D" "Red")))
    ))

;MAIN LOOP

;this loop starts on the chosen state
;current state is x
;it outputs the colour of each light for the state
;then moves on to inbetween state
;then to next full state
(define State (λ (x) (cond
                           ((= x 1);colours of state 1
                            (string-append "Light " (first (first (first (rest (first  StateTable))))) " is " (first (rest (first (first (rest (first  StateTable)))))))
                            (string-append "Light " (first (second (first (rest (first  StateTable))))) " is " (first (rest (second (first (rest (first  StateTable)))))))
                            (string-append "Light " (first (third (first (rest (first  StateTable))))) " is " (first (rest (third (first (rest (first  StateTable)))))))
                            (string-append "Light " (first (fourth (first (rest (first  StateTable))))) " is " (first (rest (fourth (first (rest (first  StateTable)))))))
                            )
                           ((= x 2);colours of state 2
                            (string-append "Light " (first (first (first (rest (second  StateTable))))) " is " (first (rest (first (first (rest (second  StateTable)))))))
                            (string-append "Light " (first (second (first (rest (second  StateTable))))) " is " (first (rest (second (first (rest (second  StateTable)))))))
                            (string-append "Light " (first (third (first (rest (second  StateTable))))) " is " (first (rest (third (first (rest (second  StateTable)))))))
                            (string-append "Light " (first (fourth (first (rest (second  StateTable))))) " is " (first (rest (fourth (first (rest (second  StateTable)))))))
                            )
                           ((= x 3);colours of state 3
                            (string-append "Light " (first (first (first (rest (third  StateTable))))) " is " (first (rest (first (first (rest (third  StateTable)))))))
                            (string-append "Light " (first (second (first (rest (third  StateTable))))) " is " (first (rest (second (first (rest (third  StateTable)))))))
                            (string-append "Light " (first (third (first (rest (third  StateTable))))) " is " (first (rest (third (first (rest (third  StateTable)))))))
                            (string-append "Light " (first (fourth (first (rest (third  StateTable))))) " is " (first (rest (fourth (first (rest (third  StateTable)))))))
                            )
                           ((= x 4);colours of state 4
                            (string-append "Light " (first (first (first (rest (fourth  StateTable))))) " is " (first (rest (first (first (rest (fourth  StateTable)))))))
                            (string-append "Light " (first (second (first (rest (fourth  StateTable))))) " is " (first (rest (second (first (rest (fourth  StateTable)))))))
                            (string-append "Light " (first (third (first (rest (fourth  StateTable))))) " is " (first (rest (third (first (rest (fourth  StateTable)))))))
                            (string-append "Light " (first (fourth (first (rest (fourth  StateTable))))) " is " (first (rest (fourth (first (rest (fourth  StateTable)))))))
                            )
                          )))

;to see what colour each light should be in the StateTable, the following function is used:
;(NO (NO (light a-d (NO (NO (state 1-4 StateTable))))))
;^^^where NO means not important, just used to navigate through the list

;e.g. :
;(first (rest (first (first (rest (first  StateTable))))))
;this outputs what light 'a' should be in the first state
