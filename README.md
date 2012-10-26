Records
==
#### A little showcase app to compare writing tests/specs with OCUnit (TDD) vs. Specta (BDD).

### Setup

Please run __pod install__ before building the app.

### Where to find them

* Folder __RecordsTests__ holds the OCUnit tests.
* Fodler __RecordsSpecs__ holds the Specta specs.

### How to run them seperately (if you want to)

* Scheme __RecordsTests__ will _only_ run the OCUnit tests.
* Scheme __RecordsSpecs__ will _only_ run the Specta specs.

### More Info

#### Specta

Specta is a BDD Framework very similar to Cedar (by Pivotal) or Kiwi. All of these were heavily influenced by RSpec, a Ruby BDD framework.

Github: [https://github.com/petejkim/specta](https://github.com/petejkim/specta)

#### Expecta

Expecta is a Matcher framework. If you look at the specs, Expecta is what allows you to write things like 
		
		expect(@foo).to.equal(@"bar")
		
There are alternatives, but this one is written by the same guy that wrote Specta (you'd have guessed, right?) so I rolled with this one.    

Github: [https://github.com/petejkim/expecta](https://github.com/petejkim/expecta)

#### OCMockito

A Mocking framework alternative to OCMock.

Pros: nicer syntax

Cons: no partial mocks

Github: [https://github.com/jonreid/OCMockito](https://github.com/jonreid/OCMockito)


