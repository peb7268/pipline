define(['backbone', 'text!templates/partials/list.html', 'text!templates/partials/content.html', 'text!templates/calendarTpl.html'], function(Backbone, listTpl, agendaTpl, calendarTpl){
    window.Agenda = {
        apointment: [],
        contact: [],
        todo: [],
        project: []
    };
    Agenda.tmp = {};

    //Mock up the cal object
    window.calendar = {
        day_names: ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'],
        prev: {},
        current: {
            days_of_month: _.range(1, 30 + 1),
            today: 3,
            selected_day: 3,
            day_name: 'Thursday',
            year: 2014
        },
        next: {},

        isToday: function(day){
            return (day == calendar.current.today) ? 'today' : '';
        },

        lookupNameOfDay: function(day){
            return day % calendar.day_names.length;
        }
    };


    var Pageview = Backbone.View.extend({
        el: '#wrapper',
        tag: 'ul',
        events: {
            "keyup #agenda li:nth-child(2) input" : 'showControls',
            "keyup #content .active .details": 'captureDetails',
            "click #agenda li a.remove": 'inactivateElem',
            "click #clearCompleted": 'clearCompleted',
            "click .save": 'saveItem'
        },

        render: function(){
            var listTemplate    = _.template(listTpl, {});
            var agendaTemplate  = _.template(agendaTpl, {});
            var calTemplate     =  _.template(calendarTpl, window.calendar);


            this.$el.append(listTemplate);
            this.$el.append(agendaTemplate);
            this.$el.find('#calWrapper').append(calTemplate);
        },

        captureTarget: function(event){
            return $(event.target).attr('href');
        },

        showControls: function(e) {
            var that = this;
            e.preventDefault();
            if(e.which == 13) $('#controls').slideDown(100);
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
            this.attatchToList($('#agenda'));
            this.animateOut($active);
            $('#addAnItem').focus();
            this.clearPrevious($active);
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

        attatchToList: function ($list){
            var elem = this.buildDataFromContent();
            var li 	  = '<li>' + elem.value + '<a href="#' + elem.name + '" class="remove">x</a></li>';
            $list.append(li)
        },

        buildDataFromContent: function(){
            var inputs = $('input, textarea', '#content .active');
            $.each(inputs, function(idx, elem){
                var name = $(elem).attr('id');
                var val  = $(elem).val();
                var kind = Agenda.tmp.kind = $(this).parent().parent().attr('id');

                Agenda[kind].push({
                    name: name,
                    value: val
                });
            });

            var kind = Agenda.tmp.kind;

            return (Agenda[kind].length > 1) ? Agenda[kind][Agenda[kind].length - 2] : Agenda[kind][Agenda[kind][0]];
        },

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
    });

    return Pageview;
});