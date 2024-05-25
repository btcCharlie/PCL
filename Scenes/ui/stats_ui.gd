class_name StatsUI
extends VBoxContainer

signal stats_changed

@onready var health: HBoxContainer = $Health
@onready var health_bar: ProgressBar = %HealthBar
@onready var health_label: Label = %HealthLabel
@onready var stress: HBoxContainer = $Stress
@onready var stress_bar: ProgressBar = %StressBar
@onready var stress_label: Label = %StressLabel


func update_stats(stats: Stats) -> void:
	health_bar.max_value = stats.max_health
	health_bar.value = stats.health
	health_label.text = str(stats.health)
	
	stress_bar.max_value = stats.max_stress
	stress_bar.value = stats.stress
	stress_label.text = str(stats.stress)
