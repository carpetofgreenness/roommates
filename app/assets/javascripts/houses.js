document.addEventListener("turbolinks:load", function() {
	// when user clicks an option, add it to the form and submit
	$(".item-area").click(function(event){
		
		var x = event.target.id.toString()
		// console.log(event.target.nodeName)
		// console.log(x)
		$("#"+x+".item-info").toggle();
	})

	// $(".item-area").on('click', ':not(.badge)', function (event) {
	//      event.stopPropagation()
	// 	var x = event.target.id.toString()
	// 	// console.log(event.target.nodeName)
	// 	// console.log(x)
	// 	$("#"+x+".item-info").toggle();
	// });

	$("#delete-item").click(function(event){
		event.stopPropagation();
	})
	$("#unshare").click(function(event){
		event.stopPropagation();
	})
	$("#share").click(function(event){
		event.stopPropagation();
	})

	$("#myTab li:eq(0) a").tab('show');

	if ($('#error-section').length > 0) {
		$("new_item").modal('toggle');
	}
})

// $("document").on('turbolinks:load',function(){

// })
function setTwoNumberDecimal(el) {
	el.value = parseFloat(el.value).toFixed(2);
};