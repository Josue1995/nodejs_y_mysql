const mongoose = require('mongoose')
const schema = mongoose.Schema

const EventSchema = new schema({
  event_id: {type:Number, require:true},
  title: {type:String, require:true},
  start: {type:Date,require:true},
  starthour: {type:Date,require:true},
  end: {type:Date, require:false},
  endhour: {type:Date, require:false},
  allDay: {type:Boolean, require:false}
})

EventModel = mongoose.model('evento',EventSchema)
module.exports = EventModel
