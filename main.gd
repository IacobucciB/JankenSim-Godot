extends Node2D

@onready var log = $LOG
@onready var windowC = $VENTANA/Area2D/closed
@onready var windowO = $VENTANA/Area2D/open
@onready var oro = $ORO

var open = false

@export var oroc = 0
const ROCK = 0
const PAPER = 1
const SCISSORS = 2

func _ready():
	randomize()

func _on_alejarse_pressed():
	if open == true:
		log.add_text("Te Acercaste \n")
		windowO.visible = true
		windowC.visible = false
		open = false
	else:
		log.add_text("Te Alejaste \n")
		windowO.visible = false
		windowC.visible = true
		open = true

func _on_piedra_pressed():
	if !open:
		play_game(ROCK)
	else:
		log.clear()
		log.add_text("Estas Alejado \n")

func _on_papel_pressed():
	if !open:
		play_game(PAPER)
	else:
		log.clear()
		log.add_text("Estas Alejado \n")

func _on_tijeras_pressed():
	if !open:
		play_game(SCISSORS)
	else:
		log.clear()
		log.add_text("Estas Alejado \n")

func play_game(player_choice):
	log.clear()
	var computer_choice = randi() % 3
	var result = determine_winner(player_choice, computer_choice)
	var choices = ["Piedra", "Papel", "Tijeras"]

	log.add_text("Juegas: " + choices[player_choice] + "\n")
	log.add_text("Tu oponente eligio: " + choices[computer_choice] + "\n")

	match result:
		0:
			log.add_text("Es un empate!\n")
		1:
			log.add_text("¡Ganaste!\n")
			increase_oroc(5) # Increase oroc by 5 when player wins
		-1:
			log.add_text("Perdiste!\n")

func determine_winner(player_choice, computer_choice):
	if player_choice == computer_choice:
		return 0 # Draw
	elif (player_choice == ROCK and computer_choice == SCISSORS) or (player_choice == PAPER and computer_choice == ROCK) or (player_choice == SCISSORS and computer_choice == PAPER):
		return 1 # Player wins
	else:
		return -1 # Computer wins

func increase_oroc(amount):
	oroc += amount
	oro.clear()
	oro.add_text("ORO: " + str(oroc))
