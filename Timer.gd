extends Timer

var timer = self
var thread


func _ready():
	thread = Thread.new() # create thread
	print("Create Thread Id: ", thread)
	print("Thread Active: ", thread.is_active())
	
	thread.start(self, "startTimer", null, 0) # start the thread
	print("\nStart the thread: ")
	print("Thread Active: ", thread.is_active())
	
	var waitForThread = thread.wait_to_finish() # wait for our thread to finish before moving on
	print("\nThread is Finished: ", waitForThread)
	print("Thread Active: ", thread.is_active())
	


func startTimer(param):
	print("inside timer")
	timer.set_one_shot(true)
	timer.start(2)
	timer.connect("timeout", self, "print")
	return 100


func print():
	print("\ntimer done!")
