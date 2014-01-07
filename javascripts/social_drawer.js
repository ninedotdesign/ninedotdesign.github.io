$(document).ready(function(){
  		jQuery('.social-drawer').hide();
		
		var soc = jQuery('.social-box');
		// var offset = p.offset();

		
		var hoverOrClicksocial = function() {	

			if( !jQuery('.social-drawer').is(':visible') ){
						jQuery('.social-drawer').show();
						jQuery('.social-box').css('background-position', '0px -50px')
					} else {
						jQuery('.mobile .social-drawer').hide(); 
						jQuery('.mobile .social-box').css('background-position', '0 3px' );
					}
			}

		jQuery(soc).click(hoverOrClicksocial).hover(hoverOrClicksocial);

		
		jQuery('.social-drawer').mouseleave(function(){ //reset drawers
			jQuery(this).hide();
			jQuery('.social-box').css('background-position', '0 3px' );
		});


	jQuery('.home .share-wrap, .archive .share-wrap, .search .share-wrap').mouseenter(function(e) {
		elmt = '#' + jQuery(this).attr("id") + ' .mr_social_sharing_wrapper'; 
		jQuery(elmt).show(); //alert(elmt);
		}).mouseleave(function(){

		jQuery(elmt).hide();	
	});

});
