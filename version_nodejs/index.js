const http = require('http'),
       path = require('path'),
       express = require('express'),
       bodyParser = require('body-parser'),
       mongoose = require('mongoose'),
       routing = require('./server/rutas.js'),
       morgan = require('morgan')
//creando servidor
const PORT = 3000,
       app = express(),
       server = http.createServer(app)
//conectando a la base
var bd_dev = 'mongodb://localhost/calendar'

mongoose.connect(bd_dev,{
useNewUrlParser: true
}).then(()=>{
console.log(`Conectado a la base de datos en el puerto: ${PORT}`);
}).catch((err)=>{
console.log(`Error al conectarse a la base de datos ${err}`);
});




var conn = mongoose.connection
var user = {
  name : "Josue Torres",
  email : "josue@gmail.com",
  birthday : "1995-06-09",
  password : "123456"
}

    conn.collection('usuarios').insertOne(user)
    console.log("user: ")
    console.log(user)

app.use(bodyParser.json())
app.use(bodyParser.urlencoded({extended:true}))

app.use(morgan('dev'))
//activando servidor
server.listen(PORT, function () {
  console.log("Server running in port:" + PORT);
})
app.set('views', path.join(__dirname,'client'))
app.set('view engine', 'ejs')
app.use(express.static(path.join(__dirname,'client')))
app.use('/events', routing)
