

%представлення семантичної мережі у вигляді фактів
isa( bird, animal).           %Птах - це тварина
isa( kiwi, bird).
isa( albatross, bird).
isa( ross, albatross).        %Росс - альбатрос
isa( kim, kiwi).
isa( albert, bird).

moving_method( bird, fly).    %Спосіб пересування птахів - політ
moving_method( kiwi, walk) .  %Спосіб пересування ківі - ходьба


fact(Fact) :-    % Факт-не змінна;  Fact = Rel(Argl, Arg2)
  Fact, !.       % Факт заданий у мережі явно -наслідування не потрібно
fact(Fact):-
  Fact =.. [ Rel, Arg1, Arg2],		% перетворення відношення в список аргументів
  isa(Arg1, SuperArg),            	% Сходження по ієрархії isa
  SuperFact  =.. [ Rel, SuperArg, Arg2],
  fact( SuperFact) .
