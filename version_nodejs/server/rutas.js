const express = require('express');
const Router = express.Router();
const Login = express.Router();
const User = require('../models/usuario.js')
const pass = require('../models/password.js')
const Event = require('../models/eventos.js')

//para el usuario logeado
var cookie = null;

Login.get('/', function (req, res) {
 res.render('index')
})

Router.get('/signup', (req, res) => {
  res.render('registro')
})


Router.post('/',(req,res)=> {
    User.find({email:req.body.user}).exec(function (err, docs) {
      if (err) {
        res.status(500);
        res.json(err);
        console.log(err);
      }else {
        userHash = docs[0]['password']===req.body.pass
        console.log(userHash);
        if (userHash) {
          cookie = req.body.user
          res.send('Validado')
        }else {
          res.send('error de credenciales')
        }
      }
    })
})

Router.post('/saveUser',  (req,res)=> {
  hash = pass.hash(req.body.pass)

  var user = new User({
    name:req.body.name,
    email:req.body.user,
    birthday:req.body.date,
    password: hash
  })
  user.save((err)=>{
    if (err) {
      res.send('error')
    }else {
      res.send('creado')
    }
  })
})

Router.post('/newEvent', (req,res) => {
  User.find({email:cookie}).exec(function (err,docs) {
    if (err) {
      res.status(500)
      res.json(err)
      console.log(err);
    }else {
      var event = new Event({
        event_id: req.body.event_id,
        title: req.body.title,
        start: req.body.start,
        end: req.body.end
      })
      event.save((err) => {
        if (err) {
          res.send('error')
        }else {
          res.send('guardado')
        }
      })
    }
  })
})

Router.post('/update/:id', (req,res) => {
  Event.find({event_id:req.body.id}).exec(function (err,docs) {
    if (err) {
      res.status(500)
      res.json(err)
    }else {
      docs.update({
        event_id:req.body.event_id
      },
      {

      }
    )
    }
  })
})

Router.post('/delete/:id', (req,res) => {
  Event.deleteOne({event_id:req.body.id}).exec( (err,docs) => {
    if (err) {
      res.status(500)
      res.json(err)
    }else {
      res.send("eliminado")
    }
  })
})

Router.get('/calendar', (req,res) => {
  res.render('main')
})

Router.get('/all', (req,res) => {
  Event.find().exec(function (err,docs) {
    if (err) {
      res.status(500)
      res.json(err)
    }else {
      res.send(docs)
    }
  })
})

Router.get('/logout', (req,res) => {
  cookie = null
  res.redirect('/events/')
})

module.exports = {
  'Router':Router,
  'Login':Login
}
