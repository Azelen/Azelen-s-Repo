/* ��������� 5 
   �������� ��㳳���� ����
*/

%��������� ���������
:- op(800, fx,  if).
:- op(700, xfx, then).
:- op(300, xfy, or).
:- op(200, xfy, and).

%������ ���� ����� � ������ ������ ������
if
  hall_wet and kitchen_dry
then
  leak_in_bathroom.

if
  hall_wet and bathroom_dry
then
  problem_in_kitchen.

if
  window_closed or no_rain
then
  no_water_from_outside.

%facts
:- dynamic fact/1.

fact(hall_wet).
fact(bathroom_dry).
fact(window_closed).


%����������� 
forward :-
  new_derived_fact( P),          % ����� ����
  !,
  write( 'Derived: '), write(P), nl,
  assert( fact( P)),
  forward                        % ���������� ������
  ;
  write( 'No more facts'), save(db1).       % ������ ���������� ������ ����������

new_derived_fact( Concl):-
  if Cond then Concl,          % ����� �������
  %not fact
  \+ fact( Concl),            % �������� ������� - �� �� ����
  composed_fact( Cond).         % ����� �������?
  
composed_fact( Cond):-
  fact( Cond).                                          % ������� ����

composed_fact( Cond1 and Cond2):-
  composed_fact( Cond1),
  composed_fact( Cond2).                            % ������ �������� ������

composed_fact( Cond1 or Cond2):-
  composed_fact( Cond1) ;
  composed_fact( Cond2).

