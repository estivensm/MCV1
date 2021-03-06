window.App || (window.App = {});

App.Base = (function() {
  function Base() {
    if (window.jQuery) {
      this.setClearEventHandlers();
    }
    return this;
  }


  /*
  Run the new action for the create action.  Generally the create action will 'render :new' if there was a problem.
  This prevents doubling the code for each action.
   */

  Base.prototype.create = function() {
    if (typeof $this["new"] === 'function') {
      return $this["new"]();
    }
  };


  /*
  Run the edit action for the update action.  Generally the update action will 'render :edit' if there was a problem.
  This prevents doubling the code for each action.
   */

  Base.prototype.update = function() {
    if (typeof $this.edit === 'function') {
      return $this.edit();
    }
  };


  /*
  Clear event handlers with a blank namespace.  This will prevent window and document event handlers from stacking
  when each new page is fetched.  Adding a namespace to your events will prevent them from being removed between page
  loads, i.e. "$(window).on 'scroll.app', myHandler"
   */

  Base.prototype.setClearEventHandlers = function() {
    return jQuery(document).on('page:before-change', function() {
      var element, event, handler, handlers, i, len, ref, results;
      ref = [window, document];
      results = [];
      for (i = 0, len = ref.length; i < len; i++) {
        element = ref[i];
        results.push((function() {
          var ref1, results1;
          ref1 = jQuery._data(element, 'events') || {};
          results1 = [];
          for (event in ref1) {
            handlers = ref1[event];
            results1.push((function() {
              var j, len1, results2;
              results2 = [];
              for (j = 0, len1 = handlers.length; j < len1; j++) {
                handler = handlers[j];
                if ((handler != null) && handler.namespace === '') {
                  results2.push(jQuery(element).off(event, handler.handler));
                } else {
                  results2.push(void 0);
                }
              }
              return results2;
            })());
          }
          return results1;
        })());
      }
      return results;
    });
  };

  return Base;

})();

// ---
// generated by coffee-script 1.9.2