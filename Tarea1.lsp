
;;Andrea Marín
;;158999

;; TAREA 1

;; definir árbol
(setf tree '(A (B (D (H(L M ) I(N O( T U)) J) E) C (F (K (P Q(S) R)) G))))

;; EJ 1. Da la altura del árbol
(defun altura (tree)
(cond 
((null tree) 1)
((atom tree) 0)
(t (max (+ 1 (altura (car tree))) (altura (cdr tree))))))


(altura tree)

;; EJ 2. Obtener el grado de un árbol (máximo número de hijos)
(defun grado (tree)
(cond
((atom tree) 0)
(t (apply #'max (count-if #'atom tree) (mapcar #'grado tree)))))

(grado tree)

;; EJ 3. Imprime un árbol por niveles (breath-first)
(defun niveles(tree)
(when (and (listp tree)(not (null tree)))(print (remove-if #'listp tree))(niveles (apply #'append (remove-if #'atom tree)))))

(niveles tree)

;; EJ 4.Invierte una lista a profundidad

;no redefine la lista
(defun invertir(tree)
(cond
((null tree) tree)
((atom (car tree))(append (invertir(cdr tree))(list (car tree))))
(t (append (invertir(cdr tree))(list (invertir(car tree)))))))

(invertir tree)

;redefine la lista
(defun invierte (tree)
(when (listp tree) (nreverse tree) (mapcar #'invierte tree)))

(invierte tree)
(print tree)

