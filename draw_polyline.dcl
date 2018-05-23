draw_polyline : dialog {
    label = "My_Lab";
	:row{
	:boxed_column {label = "параметры полилинии";
		:row
		{
			:button {label = "Цвет"; key="col";}
			:image {key = "c1"; color = 2;}
			
		}
		:toggle {label = "Сглаживание"; key = "sm"; value = "1";}
		:toggle {label = "Замкнуть"; key = "close1"; value = "1";}
		:edit_box {label = "Толщина"; key = "line_width";}
		}
		:boxed_column {label = "Точка вставки";
			: edit_box {label = "Координата X:"; edit_width = 10; key = "specify_x";}
			: edit_box {label = "Координата Y:"; edit_width = 10; key = "specify_y";}
			: retirement_button {label = "Указать мышью -->"; key="hide"; mnemonic="H"; }
		}
		}
		:row{
			:button {label = "Открыть файл"; key = "open_file";}
			ok_cancel;
		}
}
