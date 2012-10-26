Records
==
#### A little showcase app to compare writing tests/specs with OCUnit (TDD) vs. Specta (BDD).

#### TL;DR

Compare these two files:

* [https://github.com/sens3/records/blob/master/Records/RecordsTests/RecordViewControllerTests.m](https://github.com/sens3/records/blob/master/Records/RecordsTests/RecordViewControllerTests.m)
* [https://github.com/sens3/records/blob/master/Records/RecordsTests/RecordViewControllerSpec.m](https://github.com/sens3/records/blob/master/Records/RecordsTests/RecordViewControllerSpec.m)

and decide for yourself which one you like better.


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

If you leave the philosophical differences between TDD and BDD aside, the one huge benefit of using something like Specta is that it allows you to easily organize and group your tests (or "specs"). 

So, instead of having to keep all information in just the test method name

	- (void)test_RecordListVC_viewDidLoad_setsTheTableViewDelegate
	
you can group your tests like

	describe(@"RecordListViewController", ^{
	    
	    before(^{
	    	// stuff I need for all tests
	    });
	    
	    describe(@"viewDidLoad", ^{
        	before(^{
	    		// stuff I only need for this sub group of tests
	    	});
	    	
        	it(@"sets the table view delegate", ^{
            	// assert things here
        	});
        });
    });    	

Which makes it much easier to navigate through your specs and identify what is being tested where. 

Also, as you can see in the example above, you can have a _before_ method (similar to _setup_ in OCUnit) for each _describe_ block (meaning for each group of tests).

This allows you do exactly the setup you need for an individual group of tests.

In OCUnit you could have either just put everything in the setup method (not always possible if you have competing values for a variable) or create a seperate TestCase for a group of tests.

Github: [https://github.com/petejkim/specta](https://github.com/petejkim/specta)

#### Expecta

Expecta is a Matcher framework. If you look at the specs, Expecta is what allows you to write things like 
		
	expect(@foo).to.equal(@"bar")

instead of
	
	STAssertEqualObjects(@foo, @"bar", nil);
		
There are alternatives, but this is written by the same guy who wrote Specta (who'd have guessed, right?) so I just rolled with it.    

Github: [https://github.com/petejkim/expecta](https://github.com/petejkim/expecta)

#### OCMockito

A Mocking framework alternative to OCMock.

Pros: nicer syntax

Cons: no partial mocks

Github: [https://github.com/jonreid/OCMockito](https://github.com/jonreid/OCMockito)


