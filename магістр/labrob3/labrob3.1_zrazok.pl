%% Author: Grogoriy
%% Date: 05.10.2006

% ����������� ������ � 3 ������ 1
% ������� ������������� ���������� �������� ������ ��� ������ ������
:- op(800, fx,  if).
:- op(700, xfx, then).
:- op(300, xfy, or).
:- op(200, xfy, and) .

%������ ���� ����� � ������ ������ ������
if powerled(on)      then  switch_is_plugged_in.    %1
if powerled(off)     then  linefeed_is_incorrect.   %2
if sysled(blinking)  then  cpu_is_on.               %3
if sysled(on)  or sysled(off)  then cpu_is_outoforder.  %4
if link(on)          then  port_is_plugged_in.
if link(blinking)    then  port_transmits_data.      %7

%facts
:- dynamic fact/1.

fact( powerled(on)).
fact( sysled(blinking)).
fact( link(on)).

is_true(P):-
   fact(P).
is_true(P):-             % P �������, Condition - �����
   if Condition then P,   % P - ���ϳ������� �������, ����� ����� � ��������
   is_true(Condition).

is_true(P1 and P2) :-
   is_true( P1), is_true( P2).

is_true( P1 or P2) :-
   is_true( P1) ; is_true( P2).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%������ ������� ���� %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

forward :-
  new_derived_fact( P),          % ����� ����
  !,
  write( 'Derived: '), write(P), nl,
  assert( fact( P)),
  forward                        % ���������� ������
  ;
  write( 'No more facts').       % ������ ���������� ������ ����������

new_derived_fact( Concl):-
  if Cond then Concl,          % ����� �������
  not( fact( Concl)),            % �������� ������� - �� �� ����
  composed_fact( Cond).                 % ����� �������?

composed_fact( Cond):-
  fact( Cond).                                          % ������� ����
composed_fact( Cond1 and Cond2):-
  composed_fact( Cond1),
  composed_fact( Cond2).                            % ������ ���'����� ������
composed_fact( Cond1 or Cond2):-
  composed_fact( Cond1) ;
  composed_fact( Cond2).
