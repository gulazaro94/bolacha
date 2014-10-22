$(document).ready(function(){
   setTimeout("$('div.message').fadeOut();",4500);
   $('div.message').click(function(){
       $(this).hide();
   });
});