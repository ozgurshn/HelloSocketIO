# HelloSocketIO
An example chat application to connect SocketIO server using Swift.

It is developed on https://github.com/socketio/socket.io-client-swift


It sends message to local hosted server and gets server response.

There is server code under /Server folder.
 
You shoud install Node.JS unless you have. 

And then call the command belov in onder to populate dependencies.

```npm install --save express@4.10.2```

The code in Index.Js basically runs server that listens 3000 port. The server logs when user connected and responds when it gets "chatMessage" event.

```
var app = require('express')();
var http = require('http').Server(app);
var io = require('socket.io')(http);

io.on('connection', function(socket)
{
  console.log('a user connected');
   
  socket.on('disconnect', function(){
    console.log('user disconnected');
  });
  
  socket.on('chatMessage', function(msg){
    console.log('message: ' + msg);
	io.emit('chatMessage', 'Message came bro');
  });
  
});


http.listen(3000, function(){
  console.log('listening on *:3000');
});
```

