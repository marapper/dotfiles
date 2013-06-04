//выполнять на странице поиска watched issues
var username = "user"; // UPDATE THE USERNAME

var issueKeys = [];
var elements = jQuery(".list-content .issue-link-key");
for (var i=0; i<elements.length; i++) {
	a = elements[i];var key = $(a).data('issue-key');
	issueKeys.push(key);
}
console.log("Going to unwatch " + issueKeys.length + " issues...");
for (var i=0; i<issueKeys.length; i++) {
	var issueKey = issueKeys[i];
	var url = "/rest/api/2/issue/" + issueKey + "/watchers?username="+username;
	console.log("Going to unwatch " + issueKey);
	jQuery.ajax({
		url: url,
		type: "DELETE",
		//type: "GET", // uncomment this line for debugging
		success: function(result) {
			console.log("Done.");
		}
	});
}