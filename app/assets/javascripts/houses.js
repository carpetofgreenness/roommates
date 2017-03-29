$("document").ready(function(){

	// when user clicks an option, add it to the form and submit
	$(".list-group-item").click(function(event){
		var x = event.target.id.toString()
		console.log("the number is " + x)
		$("#item-info"+x).toggle();
	})
})