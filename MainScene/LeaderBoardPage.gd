extends Node2D


func _ready():
	$Notice.visible = false
	$Loading.visible = true
	$Back.visible = false
	$ScrollContainer.visible = false
	$Node2D.visible = false
	$Label.visible = false
	
	Global.leaderboard_args["username"] = Global.Account["username"]
	Global.leaderboard_args["time"] = Global.Account["time"]
	Global.leaderboard_args["kills"] = Global.Account["kills"]
	Global.leaderboard_args["cookies"] = Global.Account["cookies"]
	
	Global.currentAction = 8
	var newcall = load("res://Global/HttpRequest.tscn")
	Global.response["status"] = ""
	var counter = 0
	
	while Global.response["status"] != "Successful":
		counter += 1
		var new = newcall.instantiate()
		add_child(new)
		new.send()
		
		await get_tree().create_timer(2).timeout
		if Global.response["status"] == "Successful":
			remove_child(new)
			$Node2D/Score.text = str(Global.Account["kills"])
			if Global.response["user_rank"] == 1:
				$Node2D/Trophy.texture = load("res://png/LeaderBoard/First.png")
				$Node2D/Ranking.text = "1"
				$Node2D/Ranking.position = Vector2(170,170)
				$Node2D/Ranking.add_theme_font_size_override("font_size", 55)
			elif Global.response["user_rank"] == 2:
				$Node2D/Trophy.texture = load("res://png/LeaderBoard/Second.png")
				$Node2D/Ranking.text = "2"
				$Node2D/Ranking.position = Vector2(165,170)
				$Node2D/Ranking.add_theme_font_size_override("font_size", 55)
			elif Global.response["user_rank"] == 3:
				$Node2D/Trophy.texture = load("res://png/LeaderBoard/Third.png")
				$Node2D/Ranking.text = "3"
				$Node2D/Ranking.position = Vector2(165,170)
				$Node2D/Ranking.add_theme_font_size_override("font_size", 55)
			else:
				$Node2D/Trophy.texture = load("res://png/LeaderBoard/Others.png")
				$Node2D/Ranking.text = str(Global.response["user_rank"])
				$Node2D/Ranking.position = Vector2(146,180)
				$Node2D/Ranking.add_theme_font_size_override("font_size", 30)
			
			if Global.response["result"][0]["nickname"] != "None":
				$"ScrollContainer/VBoxContainer/1/Nickname".text = "      " + Global.response["result"][0]["nickname"]
				$"ScrollContainer/VBoxContainer/1/Kills".text = str(Global.response["result"][0]["kills"]) + "        "
				$"ScrollContainer/VBoxContainer/1/Time".text = str(Global.response["result"][0]["time"]) + "  "
				if Global.response["result"][0]["nickname"] == Global.Account["nickname"] and Global.response["result"][0]["kills"] == Global.Account["kills"] and Global.response["result"][0]["time"] == Global.Account["time"]:
					$"ScrollContainer/VBoxContainer/1/Nickname".add_theme_color_override("font_color",Color(1, 1, 1))
					$"ScrollContainer/VBoxContainer/1/Kills".add_theme_color_override("font_color",Color(1, 1, 1))
					$"ScrollContainer/VBoxContainer/1/Time".add_theme_color_override("font_color",Color(1, 1, 1))
				else:
					$"ScrollContainer/VBoxContainer/1/Nickname".add_theme_color_override("font_color",Color(0.455, 0.376, 0.235))
					$"ScrollContainer/VBoxContainer/1/Kills".add_theme_color_override("font_color",Color(0.455, 0.376, 0.235))
					$"ScrollContainer/VBoxContainer/1/Time".add_theme_color_override("font_color",Color(0.455, 0.376, 0.235))
			else:
				$"ScrollContainer/VBoxContainer/1/Nickname".text = "      -"
				$"ScrollContainer/VBoxContainer/1/Kills".text = "-        "
				$"ScrollContainer/VBoxContainer/1/Time".text = "-  "
			if Global.response["result"][1]["nickname"] != "None":
				$"ScrollContainer/VBoxContainer/2/Nickname".text = "      " + Global.response["result"][1]["nickname"]
				$"ScrollContainer/VBoxContainer/2/Kills".text = str(Global.response["result"][1]["kills"]) + "        "
				$"ScrollContainer/VBoxContainer/2/Time".text = str(Global.response["result"][1]["time"]) + "  "
				if Global.response["result"][1]["nickname"] == Global.Account["nickname"] and Global.response["result"][1]["kills"] == Global.Account["kills"] and Global.response["result"][1]["time"] == Global.Account["time"]:
					$"ScrollContainer/VBoxContainer/2/Nickname".add_theme_color_override("font_color",Color(1, 1, 1))
					$"ScrollContainer/VBoxContainer/2/Kills".add_theme_color_override("font_color",Color(1, 1, 1))
					$"ScrollContainer/VBoxContainer/2/Time".add_theme_color_override("font_color",Color(1, 1, 1))
				else:
					$"ScrollContainer/VBoxContainer/2/Nickname".add_theme_color_override("font_color",Color(0.455, 0.376, 0.235))
					$"ScrollContainer/VBoxContainer/2/Kills".add_theme_color_override("font_color",Color(0.455, 0.376, 0.235))
					$"ScrollContainer/VBoxContainer/2/Time".add_theme_color_override("font_color",Color(0.455, 0.376, 0.235))
			else:
				$"ScrollContainer/VBoxContainer/2/Nickname".text = "      -"
				$"ScrollContainer/VBoxContainer/2/Kills".text = "-        "
				$"ScrollContainer/VBoxContainer/2/Time".text = "-  "
			if Global.response["result"][2]["nickname"] != "None":
				$"ScrollContainer/VBoxContainer/3/Nickname".text = "      " + Global.response["result"][2]["nickname"]
				$"ScrollContainer/VBoxContainer/3/Kills".text = str(Global.response["result"][2]["kills"]) + "        "
				$"ScrollContainer/VBoxContainer/3/Time".text = str(Global.response["result"][2]["time"]) + "  "
				if Global.response["result"][2]["nickname"] == Global.Account["nickname"] and Global.response["result"][2]["kills"] == Global.Account["kills"] and Global.response["result"][2]["time"] == Global.Account["time"]:
					$"ScrollContainer/VBoxContainer/3/Nickname".add_theme_color_override("font_color",Color(1, 1, 1))
					$"ScrollContainer/VBoxContainer/3/Kills".add_theme_color_override("font_color",Color(1, 1, 1))
					$"ScrollContainer/VBoxContainer/3/Time".add_theme_color_override("font_color",Color(1, 1, 1))
				else:
					$"ScrollContainer/VBoxContainer/3/Nickname".add_theme_color_override("font_color",Color(0.455, 0.376, 0.235))
					$"ScrollContainer/VBoxContainer/3/Kills".add_theme_color_override("font_color",Color(0.455, 0.376, 0.235))
					$"ScrollContainer/VBoxContainer/3/Time".add_theme_color_override("font_color",Color(0.455, 0.376, 0.235))
			else:
				$"ScrollContainer/VBoxContainer/3/Nickname".text = "      -"
				$"ScrollContainer/VBoxContainer/3/Kills".text = "-        "
				$"ScrollContainer/VBoxContainer/3/Time".text = "-  "
			if Global.response["result"][3]["nickname"] != "None":
				$"ScrollContainer/VBoxContainer/4/Nickname".text = "      " + Global.response["result"][3]["nickname"]
				$"ScrollContainer/VBoxContainer/4/Kills".text = str(Global.response["result"][3]["kills"]) + "        "
				$"ScrollContainer/VBoxContainer/4/Time".text = str(Global.response["result"][3]["time"]) + "  "
				if Global.response["result"][3]["nickname"] == Global.Account["nickname"] and Global.response["result"][3]["kills"] == Global.Account["kills"] and Global.response["result"][3]["time"] == Global.Account["time"]:
					$"ScrollContainer/VBoxContainer/4/Nickname".add_theme_color_override("font_color",Color(1, 1, 1))
					$"ScrollContainer/VBoxContainer/4/Kills".add_theme_color_override("font_color",Color(1, 1, 1))
					$"ScrollContainer/VBoxContainer/4/Time".add_theme_color_override("font_color",Color(1, 1, 1))
				else:
					$"ScrollContainer/VBoxContainer/4/Nickname".add_theme_color_override("font_color",Color(0.455, 0.376, 0.235))
					$"ScrollContainer/VBoxContainer/4/Kills".add_theme_color_override("font_color",Color(0.455, 0.376, 0.235))
					$"ScrollContainer/VBoxContainer/4/Time".add_theme_color_override("font_color",Color(0.455, 0.376, 0.235))
			else:
				$"ScrollContainer/VBoxContainer/4/Nickname".text = "      -"
				$"ScrollContainer/VBoxContainer/4/Kills".text = "-        "
				$"ScrollContainer/VBoxContainer/4/Time".text = "-  "
			if Global.response["result"][4]["nickname"] != "None":
				$"ScrollContainer/VBoxContainer/5/Nickname".text = "      " + Global.response["result"][4]["nickname"]
				$"ScrollContainer/VBoxContainer/5/Kills".text = str(Global.response["result"][4]["kills"]) + "        "
				$"ScrollContainer/VBoxContainer/5/Time".text = str(Global.response["result"][4]["time"]) + "  "
				if Global.response["result"][4]["nickname"] == Global.Account["nickname"] and Global.response["result"][4]["kills"] == Global.Account["kills"] and Global.response["result"][4]["time"] == Global.Account["time"]:
					$"ScrollContainer/VBoxContainer/5/Nickname".add_theme_color_override("font_color",Color(1, 1, 1))
					$"ScrollContainer/VBoxContainer/5/Kills".add_theme_color_override("font_color",Color(1, 1, 1))
					$"ScrollContainer/VBoxContainer/5/Time".add_theme_color_override("font_color",Color(1, 1, 1))
				else:
					$"ScrollContainer/VBoxContainer/5/Nickname".add_theme_color_override("font_color",Color(0.455, 0.376, 0.235))
					$"ScrollContainer/VBoxContainer/5/Kills".add_theme_color_override("font_color",Color(0.455, 0.376, 0.235))
					$"ScrollContainer/VBoxContainer/5/Time".add_theme_color_override("font_color",Color(0.455, 0.376, 0.235))
			else:
				$"ScrollContainer/VBoxContainer/5/Nickname".text = "      -"
				$"ScrollContainer/VBoxContainer/5/Kills".text = "-        "
				$"ScrollContainer/VBoxContainer/5/Time".text = "-  "
			if Global.response["result"][5]["nickname"] != "None":
				$"ScrollContainer/VBoxContainer/6/Nickname".text = "      " + Global.response["result"][5]["nickname"]
				$"ScrollContainer/VBoxContainer/6/Kills".text = str(Global.response["result"][5]["kills"]) + "        "
				$"ScrollContainer/VBoxContainer/6/Time".text = str(Global.response["result"][5]["time"]) + "  "
				if Global.response["result"][5]["nickname"] == Global.Account["nickname"] and Global.response["result"][5]["kills"] == Global.Account["kills"] and Global.response["result"][5]["time"] == Global.Account["time"]:
					$"ScrollContainer/VBoxContainer/6/Nickname".add_theme_color_override("font_color",Color(1, 1, 1))
					$"ScrollContainer/VBoxContainer/6/Kills".add_theme_color_override("font_color",Color(1, 1, 1))
					$"ScrollContainer/VBoxContainer/6/Time".add_theme_color_override("font_color",Color(1, 1, 1))
				else:
					$"ScrollContainer/VBoxContainer/6/Nickname".add_theme_color_override("font_color",Color(0.455, 0.376, 0.235))
					$"ScrollContainer/VBoxContainer/6/Kills".add_theme_color_override("font_color",Color(0.455, 0.376, 0.235))
					$"ScrollContainer/VBoxContainer/6/Time".add_theme_color_override("font_color",Color(0.455, 0.376, 0.235))
			else:
				$"ScrollContainer/VBoxContainer/6/Nickname".text = "      -"
				$"ScrollContainer/VBoxContainer/6/Kills".text = "-        "
				$"ScrollContainer/VBoxContainer/6/Time".text = "-  "
			if Global.response["result"][6]["nickname"] != "None":
				$"ScrollContainer/VBoxContainer/7/Nickname".text = "      " + Global.response["result"][6]["nickname"]
				$"ScrollContainer/VBoxContainer/7/Kills".text = str(Global.response["result"][6]["kills"]) + "        "
				$"ScrollContainer/VBoxContainer/7/Time".text = str(Global.response["result"][6]["time"]) + "  "
				if Global.response["result"][6]["nickname"] == Global.Account["nickname"] and Global.response["result"][6]["kills"] == Global.Account["kills"] and Global.response["result"][6]["time"] == Global.Account["time"]:
					$"ScrollContainer/VBoxContainer/7/Nickname".add_theme_color_override("font_color",Color(1, 1, 1))
					$"ScrollContainer/VBoxContainer/7/Kills".add_theme_color_override("font_color",Color(1, 1, 1))
					$"ScrollContainer/VBoxContainer/7/Time".add_theme_color_override("font_color",Color(1, 1, 1))
				else:
					$"ScrollContainer/VBoxContainer/7/Nickname".add_theme_color_override("font_color",Color(0.455, 0.376, 0.235))
					$"ScrollContainer/VBoxContainer/7/Kills".add_theme_color_override("font_color",Color(0.455, 0.376, 0.235))
					$"ScrollContainer/VBoxContainer/7/Time".add_theme_color_override("font_color",Color(0.455, 0.376, 0.235))
			else:
				$"ScrollContainer/VBoxContainer/7/Nickname".text = "      -"
				$"ScrollContainer/VBoxContainer/7/Kills".text = "-        "
				$"ScrollContainer/VBoxContainer/7/Time".text = "-  "
			if Global.response["result"][7]["nickname"] != "None":
				$"ScrollContainer/VBoxContainer/8/Nickname".text = "      " + Global.response["result"][7]["nickname"]
				$"ScrollContainer/VBoxContainer/8/Kills".text = str(Global.response["result"][7]["kills"]) + "        "
				$"ScrollContainer/VBoxContainer/8/Time".text = str(Global.response["result"][7]["time"]) + "  "
				if Global.response["result"][7]["nickname"] == Global.Account["nickname"] and Global.response["result"][7]["kills"] == Global.Account["kills"] and Global.response["result"][7]["time"] == Global.Account["time"]:
					$"ScrollContainer/VBoxContainer/8/Nickname".add_theme_color_override("font_color",Color(1, 1, 1))
					$"ScrollContainer/VBoxContainer/8/Kills".add_theme_color_override("font_color",Color(1, 1, 1))
					$"ScrollContainer/VBoxContainer/8/Time".add_theme_color_override("font_color",Color(1, 1, 1))
				else:
					$"ScrollContainer/VBoxContainer/8/Nickname".add_theme_color_override("font_color",Color(0.455, 0.376, 0.235))
					$"ScrollContainer/VBoxContainer/8/Kills".add_theme_color_override("font_color",Color(0.455, 0.376, 0.235))
					$"ScrollContainer/VBoxContainer/8/Time".add_theme_color_override("font_color",Color(0.455, 0.376, 0.235))
			else:
				$"ScrollContainer/VBoxContainer/8/Nickname".text = "      -"
				$"ScrollContainer/VBoxContainer/8/Kills".text = "-        "
				$"ScrollContainer/VBoxContainer/8/Time".text = "-  "
			if Global.response["result"][8]["nickname"] != "None":
				$"ScrollContainer/VBoxContainer/9/Nickname".text = "      " + Global.response["result"][8]["nickname"]
				$"ScrollContainer/VBoxContainer/9/Kills".text = str(Global.response["result"][8]["kills"]) + "        "
				$"ScrollContainer/VBoxContainer/9/Time".text = str(Global.response["result"][8]["time"]) + "  "
				if Global.response["result"][8]["nickname"] == Global.Account["nickname"] and Global.response["result"][8]["kills"] == Global.Account["kills"] and Global.response["result"][8]["time"] == Global.Account["time"]:
					$"ScrollContainer/VBoxContainer/9/Nickname".add_theme_color_override("font_color",Color(1, 1, 1))
					$"ScrollContainer/VBoxContainer/9/Kills".add_theme_color_override("font_color",Color(1, 1, 1))
					$"ScrollContainer/VBoxContainer/9/Time".add_theme_color_override("font_color",Color(1, 1, 1))
				else:
					$"ScrollContainer/VBoxContainer/9/Nickname".add_theme_color_override("font_color",Color(0.455, 0.376, 0.235))
					$"ScrollContainer/VBoxContainer/9/Kills".add_theme_color_override("font_color",Color(0.455, 0.376, 0.235))
					$"ScrollContainer/VBoxContainer/9/Time".add_theme_color_override("font_color",Color(0.455, 0.376, 0.235))
			else:
				$"ScrollContainer/VBoxContainer/9/Nickname".text = "      -"
				$"ScrollContainer/VBoxContainer/9/Kills".text = "-        "
				$"ScrollContainer/VBoxContainer/9/Time".text = "-  "
			if Global.response["result"][9]["nickname"] != "None":
				$"ScrollContainer/VBoxContainer/10/Nickname".text = "      " + Global.response["result"][9]["nickname"]
				$"ScrollContainer/VBoxContainer/10/Kills".text = str(Global.response["result"][9]["kills"]) + "        "
				$"ScrollContainer/VBoxContainer/10/Time".text = str(Global.response["result"][9]["time"]) + "  "
				if Global.response["result"][9]["nickname"] == Global.Account["nickname"] and Global.response["result"][9]["kills"] == Global.Account["kills"] and Global.response["result"][9]["time"] == Global.Account["time"]:
					$"ScrollContainer/VBoxContainer/10/Nickname".add_theme_color_override("font_color",Color(1, 1, 1))
					$"ScrollContainer/VBoxContainer/10/Kills".add_theme_color_override("font_color",Color(1, 1, 1))
					$"ScrollContainer/VBoxContainer/10/Time".add_theme_color_override("font_color",Color(1, 1, 1))
				else:
					$"ScrollContainer/VBoxContainer/10/Nickname".add_theme_color_override("font_color",Color(0.455, 0.376, 0.235))
					$"ScrollContainer/VBoxContainer/10/Kills".add_theme_color_override("font_color",Color(0.455, 0.376, 0.235))
					$"ScrollContainer/VBoxContainer/10/Time".add_theme_color_override("font_color",Color(0.455, 0.376, 0.235))
			else:
				$"ScrollContainer/VBoxContainer/10/Nickname".text = "      -"
				$"ScrollContainer/VBoxContainer/10/Kills".text = "-        "
				$"ScrollContainer/VBoxContainer/10/Time".text = "-  "
		else:
			remove_child(new)
			if counter == 30:
				$Notice.visible = true
				$Notice/Label.text = "Failed"
				await get_tree().create_timer(2).timeout
				$Notice.visible = false
				$Notice/Label.text = ""
				get_tree().change_scene_to_file("res://MainScene/MainPage.tscn")
		''''''
	
	$Loading.visible = false
	$Back.visible = true
	$ScrollContainer.visible = true
	$Node2D.visible = true
	$Label.visible = true


func _on_back_pressed():
	get_tree().change_scene_to_file("res://MainScene/MainPage.tscn")
