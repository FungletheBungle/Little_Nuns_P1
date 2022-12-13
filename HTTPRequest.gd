extends HTTPRequest


func _fetch_tweet_images():
	var bearer = ""
	var url = "https://twitter.com/hyxpk"
	var error = request(url, [], true, HTTPClient.METHOD_GET, bearer)
	if error != OK:
		push_error("An error occurred in the HTTP request.")

#Called when the HTTP request is completed.
func _http_request_completed(result, response_code, headers, body):
	if response_code == 200:
		var json = JSON.parse(body)
		var images = json["globalObjects"]["tweets"]
		for image in images:
			var image_url = image["extended_entities"]["media"][0]["media_url_https"]
			print(image_url)
	else:
		push_error("Couldn't load the image.")

	var texture = ImageTexture.new()
	texture.create_from_image(image)

	# Display the image in a TextureRect node.
	var texture_rect = TextureRect.new()
	add_child(texture_rect)
	texture_rect.texture = texture
