/*! themebetter.com/member */


// INSERT TO TBUI

TBUI.MEMBER_AHAX_URL = TBUI.URL+'/action/member'

TBUI.ALLOWTYPES = ['image/jpeg', 'image/jpg', 'image/png', 'image/gif']


// require(['pjax'], function (){
// 	$(document).pjax('#jaxcontainer a[target!="_blank"]', '#jaxcontainer', {
// 		// timeout: 650
// 	})
// })






// MEMBER ROUTE

if (TBUI.bd.hasClass('page-member-workorder-new') || TBUI.bd.hasClass('page-member-workorder')) {
    require(['member-workorder'])
} 
else if (TBUI.bd.hasClass('page-member-orders')) {
    require(['member-orders'])
} 
else if (TBUI.bd.hasClass('page-member-order')) {
    require(['member-order'])
} 
else if (TBUI.bd.hasClass('page-member-order-take')) {
    require(['member-order-take'])
} 
else if (TBUI.bd.hasClass('page-member-info')) {
    require(['member-info'])
} 
else if (TBUI.bd.hasClass('page-member-password')) {
    require(['member-password'])
}






// MEMBER TIPS

var _tip_timer
function mtips(str) {

    if (!str) return false

    _tip_timer && clearTimeout(_tip_timer)

    if( !$('.user-tips').length ){
        $(TBUI.bd).append( '<div class="user-tips"></div>' )
    }

    var _tip_dom = $('.user-tips')

    _tip_dom.html(str).css({
        'margin-left': (_tip_dom.width()/2+30)*-1,
        'margin-top': (_tip_dom.height()/2+20-40)*-1,
    }).animate({
        'margin-top': (_tip_dom.height()/2+20)*-1,
        'opacity': 0.8
    }, 300)

    _tip_timer = setTimeout(function() {

        _tip_dom.html(str).animate({
            'margin-top': (_tip_dom.height()/2+20-40)*-1,
            'opacity': 0
        }, 300, function(){
            _tip_dom.remove()
        })

    }, 3000)

}





// MEMBER AJAX

function member_ajax(inputs, success_fn, error_fn){
	$.ajax({  
	    type: 'POST',  
	    url:  TBUI.MEMBER_AHAX_URL,  
	    data: inputs,  
	    dataType: 'json',
	    success: function(data){  

	    	if( data.msg ){
                mtips(data.msg)
            }

	        if( data.error ){
	        	if( error_fn ) error_fn(data)
	            return
	        }

	        if( success_fn ) success_fn(data)
	    },
		error: function(data){
			mtips('服务器异常，请稍候再试')
		}
	});  
}
