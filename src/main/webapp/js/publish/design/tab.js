// tab contents
$(document).ready(function() {
	
//    $('.tab_content:first-child').show();
    $('.tab_tit').bind('click', function(e) {
    	
        $this = $(this);
        $tabs = $this.parent().next();
        $target = $($this.data("target")); // get the target from data attribute
        $this.siblings().removeClass('current');
        $this.siblings().removeClass('first');
        $target.siblings().css("display", "none")
        $this.addClass('current');
        $target.fadeIn("fast");
    });
    $('.tab_tit.first').trigger('click');
  
});