extends Node

#var url: String = "http://127.0.0.1:5000/"
var url: String = "http://140.122.185.168:30000/"

func _ready():
	pass
	
func _http_request_completed(result, response_code, headers, body):
	var json = JSON.new()
	json.parse(body.get_string_from_utf8())
	Global.response = json.get_data()
	
	
func send():
	var body
	if Global.currentAction == 1:
		body = JSON.stringify(Global.login_args)
	elif Global.currentAction == 2:
		body = JSON.stringify(Global.register_args)
	elif Global.currentAction == 3:
		body = JSON.stringify(Global.forgot_args)
	elif Global.currentAction == 4:
		body = JSON.stringify(Global.verify_args)
	elif Global.currentAction == 5:
		body = JSON.stringify(Global.rename_args)
	elif Global.currentAction == 6:
		body = JSON.stringify(Global.search_args)
	elif Global.currentAction == 7:
		body = JSON.stringify(Global.gacha_args)
	elif Global.currentAction == 8:
		body = JSON.stringify(Global.leaderboard_args)
	elif Global.currentAction == 9:
		body = JSON.stringify(Global.topup_args)
	
	#print(body)
	
	var http_request = HTTPRequest.new()
	add_child(http_request)
	http_request.set_timeout(2.0)
	http_request.request_completed.connect(self._http_request_completed)
	
	var headers = ["Content-Type: application/json"]
	var error
	if Global.currentAction == 1:
		error = http_request.request( url+Global.login_func, headers, HTTPClient.METHOD_POST, body)
	elif Global.currentAction == 2:
		error = http_request.request( url+Global.reg_func, headers, HTTPClient.METHOD_POST, body)
	elif Global.currentAction == 3:
		error = http_request.request( url+Global.forgot_func, headers, HTTPClient.METHOD_POST, body)
	elif Global.currentAction == 4:
		error = http_request.request( url+Global.verify_func, headers, HTTPClient.METHOD_POST, body)
	elif Global.currentAction == 5:
		error = http_request.request( url+Global.rename_func, headers, HTTPClient.METHOD_POST, body)
	elif Global.currentAction == 6:
		error = http_request.request( url+Global.search_func, headers, HTTPClient.METHOD_POST, body)
	elif Global.currentAction == 7:
		error = http_request.request( url+Global.gacha_func, headers, HTTPClient.METHOD_POST, body)
	elif Global.currentAction == 8:
		error = http_request.request( url+Global.leaderboard_func, headers, HTTPClient.METHOD_POST, body)
	elif Global.currentAction == 9:
		error = http_request.request( url+Global.topup_func, headers, HTTPClient.METHOD_POST, body)
		
	if error != OK:
		#print(error)
		push_error("An error occurred in the HTTP request.")
	
	await get_tree().create_timer(1.5).timeout
	remove_child(http_request)


