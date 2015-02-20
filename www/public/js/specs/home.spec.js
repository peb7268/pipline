describe('protractor examples', function() {
    it('basic commands', function() {
        browser.get('/#/');

        browser.pause(); //enter c to continue or repl to enter interactive mode like pry.bindings

        //Finding elements
        element(by.css('.some-class')); //or $('my-css');
        element(by.id('someName'));

        expect(browser.getTitle()).toEqual('Pipeline | Elevate your time management');
    });
});