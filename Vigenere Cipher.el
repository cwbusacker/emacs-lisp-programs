
(defun vigenere (plainText key)

(setq alphabet "abcdefghijklmnopqrstuvwxyz ")
(setq ciphertext "")

(setq key (downcase (substring key 0 (length key))))

(setq num 0)
(setq spaces 0)
(while (< num (length plainText))
   ;Lowercase the current letter and set that character to 'c'
  (setq c (downcase (substring plainText num (+ num 1))))
  ;ShiftIterator will find the index part of the key 
  (setq shiftIt (% (- num spaces) (length key)))
  ;create the shifting value (key[shiftIt] - 97)
  (setq shift (- (aref  key shiftIt) 97))
  ;Perform the shift on the character we are currently on ('c' - 97 + shift % 26)
  (setq cryptedc (% (+ (- (aref c 0) 97) shift) 26)) 
  ;Check if c is a space.
  (if (string-equal c (substring alphabet 26 27))
      ;If it is a space, add a space to the ciphertext and add one to spaces variable
      (progn (setq ciphertext (concat ciphertext (substring alphabet 26 27)))
       (setq spaces (+ spaces 1)))
       ;Otherwise, add the cyphered char to the end of ciphertext using concat.
      (setq ciphertext (concat ciphertext (substring alphabet cryptedc (+ cryptedc 1)))))
  ;increment num
  (incf num))
;display the ciphertext.
(print ciphertext))



(setq plain "Discrete math is hard but with a lot of effort and time anyone can do it")
(setq k "BenningisAwesome")  
(vigenere plain k)

"emfpzrzm eapl ag tesh ohb jobz a hsl cr igjbeb ntl liii sbksoi pnv qu ql"


