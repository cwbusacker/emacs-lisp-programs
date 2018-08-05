#+BEGIN_SRC emacs-lisp
(defun break-down-message (message)
;transforms the message into a vector of chars.
   (mapcar 'vector message))

(defun password-strength-check (password)
      
      (if ( > (length password) 6)
      (setq STRENGTH 50)
      (setq STRENGTH 1))

      ;this is how I am converting the password into a list of ascii values.
      (setq passwordasciivec (break-down-message password))
      
      ;this is where the ascii values get assigned.
      (setq passwordasciilist (mapcar (lambda (arg) (elt arg 0))  passwordasciivec))
      
      ;here I am setting up the variables.
      (setq count 0)
      (setq upper 0)
      (setq lower 0)
      (setq number 0)
      (setq symbol 0)
      
      ;loop through the list and count the number of each type of char.
      (while (< count (length password))
             (setq c (elt passwordasciilist count))
             ;if c is in the range of number ascii values
             (if(and (> c 47)(< c 58))
                 (setq number (+ number 1))
                 ;range of upper letters.
                 (if (and (> c 64)(< c 91))
                     (setq upper (+ upper 1))
                     ;range of lower letters.
                     (if (and (> c 96)(< c 123))
                     (setq lower (+ lower 1))
                     ;if not any of the above, then it's a symbol.
                     (setq symbol (+ symbol 1)))))

              (setq count (+ count 1)))

       ;the longer the password the stronger the strength.
       (setq STRENGTH (* STRENGTH (/ count 6)(/ count 6)))
       
       ;change strength by the amount of each character.
       (setq STRENGTH (* STRENGTH (+ upper lower (* number 2) (* symbol 3))))
       

       ;setup a multiplier for having different types of characters.
      (setq difftypechar 0)

       (when (> lower 0)
       (setq difftypechar (+ difftypechar 0.5)))
       (when (> upper 0)
       (setq difftypechar (+ difftypechar 0.5)))
       (when (> number 0)
       (setq difftypechar (+ difftypechar 1.5)))
       (when (> symbol 0)
       (setq difftypechar (+ difftypechar 2)))
       
       (setq STRENGTH (* difftypechar STRENGTH)) 

       (setq STRENGTH (/ (* 100 STRENGTH) (+ STRENGTH 1500)))
       
       (progn (princ "Your password is ")
       (princ STRENGTH)
       (princ "% secure")))


              
  
#+END_SRC

#+RESULTS:
: password-strength-check
#+BEGIN_SRC emacs-lisp :results output
  (password-strength-check "password")
#+END_SRC

#+RESULTS:
: Your password is 11.764705882352942% secure

