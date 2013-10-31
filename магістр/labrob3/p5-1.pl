/* практична 5 
   зворотній логіічний вивід
*/

%визначимо оператори
:- op(800, fx,  if).
:- op(700, xfx, then).
:- op(300, xfy, or).
:- op(200, xfy, and).

%задаємо базу заннь у вигляді правил виводу
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


%інтепритуємо 
forward :-
  new_derived_fact( P),          % Новий факт
  !,
  write( 'Derived: '), write(P), nl,
  assert( fact( P)),
  forward                        % Продовжити роботу
  ;
  write( 'No more facts'), save(db1).       % Процес породження правил завершений

new_derived_fact( Concl):-
  if Cond then Concl,          % Деяке правило
  %not fact
  \+ fact( Concl),            % Висновок правила - ще не факт
  composed_fact( Cond).         % Умова істинно?
  
composed_fact( Cond):-
  fact( Cond).                                          % Простий факт

composed_fact( Cond1 and Cond2):-
  composed_fact( Cond1),
  composed_fact( Cond2).                            % Обидва кон’юнкти істинні

composed_fact( Cond1 or Cond2):-
  composed_fact( Cond1) ;
  composed_fact( Cond2).

