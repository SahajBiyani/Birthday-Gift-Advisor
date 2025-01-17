:- use_module(library(scasp)).
    :- use_module(library(scasp/examples)).

    % Facts about people and their relationships
    person(john).
    person(mary).
    relationship(john, mary, very).
    relationship(mary, john, very).

    % Facts about people's budgets and generosity
    budget(john, 100).
    budget(mary, 200).
    generosity(john, stingy).
    generosity(mary, generous).

    % Facts about gifts and their prices and categories
    gift(book, personal, 20).
    gift(laptop, personal_tech, 500).
    gift(toy, outdoor, 50).
    gift(fitness_band, personal_fitness, 100).
    gift(kettle, kitchen, 30).
    gift(clothes, clothes, 50).
    gift(indoor_plant, indoor_decor, 25).
    gift(gift_card, gift_card, 10).

    % Mother's recommendations
    mother_recommendation(john, book).
    mother_recommendation(mary, fitness_band).

    % Rules for gift recommendations
    recommend_gift(Person, Gift) :-
      relationship(Person, _, Relationship),
      budget(Person, Budget),
      income(Person, Income),
      percentage(Person, Percentage),
      Spendable is (Income * Percentage) / 100,
      Spendable =< Budget,
      mother_recommendation(Person, MotherGift),
      gift(MotherGift, _, MotherPrice),
      MotherPrice =< Spendable,
      Gift = MotherGift.

    recommend_gift(Person, Gift) :-
      relationship(Person, _, Relationship),
      budget(Person, Budget),
      income(Person, Income),
      percentage(Person, Percentage),
      Spendable is (Income * Percentage) / 100,
      Spendable =< Budget,
      industry(Person, Industry),
      gift(Gift, Industry, Price),
      Price =< Spendable.

    % s(CASP) rules for common sense reasoning
    scasp:rule(recommend_gift(Person, Gift) :-
      relationship(Person, _, Relationship),
      budget(Person, Budget),
      income(Person, Income),
      percentage(Person, Percentage),
      Spendable is (Income * Percentage) / 100,
      Spendable =< Budget,
      mother_recommendation(Person, MotherGift),
      gift(MotherGift, _, MotherPrice),
      MotherPrice =< Spendable,
      Gift = MotherGift).

    scasp:rule(recommend_gift(Person, Gift) :-
      relationship(Person, _, Relationship),
      budget(Person, Budget),
      income(Person, Income),
      percentage(Person, Percentage),
      Spendable is (Income * Percentage) / 100,
      Spendable =< Budget,
      industry(Person, Industry),
      gift(Gift, Industry, Price),
      Price =< Spendable).
