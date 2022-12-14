extends HTTPRequest


func _fetch_tweet_images():
	var bearer = ""
	var url = "https://twitter.com/hyxpk"
	var error = request(url, [], true, HTTPClient.METHOD_GET, bearer)
	if error != OK:
		push_error("An error occurred in the HTTP request.")

#Called when the HTTP request is completed.
func _on_HttpRequest_request_completed(response_code, body):
	if response_code == 200:
		var json = JSON.parse(body)
		var images = json["globalObjects"]["tweets"]
		for image in images:
			var image_url = image["extended_entities"]["media"][0]["media_url_https"]
			print(image_url)
	else:
		push_error("Couldn't load the image.")

func push_error(error):
	print(error)

func _ready():
	_fetch_tweet_images()
