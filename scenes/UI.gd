extends CanvasLayer


func _on_world_match_count_changed(new_match_count):
	$MatchesRemaining.text = "Matches Remaining: %d" % new_match_count
