// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
import "bootstrap"

Rails.start()
Turbolinks.start()
ActiveStorage.start()


window.scroll_bottom = function()
{
  if($('#messages').length > 0)
  {
    $('#messages').scrollTop($('#messages')[0].scrollHeight);
  }
}
// scroll_bottom = function()
// {
//   if($('#message').length > 0)
//   {
//     $('#message').scrollTop($('#message')[0].scrollHeight);
//   }
// }

window.submit_message = function()
{
  $('#message_body').on('keydown', function(e){
    if(e.keyCode == 13)
    {
      $('button').click();
      e.target.value = '';
    }
  });

  $('#send_btn').on('click', function(){
    $('#message_body').value = "";
  });
}

$(document).on('turbolinks:load', function(){
  $('.ui.dropdown').dropdown();

  $('.message .close').on('click', function() {
    $(this)
    .closest('.message')
    .transition('fade');
  });

//   submit_message();
  // $('#message').append(data.message);
  scroll_bottom();    //Everytime Page loads
  // alert("We made it!");

  // $('#message_body').on('click', function(e){
  //     e.target.value = '';
  // });
})

$(document).ready(function(){
    // $('.navbar .dropdown').click(function() {
    //     $(this).find('.dropdown-menu').first().stop(true, true).delay(250).slideDown();
    // }, function() {
    //     $(this).find('.dropdown-menu').first().stop(true, true).delay(100).slideUp()
    // });
    $('.navbar .dropdown').hover(function() {
        $(this).find('.dropdown-menu').first().stop(true, true).delay(250).slideDown();
    }, function() {
        $(this).find('.dropdown-menu').first().stop(true, true).delay(100).slideUp()
    });
})

