attribute( size, [ small, large]).
attribute( shape, [ long, compact, other]).
attribute( holes, [ none, 1, 2, 3, many]).
% �� �������� ��� ��������

example( nut, [ size = small, shape = compact, holes = 1]).
example( key, [ size = large, shape = other, holes =1]).
example( pen, [ size = large, shape = long, holes = none]).
example( scissors, [ size = large, shape = long, holes =2]).
example( key, [ size = large, shape = long, holes =3]).
example( pen, [ size = large, shape = long, holes = none]).
example( scissors, [ size = large, shape = other, holes = 2]).
example( key, [ size = small, shape = other, holes = 2]).

%�������� �� ����� ������� ������ ������
:- op( 300, xfx, <==).

%learn( Class): ������ �������� �������� � ������, ���������� � �������
%  ���� ��� ����� Class, ���� ������ � ���� ����� ��������
%  �������, �� ��������� ����� Class
learn( Class) :-
   %ǳ����� ��������
   bagof(example(ClassX, Obj), example(ClassX,Obj), Examples),
   learn( Examples, Class, Description),             % ���������� �������
   nl, write( Class), write('  <== '), nl,           % ������� �������
   writelist( Description),
   assert( Class <== Description).         % ������ ������� � ���� �����

% learn( Examples, Class, Description):
% ���� Description ������� ����� �� �������� ��. Class � ������ Examples
learn( Examples, Class, []) :-
   % ���� ��������, �� ������� ���� � ������� ������
   not( (member( example(Class,_), Examples))).

learn( Examples, Class, [Conj | Conjs]) :-
   learn_conj( Examples, Class, Conj),
   % �������� ��������, �� ���������� ���� Conj
   remove( Examples, Conj, RestExamples),
   learn( RestExamples, Class, Conjs).      % ������� ������ ���� ��������

%learn_conj( Examples, Class, Conj):
% Conj - �� ������ ������� ��������, ����� ���������� ����
% �������� ����� Class � �� ������� ����� ������� ������� ������ �����
learn_conj( Examples, Class, []) :-
   not( (member( example( ClassX ,_), Examples), % ���� �������� �������
         ClassX \== Class )), !.                 % ������ �����

learn_conj( Examples, Class, [Cond | Conds]):-
   choose_cond( Examples, Class, Cond),          % ������� �������� ��������
   filter( Examples, [ Cond], Examples1),
   learn_conj( Examples1, Class, Conds).

choose_cond( Examples, Class, AttVal):-
  findall( AV/Score, score( Examples, Class, AV, Score), AVs),
  best( AVs, AttVal).                      % ������� � ��������� �������

best( [ AttVal/_], AttVal).
best( [ AV0/S0, AV1/S1 | AVSlist], AttVal):-
   S1  >  S0, !,               % ������� AV1 �� ����� ������, �� AV0
   best( [AV1/S1 | AVSlist], AttVal)
   ;
   best( [AV0/S0 | AVSlist], AttVal).

%filter( Examples, Condition, Examples1) :
% ������ Examplesl ������ �������� ������ Examples, �� ����������
% ���� Condition
filter( Examples, Cond, Examples1):-
  findall( example( Class, Obj),
           ( member( example( Class, Obj), Examples), satisfy( Obj, Cond)),
           Examples1).

% remove( Examples, Conj, Examples1):
%   ��������� � ������ Examples ��� ��������, �� ������� ������ Conj,
%   � ��������� ������ Examplesl
remove( [], _, []).

remove( [example(Class, Obj) | Es], Conj, Es1):-
   satisfy(Obj, Conj), !,        % ������ ������� ������� ���� Conj
   remove( Es, Conj, Es1).       % �������� ����

remove( [E | Es], Conj, [E | Es1]):- % �������� ������ ������� � ������
    remove( Es, Conj, Es1).

satisfy(Object, Conj) :-
   not( (member( Att = Val, Conj) ,
         member( Att = ValX, Object) ,
         ValX \== Val) ).

score( Examples, Class, AttVal, Score) :-
  candidate( Examples, Class, AttVal),      % ϳ������� �������� ��������
  filter( Examples, [ AttVal], Examples1),  % �������� � ������ Examplesl
                                            %���������� ���� Att = Val
  length(Examples1, N1),              % ������� ������
  count_pos( Examples1, Class, NPos1), % ʳ������ ���������� ��������
  NPos1 > 0,                           % ���������� ���� ����������
                                       % ������� ������� �������� AttVal
  Score is 2 * NPos1 - N1.

candidate(Examples, Class, Att = Val) :-
  attribute( Att, Values),             % �������
  member( Val, Values),                % ��������
  suitable( Att = Val, Examples, Class).

suitable( AttVal, Examples, Class):-
 % ���������� ���� ���������� ������� �� ������� ��������� ����. AttVal
   member( example( ClassX, ObjX), Examples),
   ClassX \== Class,                     % ���������� �������, ��
   not( satisfy( ObjX, [ AttVal])), !.   % �� ������� �������� AttVal

% count_pos( Examples, Class, N):
%   N - ������� ���������� �������� ����� Class
count_pos( [], _, 0).

count_pos( [example( ClassX,_ ) | Examples], Class, N):-
   count_pos( Examples, Class, N1),
   ( ClassX = Class, !, N is N1 + 1; N = N1 ).

writelist( []).
writelist( [X | L]):-
  tab( 2),   write(  X), nl,
  writelist( L).
