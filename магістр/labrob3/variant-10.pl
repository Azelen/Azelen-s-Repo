%% Author:
%% Date: 17.10.2006
%% lab3 variant 10

% ����������� ������ � 3 ������ 1
% ������� ������������� ���������� �������� ������ ��� ������ ������
:- op(800, fx,  if).
:- op(700, xfx, then).
:- op(300, xfy, or).
:- op(200, xfy, and) .


%������ ���� ����� � ������ ������ ������
if printer(on)     then  ok.    %1
if out_of_memory   then  pushthe_button.
if out_of_memory   then  decrease_resolution.

%facts
:- dynamic fact/1.

fact( printer(off)).
fact(out_of_memory).
fact(window_closed).

%�������� ������� ����
is_true(P):-
   fact( P).
is_true(P):-               % P �������, Condition - �����
   if Condition then P,    % P - ���ϳ������� �������, ����� ����� � ��������
   is_true(Condition).

is_true(P1 and P2) :-
   is_true( P1), is_true( P2).

is_true( P1 or P2) :-
   is_true( P1) ; is_true( P2).
   
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
  not fact( Concl),            % �������� ������� - �� �� ����
  composed_fact( Cond).                 % ����� �������?

composed_fact( Cond):-
  fact( Cond).                                          % ������� ����
composed_fact( Cond1 and Cond2):-
  composed_fact( Cond1),
  composed_fact( Cond2).                            % ������ ���'����� ������
composed_fact( Cond1 or Cond2):-
  composed_fact( Cond1) ;
  composed_fact( Cond2).

