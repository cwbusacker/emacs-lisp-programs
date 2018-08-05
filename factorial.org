
#+BEGIN_SRC emacs-lisp
(defun factorial (n)
 "Only handles up to factorial 19"
  (if (<= n 1)
      1
      (* n (factorial (- n 1)))))

(mapcar 'factorial '(0 1 2 3 4 5 6 7 8 9 10))

#+END_SRC

#+RESULTS:
(1 1 2 6 24 120 720 5040 40320 362880 3628800)