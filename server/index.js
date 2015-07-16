var app = require('express')();
var http = require('http').Server(app);
var io = require('socket.io')(http);

io.on('connection', function(socket)
{
  console.log('a user connected');
  //io.emit('Wellcome', msg);
   
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