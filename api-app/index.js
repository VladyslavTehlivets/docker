var express = require("express");
var bodyParser = require("body-parser");
var morgan = require("morgan");
var routes = require("./routes.js");
var db = require("./db.js");

const PORT = process.env.PORT || 3333;
const MONGO_HOST = process.env.MONGO_HOST || "mongodb://localhost:27017/mydatabase";

var app = express();

app.use(function(req, res, next) {
    res.header("Access-Control-Allow-Origin", "*");
    res.header("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept");
    next();
});

app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));

app.use(morgan("combined"));

routes(app);

db.connect(MONGO_HOST, function(err) {
  if (err) {
    console.log("Unable to connect to Mongo.");
    process.exit(1);
  } else {
    app.listen(PORT, function () {
        console.log("App running on port: ", server.address().port);
    });
  }
});
