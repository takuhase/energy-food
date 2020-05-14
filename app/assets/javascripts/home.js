$(document).on('turbolinks:load', function() {
  $('#food-scroll > a[href^="#"]').click(function(){
    var speed = 500;
    var href= $(this).attr("href");
    var target = $(href == "#" || href == "" ? 'html' : href);
    var position = target.offset().top;
    $("html, body").animate({scrollTop:position}, speed, "swing");
    return false;
  });

  $('[name="daily_food_ids[]"]').change(function(){
    var aryPrice = [];
    $('[name="daily_food_ids[]"]:checked').each(function(index, element){
      var targetId = ($(element).val());
      aryPrice.push($(".select-menu-" + targetId).find('.alacarte_price').text());
    });
    aryPrice = aryPrice.map(Number);
    var totalPrice = 0;
    for (var i = 0; i < aryPrice.length; i++) {
      totalPrice += aryPrice[i] << 0;
    }
    $('#calculate-total-price').html(totalPrice);
  });
});
