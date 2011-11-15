$(document).ready(function() {
  load_editors();
});
function load_editors(){
  $('.editor').tinymce({
    //removed settings to keep it short.
    theme: "advanced",
    mode: "textareas",
    theme_advanced_toolbar_location : "top",
    theme_advanced_toolbar_align : "left", 
    theme_advanced_statusbar_location : "bottom"
  });
}