var express = require("express");
var bodyParser = require("body-parser");
var routes = require("./routes.js");

const PORT = process.env.PORT || 3333;

var app = express();

app.use(function(req, res, next) {
    res.header("Access-Control-Allow-Origin", "*");
    res.header("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept");
    next();
});

app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));

routes(app);

var server = app.listen(PORT, function () {
    console.log("app running on port.", server.address().port);
});