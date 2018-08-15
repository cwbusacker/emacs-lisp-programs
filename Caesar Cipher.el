;****************************************************
;This block of code will do the caesar-cipher without
;any wrapping. ALL ASCII included.
;****************************************************
(defun break-down-message (message)
;transforms the message into a list of chars.
   (mapcar 'vector message))

(defun convert-ascii-list-back-to-message (asciilist)
   (setq asciivector (mapcar 'vector asciilist))
   (setq message(mapconcat 'identity asciivector ""))
   message)


(defun caesar-cipher (key message)
  ;transforms the message into a vector
 (setq messagevector (break-down-message message))
 ;transforms the vector of letters into a vector of ascii values.
 (setq converttolist (mapcar (lambda (arg) (elt arg 0))  messagevector))
 ;encrypt the list of ascii values
 (setq cryptedlist (mapcar (lambda (arg) (mod (+ key arg) 122) )  converttolist))
 ;convert the encrypted message back to a string.
 (setq cryptedmessage (convert-ascii-list-back-to-message cryptedlist))
 cryptedmessage)
  

(caesar-cipher ?j "Tomorrow will be a great day")

: D_]_bb_ggY\\RUQWbUQdTQi


;************************************************************************
;* This version of caesar-cipher-wrapping will capitalize all the letters
;* in the phrase and then wrap the capitalized phrase
;************************************************************************
(defun caesar-cipher-wrapping (key message)
  ;Transform the message to upper case.
 (setq uppermessage (mapcar 'upcase message))
  ;Turn the list into a vector of ascii values.
 (setq messagevector (break-down-message uppermessage))
  ;Turn the ascii values vector back into a list.
 (setq converttolist (mapcar (lambda (arg) (elt arg 0))  messagevector))
 ;Encrypt the message with wrapping. Add the ascii value to the key, then
 ;subtract 65 to get the messages letters down from their ascii values
 ;mod the whole thing by 26 for values for 0-25 and then add the 65 back
 ; in to get it back to the capital ascii value.
 (setq cryptedascii (mapcar (lambda (arg) (+ (mod(- (+ key arg) 65)26)65) )  converttolist))
 ;convert the list back into a string.
 (setq cryptedmessage (convert-ascii-list-back-to-message cryptedascii))
 cryptedmessage)
  
;;Note that spaces and punctuation are not handled. Only handled above. 
(caesar-cipher-wrapping 22 "Do or do not. There is no try")

: ZKPKNPZKPJKPDPPDANAPEOPJKPPNU
