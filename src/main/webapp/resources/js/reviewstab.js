/**
 * 
 */
$(function(){
  $('.tabcontent > section').hide();
  $('.tabs a').click(function () {
    //$('#').addClass("on").siblings().removeClass("on");
    $('.tabcontent > section').hide().filter(this.hash).fadeIn();
    $('.tabs li').removeClass('on');
    $(this).parent('li').addClass('on');
    return false;
  }).filter(':eq(0)').click();
  });