

%������������� ���������� ����� � ������ �����
isa( bird, animal).           %���� - �� �������
isa( kiwi, bird).
isa( albatross, bird).
isa( ross, albatross).        %���� - ���������
isa( kim, kiwi).
isa( albert, bird).

moving_method( bird, fly).    %����� ����������� ������ - ����
moving_method( kiwi, walk) .  %����� ����������� �� - ������


fact(Fact) :-    % ����-�� �����;  Fact = Rel(Argl, Arg2)
  Fact, !.       % ���� ������� � ����� ���� -����������� �� �������
fact(Fact):-
  Fact =.. [ Rel, Arg1, Arg2],		% ������������ ��������� � ������ ���������
  isa(Arg1, SuperArg),            	% ��������� �� �������� isa
  SuperFact  =.. [ Rel, SuperArg, Arg2],
  fact( SuperFact) .
