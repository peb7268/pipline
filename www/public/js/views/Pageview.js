define([
    'backbone',
    'text!templates/content.html',
    'text!templates/calendarTpl.html',
    'views/CalendarView',
    'views/AgendaView',
    'services/CalendarService'
    ],
    function(Backbone, content, calendarTpl, CalendarView, AgendaView, CalendarService){
        window.Agenda = {
            apointment: [],
            contact: [],
            todo: [],
            project: []
        };
        Agenda.tmp = {};
        var that,
            calendar;

        var Pageview = Backbone.View.extend({
            el: '#wrapper',
            tag: 'ul',
            events: {
                "keyup #agenda li:nth-child(2) input" : 'showControls',
                "keyup #content .active .details": 'captureDetails',
                "click #agenda li a.remove": 'inactivateElem',
                "click #clearCompleted": 'clearCompleted',
                "click .save": 'saveItem',
                "click .day" : 'selectDay',
                "click #daySelector .date": 'resetDay',
                "click #daySelector .next": 'incrementDay'
            },

            initialize: function(){
                that = this;
                this.calendarview = new CalendarView({});
                window.d = new Date();
                calendar = this.calendar = new CalendarService();
                this.agendaview   = new AgendaView({});

                calendar.setDay(d.getDay());
                calendar.setDaysInMonth();
                calendar.setSelectedDay(d.getDay() - 1);
            },

            render: function(){
                var listTemplate    = _.template(content, {});
                var calTemplate     =  _.template(calendarTpl, window.calendar);


                this.$el.prepend(content);
                this.$el.find('#calWrapper').append(calTemplate);
            },

            captureTarget: function(event){
                return $(event.target).attr('href');
            },

            showControls: function(e) {
                var that = this;
                e.preventDefault();
                if(e.which == 13) $('#controls').slideDown(100, function(){
                    $(this).find('li:first a').focus();
                });
                this.$el.find('#controls').on('click', function(event){
                    event.preventDefault();
                    var id = that.captureTarget(event);
                    that.populateView(event, id);
                    that.animate(id);
                });
            },

            captureDetails: function(e){
                e.preventDefault();
                if(e.which == 13 && event.shiftKey){ this.saveItem(e); }
            },

            saveItem: function(e){
                e.preventDefault();
                var $active = $('.active');
                agendaview.attatchToList($('#agenda'));
                this.animateOut($active);
                $('#addAnItem').focus();
                this.clearPrevious($active);
                //Slide back in calendar
                this.animateIn('#calWrapper');
                //put actual saving logic here
            },

            clearCompleted: function(e){
                e.preventDefault();
                var $completes = $('.completed');
                $.each($completes, function(idx, elem){
                    $(elem).slideUp(100, function(){
                        $(this).remove();
                    });
                });
                $('#clearCompleted').fadeOut(100, function(){
                    $('#addAnItem').focus();
                });
            },

            inactivateElem: function(e){
                e.preventDefault();
                var $parent = $(e.target).parent();
                $parent.addClass('completed').append($('<span />'));

                $parent.find('span').animate({
                    width: '90%'
                });

                $('#clearCompleted').show().css('display', 'block');
            },

            /**
             * Prepopulates the details field in the content pane.
             * @param event
             * @param id
             */
            populateView: function(event, id){
                var $input = $('#agenda li:nth-child(2)').find('input[type="text"]');
                var val    = String($input[0].value);
                $(id).find('input#apt_name').val(val);
            },

            animate: function(id){
                var $active = $('.active', '#content');
                this.animateOut($active);
                this.animateIn(id);
            },

            animateIn: function(id){
                $('#controls').slideUp(100, function(){
                    $('#agenda li:first').find('input[type="text"]').val('');
                });

                $(id).animate({
                    'left': 0
                }, 100, function(){
                    $(this).addClass('active');
                    $('.details', id).show().focus();
                });
            },

            animateOut: function($active){
                var $input = $('#agenda li:first').find('input[type="text"]');
                $active.removeClass('active').animate({
                    'left': '105%'
                },{
                    duration: 100,
                    queue: false,
                    complete: function(){
                        $active.removeAttr('style');
                        $active.removeAttr('class');
                    }
                });
            },

            clearPrevious: function($active){
                $active.find('textarea, input').each(function(i, elem){
                    $(elem).prop('');
                    $(elem).val('');
                });
            },

            selectDay: function(e){
                calendar.selectDay(e);
            },

            incrementDay: function(e){
                debugger;
                calendar.incrementDay(calendar.current.selected_day);
            },

            resetDay: function(e){
                calendar.resetDay();
            }
    });

    return Pageview;
});