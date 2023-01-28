/**
 * 
 */
$(function(){
  $('.tabcontent > div').hide();
  $('.tabs a').click(function () {
    $(this).addClass("on").siblings().removeClass("on");
    $('.tabcontent > div').hide().filter(this.hash).fadeIn();
    $('.tabs a').removeClass('on');
    $(this).addClass('on');
    return false;
  }).filter(':eq(0)').click();
  });