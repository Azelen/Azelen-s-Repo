% ˳�����
% ������� ������������� ���������� �������� ������ ��� ������ ������
:- op(800, fx,  if).
:- op(700, xfx, then).
:- op(300, xfy, or).
:- op(200, xfy, and) .


%������ ���� ����� � ������ ������ ������
if hall_wet and kitchen_dry
then leak_in_bathroom.

if hall_wet and bathroom_dry
then problem_in_kitchen.

if window_closed or no_rain
then no_water_from_outside.

%facts
:- dynamic fact/1.

fact(hall_wet).
fact(bathroom_dry).
fact(window_closed).

is_true(P):-
   fact(P).
is_true(P):-             % P �������, Condition - �����
   if Condition then P,   % P - ���ϳ������� �������, ����� ����� � ��������
   is_true(Condition).    
   
is_true(P1 and P2) :-
   is_true( P1), is_true( P2).
   
is_true( P1 or P2) :- 
   is_true( P1) ; is_true( P2).
