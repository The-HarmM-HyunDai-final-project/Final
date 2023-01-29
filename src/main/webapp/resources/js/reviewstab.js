/**
 * 
 */
$(function(){
  $('.tabcontent > section').hide();
  $('.tabs a').click(function () {
  
    $('.tabcontent > section').hide().filter(this.hash).fadeIn();
    $('.tabs li').removeClass('on');
    $(this).parent('li').addClass('on');
    return false;
  }).filter(':eq(0)').click();
  
  
  
  $('.btn-fold').click(function () {

	  $('.fold-cont').removeClass('open');
	  $('.list-content li').removeClass('on');
	  $(this).parents('li').addClass('on');
	  $(this).parents('li').find('.fold-cont').addClass('open')
  }).filter(':eq(0)').click();
  
  
  
  });