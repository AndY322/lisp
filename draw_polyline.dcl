draw_polyline : dialog {
    label = "My_Lab";
	:row{
	:boxed_column {label = "��������� ���������";
		:row
		{
			:button {label = "����"; key="col";}
			:image {key = "c1"; color = 2;}
			
		}
		:toggle {label = "�����������"; key = "sm"; value = "1";}
		:toggle {label = "��������"; key = "close1"; value = "1";}
		:edit_box {label = "�������"; key = "line_width";}
		}
		:boxed_column {label = "����� �������";
			: edit_box {label = "���������� X:"; edit_width = 10; key = "specify_x";}
			: edit_box {label = "���������� Y:"; edit_width = 10; key = "specify_y";}
			: retirement_button {label = "������� ����� -->"; key="hide"; mnemonic="H"; }
		}
		}
		:row{
			:button {label = "������� ����"; key = "open_file";}
			ok_cancel;
		}
}
