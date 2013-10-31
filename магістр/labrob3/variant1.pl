%% Author: Grogoriy
%% Date: 05.10.2006

% Лабораторна робота № 3 Варіант 1
% Простий інтерпретатор зворотного логічного виводу для правил виводу
:- op(800, fx,  if).
:- op(700, xfx, then).
:- op(300, xfy, or).
:- op(200, xfy, and) .

%задаємо БД у вигляді правил виводу
if powerled_on      then  switch_is_plugged_in.    %1
if powerled_off     then  linefeed_is_incorrect.   %2
if sysled_blinking  then  cpu_is_on.               %3
if sysled_on  or sysled_off  then cpu_is_outoforder.  %4
if link_on          then port_is_plugged_in.       %5
if link_off         then  port_has_no_connection.   %6
if link_blinking    then  port_transmits_data.      %7

%
if switch_is_plugged_in and port_has_no_connection then network_is_down

%facts
:- dynamic fact/1.

%fact(powerled_on).
        fact(powerled_off).
fact(sysled_on).
fact(link_on).            %fact(link_off).


is_true(P):-
   fact(P).
is_true(P):-             % P звязана, Condition - вільна
   if Condition then P,   % P - звяПідходяще правило, умова якого є істинною
   is_true(Condition).

is_true(P1 and P2) :-
   is_true( P1), is_true( P2).

is_true( P1 or P2) :-
   is_true( P1) ; is_true( P2).

