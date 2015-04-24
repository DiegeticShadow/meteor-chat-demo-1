## Meteor Chat App Tutorial

### Install Meteor

1. Go to https://www.meteor.com/install

1. Copy the installer command, `curl https://install.meteor.com/ | sh`, and paste into Terminal. (For Windows, download the installer from that page.)

### Create project

```
cd ~/Sites
meteor create chat
cd chat
meteor
```
Whoa! Take a look at http://localhost:3000!

### Set up folders

1. Delete the files in `chat`.

1. Create three folders: `client`, `common`, `server`. `client` and `server` are special folders: what's in `client` only executes on the client, what's in `server` only executes on the server. Aside from a few other special folders, code in any other folder (such as `common`), executes on both client and server.

### Add packages

```
meteor add coffeescript
meteor add stylus
meteor add twbs:bootstrap
```

### Create root files

##### client/index.html

```
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
</head>

<body>
	Hello world!
</body>
```

##### client/index.styl

##### common/messages.coffee

```
@Messages = new Mongo.Collection 'messages'
```

### Create chat template

##### chat.html
```
<template name="chat">
	<div id="chat">
		<div id="messages">
			{{#each getMessages}}
				<p>{{message}}</p>
			{{/each}}
		</div>
	</div>

	<div id="input">
		<form>
			<input type="text" class="form-control">
		</form>
	</div>
</template>
```

##### index.html
```
<body>
	{{> chat}}
</body>
```

##### index.styl
```
#chat
	width 100%
	height calc(100vh - 3em)
	padding 1em
	overflow hidden
	position relative

#messages
	position absolute
	bottom 0

#input
	width 100%
	height 2em
	position absolute
	bottom 1em
	padding 0 1em
```
### Create chat template helpers and event handlers

##### chat.coffee
```
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
```

### Run!

See http://localhost:3000. Have others connect to your IP address at port 3000!