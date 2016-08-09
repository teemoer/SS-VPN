stap.order_cancel = function(dom, ops){

	var inputs = {
		order_id: dom.data('id'),
		action: 'order.cancel'
	}

	if( !/[\d]{6}/.test( inputs.order_id ) ){
		return mtips('订单号错误');
	}

	if(window.confirm('确定取消该订单？注意：该订单已使用的优惠券和TB都将无法收回')){

		member_ajax(inputs, function(data){
			dom.parent().parent().slideDown().remove()
		})

	}

}