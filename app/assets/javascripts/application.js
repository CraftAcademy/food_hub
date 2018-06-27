// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require_tree .


var timesFunction = function(callback) {
    if (typeof callback !== "function" ) {
      throw new TypeError("Callback is not a function");
    } else if( isNaN(parseInt(Number(this.valueOf()))) ) {
      throw new TypeError("Object is not a valid number");
    }
    for (var i = 0; i < Number(this.valueOf()); i++) {
      callback(i);
    }
  };

  String.prototype.times = timesFunction;
  Number.prototype.times = timesFunction;
