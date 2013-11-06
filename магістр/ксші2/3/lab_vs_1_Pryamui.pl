% �����:  ���� �.�.
% ����: 29.10.2013

:- op( 800, fx,  if).
:- op( 700, xfx, then).
:- op( 300, xfy, or).
:- op( 200, xfy, and).

:- dynamic fact/1.              % ��������� �������� ��� ����� � ��

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


forward :-
  new_derived_fact( P),        % ����� ��������� ����
  !,
  write( 'Derived: '), write(P), nl,
  assert( fact( P)),          % ������ ����� ���� � ��
  forward                     % ���������� ������
  ;
  write( 'No more facts').    % ������ ���������� ������ ����������

new_derived_fact( Conc1):-
  if Cond then Conc1,          % ����� �������
  not( fact( Conc1)),          % �������� ������� �� �� � ������ ��
  composed_fact( Cond).        % ������� ��������� �����

composed_fact( Cond):-
  fact( Cond).                     % ������� ���� � ��
composed_fact( Cond1 and Cond2):-  % ����� ����� ������ - ������ �
  composed_fact( Cond1),
  composed_fact( Cond2).
composed_fact( Cond1 or Cond2):-   % ���� � ���� ������� - ������ ���
  composed_fact( Cond1);
  composed_fact( Cond2).


