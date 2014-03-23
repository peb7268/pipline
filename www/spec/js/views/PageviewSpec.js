define(function(require){
    describe("Pageview Spec", function(){
        Pageview = require('views/Pageview');
        beforeEach(function(){
           pageview = null;
           pageview = new Pageview;
        });

        it("pageview should be an object", function(){
            expect(typeof pageview).toBe('object');
        });

        it("should be an instance of Pageview", function(){
            expect(pageview instanceof Pageview).toBeTruthy();
        });


    });
});
