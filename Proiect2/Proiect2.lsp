(defun C:ModificareCerculete (/ center ss n ) ; am definit comanda cu numele : ModificareCerculete, si parametrii pe care i voi folosi.
  (setq center (getpoint "Introduceti centrul primului cerc") ; alegem de unde sa porneasca insiruirea cercurilor.
    	raza (getreal "Introduceti raza cercurilor") ; alegem ce raza vor avea cercurile dupa actualizare.
	ss (ssget "X" '((0 . "circle")) ) ;selectam toate cercurile.
	)
;modificam raza.
  (setq n 0)
  (repeat (sslength ss) ;pentru a putea modifica fiecare cerc.
    (setq
      circleent (entget (ssname ss n)) ;determina fiecare entitate cerc prin indexul sau n.
      circleradius (assoc 40 circleent) ;determina raza cercului.
      circlenew (cons 40 raza) ;noua raza.
      circleent (subst circlenew circleradius circleent) ;schimba raza veche cu cea noua.
      )
    (entmod circleent)
    (setq n (1+ n)) ;creste indexul.
  )
;
  (setq n 0) ;reseteaza indexul.
  (repeat (sslength ss)
    (setq
      circleent (entget (ssname ss n)) ;determina cercul curent.
      circlecenter (assoc 10 circleent);ii determina centrul.
      circlenew (cons 10 center);noul centru.
      circleent (subst circlenew circlecenter circleent);substutuie.
      center (list (+ (car center) (* 2 raza)) (cadr center) (caddr center)) ;stabilirea noului centru pentru urmatorul cerc modificanduse doar pe axa X.
  										
      )
    (entmod circleent)
    (setq n (1+ n))
   
  )
  
  (princ)
)