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
mongoose.connect('mongodb://localhost/calendar')
  .then(
    db => console.log("coneccion exitosa")

  ).catch(
    err => console.log("error al establecer coneccion")
  )

var conn = mongoose.connection;
var user = {
  name : "Josue Torres",
  email : "josue@gmail.com",
  birthday : "1995-06-09",
  password : "123456"
}
conn.collection('usuarios').insert(user);
console.log("user: ");
console.log(user);


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
