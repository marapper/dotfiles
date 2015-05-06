/*jslint browser: true, eqeq:true, indent: 4*/
/*jshint bitwise:true, camelcase:true, curly:true, eqeqeq:true, forin:true, noarg:true, noempty:true, nonew:true, undef:true, strict:true, indent:4, laxcomma:true, browser:true, jquery:true */
/*global GttPamm6, jQuery, _ */

//TODO checkboxgroup?
(function(win, app, $, _){
    "use strict";

    app.defineClass('View.${FILE_NAME}', app.View.View.extend(
        {
            events: {
                'change .item input': '_onChange'
            },

            _classes: {
                
            },

            initialize: function() {
                this._super();
            },

            render: function() {
                var me = this,
                    template = app.getTemplateService().renderTemplate(me._getTemplateName(), {component: me.model});

                me.$el.empty().html( template );
            }
        },
        {

        }
    ));

}(window, GttPamm6.Rating, jQuery, _));