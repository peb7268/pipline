define(function(require){
    describe("Pageview Spec", function(){
        Pageview = require('views/Pageview');
        require('jasmine-jquery');
        beforeEach(function(){
           this.pageview = new Pageview;

            window.Agenda = {
                apointment: [],
                contact: [],
                todo: [],
                project: []
            };
            Agenda.tmp = {};
        });

        describe("Pageview is initialized correctly", function(){
            it("pageview should be an object", function(){
                expect(typeof this.pageview).toBe('object');
            });

            it("should be an instance of Pageview", function(){
                expect(this.pageview instanceof Pageview).toBeTruthy();
            });

            it('should be a ul', function(){
                expect(this.pageview.tag).toEqual('ul');
            });

            it('should set el correctly', function(){
                expect(this.pageview.el.nodeName).toEqual('DIV');
                expect(this.pageview.el.id).toEqual('wrapper');
            });

            it('should initialize correctly', function(){
               spyOn(this.pageview, 'initialize').and.callThrough();
               this.pageview.initialize();

               expect(this.pageview.initialize.calls.count()).toEqual(1);
               expect(typeof this.pageview.calendarview).toBe('object');
               expect(typeof this.pageview.agendaview).toBe('object');
            });
        });

        afterEach(function(){
            this.pageview = null;
        });
    });
});
