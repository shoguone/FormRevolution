   M S B A M L   `   `   `  ����   FormDatabasesMerge'    !FormDatabasesMerge.SelectDBWindow   \ XPresentationFramework, Version=3.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=3.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=3.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    8x,http://schemas.microsoft.com/winfx/2006/xaml      � Title$I  CОбъединение баз данных формирования��$	��210��$	��410�� � Icon$6 0/FormDatabasesMerge;component/Images/Combine.ico�� � 	Resources  "  ProgressBarWOAnimationTemplate �� 
TargetType � 	Resources  Key �� 
StartPoint �� EndPoint � Offset � Color	 �� RadiusX
 �� RadiusY �� CornerRadius��%~  &	        �� " � ���� progresscolor $	 0 0&�$	 1 0&�.��� $ 0Q�$ Orange��� $	 0.5Q�$ White��� $ 1Q�$ Green��.R�� .+��� $��
PART_Track��$	 5��$
 5��
����ح�{� $��PART_Indicator��#��z��$
��Left=�._�� $��	Animation��}�. .+��� 
���**���� $��PART_GlowRect��$ 10,10,10,10��$	��100��$
��Left=�
��� � �.���  � ColumnDefinitions �� $	��200 ��� $
��200* � � RowDefinitions �� $��30 ��� $��30 ��� $	��80* ��� $��30 �.+��� -   $��GeneralDBTextBox�� �� 
IsReadOnly . $��3,3,3,3q�$	��Top=� � ToolTip$&  Общая база данных�� �� TextAlignment$ Center=�$
��Bold"� �� TextDecorations$
 None{�$��2��$��14(�
�������.��General Database Name�� -   $��SeasonsListView��$��3q�$��1��$��2��$��0�� J� IsHitTestVisible . $R LПризывные сезоны, имеющиеся в базе данных���� -   $��SelectDBComboBox��$��3q�$��1��$��1��$; 5Выберите базу для добавления�� �� DisplayMemberPath$ FileName������  �� 
TargetType" �� �� BasedOn# [B�� �� Triggers ��  �� Binding ��  �� Path$
 Path� �� Value -.a���  �� Property � �� �� Value �� " ��.R��� $��Stretch=�{�.  �� -   $��MergeButton��$��	106,3,3,3q�$��2��$��1��$��2��$? 9Добавить выбранную базу данных��.���� $��5q�$<��6/FormDatabasesMerge;component/Images/AddToDatabase.png�� .  �� -   $��SummonGroupBox��$��Сезон призыва��{�. $	��100��$
��Left=�$��2��$��1��$� �Для изменения значений установите флаг *** в значение True в файле конфигураций��.���� .+��� -   $��YearTextBox��$��23��$��3q�$��0��$ Год призыва�� . �� -   $��NumberTextBox��$��23��$��3q�$��1��$ Номер призыва�� . � -   $��ProgressBar��$��3q�$��2��$��3�� � Value$ 0Q����	#FF01D328