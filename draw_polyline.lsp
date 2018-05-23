(defun getpt ()
  (setq pt (getpoint "\n ������� ����� \n"))
  (setq specify_x (rtos (car pt) 2 3))
  (setq specify_y (rtos (cadr pt) 2 3))
)

(defun getcolor	()
  (setq num_color (atoi (getvar "cecolor")))
  (setq num_color (acad_colordlg num_color))
  (command "color" num_color)
)

(defun draw()
	(setq p1 (strcat (rtos (car pt) 2 3) "," (rtos (cadr pt) 2 3)))
	(setq p2 (strcat (rtos (nth 0 cr) 2 3) "," (rtos (nth 1 cr) 2 3)))
	(setq p3 (strcat (rtos (nth 2 cr) 2 3) "," (rtos (nth 3 cr) 2 3)))
	(setq p4 (strcat (rtos (nth 4 cr) 2 3) "," (rtos (nth 5 cr) 2 3)))
	(setq p5 (strcat (rtos (nth 6 cr) 2 3) "," (rtos (nth 7 cr) 2 3)))
	(if (= close1 "1") (setq varclose "close") (setq varclose ""))
	(if (= sm "1") (setq sm "spline") (setq sm ""))
	(command "lweight" line_width)
	(command "pline"  p1 p2 p3 p4 p5 varclose)
	(setq lastvar (entlast))
	(command "pedit" lastvar sm "")
	
)

(defun readfile()

  (setq coordinates (open "d:\\LISP\\coordinates.txt" "r"))
  (setq coordinate (list))
  (repeat 8
	(setq rf (read-line coordinates))
	(setq coordinate (cons (atof rf) coordinate))
  )
  
  (setq cr (reverse coordinate))
)

(defun main_dialog()
  (if (not (new_dialog "draw_polyline" dcl_id)) (exit))

  (start_image "c1")(fill_image 0 0 500 500 (atoi (getvar "cecolor")))(end_image)

  (set_tile "specify_x" specify_x)
  (set_tile "specify_y" specify_y)
  (set_tile "line_width" line_width)
  (set_tile "close1" close1)
  (set_tile "sm" sm)
  
  (action_tile "col" "(done_dialog 3)")
  (action_tile "hide" "(done_dialog 4)")
  (action_tile "specify_x" "(setq specify_x $value)")
  (action_tile "specify_y" "(setq specify_y $value)")
  (action_tile "line_width" "(setq line_width $value)")
  (action_tile "sm" "(setq sm $value)")
  (action_tile "close1" "(setq close1 $value)")
  (action_tile "open_file" "(done_dialog 5)")
  (action_tile "button_Accept" "done_dialog 1")
  
  (setq w_n (start_dialog))
  (if (= w_n 3) (getcolor))
  (if (= w_n 4) (getpt))
  (if (= w_n 5) (readfile))
  (if (= w_n 1) (draw))
)
(defun C:my_lab( )
	(setq w_n 2 specify_x "0" specify_y "0" line_width "bylayer")
  (setq dcl_id (load_dialog "d:\\LISP\\draw_polyline.dcl"))
  (while (> w_n 0) (main_dialog))
  (unload_dialog dcl_id)
)
