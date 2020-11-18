#lang racket


;States table
;0 means red
;1 means green

(define StateTable
  '(
    (1 (("a" 1) ("b" 0) ("c" 1) ("d" 0)))
    (2 (("a" 0) ("b" 0) ("c" 0) ("d" 1)))
    (3 (("a" 0) ("b" 1) ("c" 0) ("d" 0)))
    (4 (("a" 0) ("b" 0) ("c" 0) ("d" 0)))
    ))

;current state is x

(define State (λ (x) (cond
                          (#t (cond    ;because this is always true, the loop doesn't stop
;this loop checks what state the program is in
                                ((= x 1)
                                 (cond
                                      ((= (first (rest (first (first (rest (first  StateTable)))))) 1) "Light A is Green") ;see comments bottom comments
                                      (#t "Light A is Red")
                                      ;I don't like having to write these two^^ lines up every time and have it clutter the program so I'll rewrite is and add a new 
                                      ;lambda function before this lambda function and have it be called multiple times after
                                      )
                                 )
                                ((= x 2) "")
                                ((= x 3) "")
                                ((= x 4) "")
                                
                                )


                            
                          ))))

;to see what colour each light should be in the StateTable, the following function is used:
;(NO (NO (light a-d (NO (NO (state 1-4 StateTable))))))
;^^^where NO means not important, just used to navigate through the list

;e.g. :
;(first (rest (first (first (rest (first  StateTable))))))
;this outputs what light 'a' should be in the first state
