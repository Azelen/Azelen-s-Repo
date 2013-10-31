%% Author:
%% Date: 17.10.2006
%% lab3 variant 10

% Лабораторна робота № 3 Варіант 1
% Простий інтерпретатор зворотного логічного виводу для правил виводу
:- op(800, fx,  if).
:- op(700, xfx, then).
:- op(300, xfy, or).
:- op(200, xfy, and) .


%задаємо базу заннь у вигляді правил виводу
if printer(on)     then  ok.    %1
if out_of_memory   then  pushthe_button.
if out_of_memory   then  decrease_resolution.

%facts
:- dynamic fact/1.

fact( printer(off)).
fact(out_of_memory).
fact(window_closed).

%зворотній логічний вивід
is_true(P):-
   fact( P).
is_true(P):-               % P звязана, Condition - вільна
   if Condition then P,    % P - звяПідходяще правило, умова якого є істинною
   is_true(Condition).

is_true(P1 and P2) :-
   is_true( P1), is_true( P2).

is_true( P1 or P2) :-
   is_true( P1) ; is_true( P2).
   
%прямий логічний вивід %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

forward :-
  new_derived_fact( P),          % Новий факт
  !,
  write( 'Derived: '), write(P), nl,
  assert( fact( P)),
  forward                        % Продовжити роботу
  ;
  write( 'No more facts').       % Процес породження правил завершений

new_derived_fact( Concl):-
  if Cond then Concl,          % Деяке правило
  not fact( Concl),            % Висновок правила - ще не факт
  composed_fact( Cond).                 % Умова істинно?

composed_fact( Cond):-
  fact( Cond).                                          % Простий факт
composed_fact( Cond1 and Cond2):-
  composed_fact( Cond1),
  composed_fact( Cond2).                            % Обидва кон'юнкти істинні
composed_fact( Cond1 or Cond2):-
  composed_fact( Cond1) ;
  composed_fact( Cond2).

