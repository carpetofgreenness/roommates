$("document").ready(function(){

	// when user clicks an option, add it to the form and submit
	$(".item-area").children(":not('.badge')").click(function(event){
		var x = event.target.id.toString()
		// console.log(event.target.nodeName)
		// console.log(x)
		$("#"+x+".item-info").toggle();
	})

	$(".glyphicon-pencil").click(function(event){
		console.log(event.target.nodeName)
	})
})
function setTwoNumberDecimal(el) {
	el.value = parseFloat(el.value).toFixed(2);
};