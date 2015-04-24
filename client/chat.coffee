Template.chat.helpers
	getMessages: ->
		Messages.find {},
			sort:
				timestamp: 1


Template.chat.events
	'submit form': (event, template) ->
		event.preventDefault()
		input = template.find 'input'
		message = input.value

		Messages.insert
			message: message
			timestamp: Date.now()

		input.value = ''