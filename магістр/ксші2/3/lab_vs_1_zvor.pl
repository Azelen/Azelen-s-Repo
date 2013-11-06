% Автор:
% Дата: 21.10.2011

:- op( 800, fx,  if).
:- op( 700, xfx, then).
:- op( 300, xfy, or).
:- op( 200, xfy, and).

:- dynamic fact/1.              % можливість додавати нові факти в БД

fact(error(detection_mc)).
fact(mc_file_system(not_supported)).
fact(read_mc(error)).
fact(not_identify(disc)).
fact(recording_on_disc(not_installed)).
fact(disk(reading_error)).

if error(detection_mc) then verify_installation_mc.
if mc_file_system(not_supported) then use_fat_12_16_32.
if read_mc(error) then set_other_mc.
if not_identify(disc) then check_the_quality_of_the_disc.
if recording_on_disc(not_installed) then make_sure_that_disc_is_rewritable.
if disk(reading_error) then disc_is_damaged.

is_true( P):-
   fact( P).
is_true( P):-
   if Condition then P,  %P підходяще правило, умова якого є істинною
   is_true( Condition).
is_true( P1 and P2) :-
   is_true( P1) , is_true( P2).
is_true( P1 or P2) :-
   is_true( P1) ; is_true( P2).


