:- use_module(library(scasp)).
    :- use_module(library(scasp/examples)).

    % Facts about people and their relationships
    person(john).
    person(mary).
    relationship(john, mary, close).
    relationship(mary, john, close).

    % Facts about people's budgets and generosity
    budget(john, 100).
    budget(mary, 200).
    generosity(john, stingy).
    generosity(mary, generous).

    % Facts about gifts and their prices
    gift(book).
    gift(laptop).
    gift(toy).
    price(book, 20).
    price(laptop, 500).
    price(toy, 50).

    % Rules for gift recommendations
    recommend_gift(Person, Gift) :-
      relationship(Person, _, close),
      budget(Person, Budget),
      generosity(Person, generous),
      price(Gift, Price),
      Price =< Budget.

    recommend_gift(Person, Gift) :-
      relationship(Person, _, close),
      budget(Person, Budget),
      generosity(Person, stingy),
      price(Gift, Price),
      Price =< Budget,
      Price < 100.

    % s(CASP) rules for common sense reasoning
    scasp:rule(recommend_gift(Person, Gift) :-
      relationship(Person, _, close),
      budget(Person, Budget),
      generosity(Person, generous),
      price(Gift, Price),
      Price =< Budget).

    scasp:rule(recommend_gift(Person, Gift) :-
      relationship(Person, _, close),
      budget(Person, Budget),
      generosity(Person, stingy),
      price(Gift, Price),
      Price =< Budget,
      Price < 100).
