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
//= require turbolinks
//= require_tree .
//= require jquery3
//= require jquery.remotipart
//= require popper
//= require bootstrap-sprockets
$(document).on('turbolinks:load', function() {
  $('form').on('click', '.remove_record', function(e) {
    $(this).prev('input[type=checkbox]').prop('checked', true);
    $(this).closest('p').hide();
    return e.preventDefault();
  });
  $('form').on('click', '.add_fields', function(e) {
    var regexp;
    var time;
    time = new Date().getTime();
    regexp = new RegExp($(this).data('id'), 'g');
    $('.fields').append($(this).data('fields').replace(regexp, time));
    return e.preventDefault();
  });
  $('#album-info').click(function() {
    $.ajax({
      url: 'https://jsonplaceholder.typicode.com/albums',
      datatype: 'json',
      success: function(result) {
        var source = $('#entry-template').html();
        var template = Handlebars.compile(source);
        var album = {album: result}
        $('#album').html(template(album));
        // $.each(result, function(index, album) {
        //   $('#album').append(template(album));
        // });
      }
    });
  });
  $('#doc-modal-submit').click(function() {
    // e.preventDefault();
    $('#docModal').modal('hide');
    // window.location.reload(true);
    // return false;
  })

});
