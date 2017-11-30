$(document).on('turbolinks:load', function(){

    $('.carousel').carousel({
        interval: false
    }); 
    
    var carousel_items = $('.carousel .item');
      carousel_items.each(function(){
        var next = $(this).next();
        
        if (!next.length) {
          next = $(this).siblings(':first');
        }
        
        next.children(':first-child').clone().appendTo($(this));
        
          for (var i=0;i<2;i++) {
            next=next.next();
            
            if (!next.length) {
            	next = $(this).siblings(':first');
          	}
            
            next.children(':first-child').clone().appendTo($(this));
          }

      });
    
});
