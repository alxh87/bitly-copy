$(document).ready(function() {
    $('.onefeature').mouseenter(function() {
        $(this).fadeTo('fast', 1);
    });
    $('.onefeature').mouseleave(function() {
        $(this).fadeTo('fast', 0.5);
    });

    $('.pull-me').click(function(){
        $('.details').slideToggle(3000);
        $('.background').slideToggle(3000);
    });    



     $('.menu').accordion({collapsible: true, active: false});

    $('#urlbox').on("submit", function(event){
    	event.preventDefault();
    	$.ajax({
    		url: "/urls",
    		method: "post", 
    		// data: {long_url: $(this).children().first().val() },
    		data: $(this).serialize(),
    		dataType: "JSON", 
    		success: function(response){
    			// debugger;
    			console.log(response);
    			if (response.error != undefined){
    				$("#errorcontainer").html("<h1>"+response.error+"</h1>")
    			}
    			if (response.url != undefined){
    				// debugger
    				$("#db-list").append("<tr>\
						<td>" + response.url.id + "</td>\
						<td class='titcol'>" + response.url.title + "</td>\
						<td class='urlcol'>" + response.url.long_url +"</td>\
						<td class='urlcol'><a href=" +response.url.short_url + ">"+ response.url.short_url + "</a></td>\
						<td>" + response.url.click_count + "</td>\
						</tr>")
    			}
    		}
    	});
    });
});