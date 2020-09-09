text = "x" * 20
path = File.join(__dir__, '..', 'logs')
File.write("../logs/outside_boom.txt", text)