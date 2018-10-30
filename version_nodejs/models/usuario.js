const mongoose = require('mongoose')
const schema = mongoose.Schema

const UserSchema = new schema({
  name:{type:String,require:true},
  email:{type:String,require:true},
  birthday:{type:Date,require:true},
  password:{type:String,require:true}
})

UserModel = mongoose.model('usuario',UserSchema)
module.exports = UserModel
