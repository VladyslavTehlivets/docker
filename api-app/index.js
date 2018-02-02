var express = require("express");
var bodyParser = require("body-parser");
var morgan = require("morgan");
var routes = require("./routes.js");
var MongoClient = require("mongodb").MongoClient;

const PORT = process.env.PORT || 3333;
const MONGO_DB_NAME = process.env.MONGO_DB_NAME || "mydatabase";
const MONGO_HOST = process.env.MONGO_HOST || "mongodb://localhost:27017/" + MONGO_DB_NAME;

var app = express();

app.use(function (req, res, next) {
    res.header("Access-Control-Allow-Origin", "*");
    res.header("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept");
    next();
});

app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));

app.use(morgan("combined"));

MongoClient.connect(MONGO_HOST, function (err, database) {
    if (err) {
        console.log("Unable to connect to Mongo :", MONGO_HOST);
        process.exit(1);
    }

    routes(app, database.db(MONGO_DB_NAME));

    app.listen(PORT, function () {
        console.log("App running on port: ", PORT);
        console.log("Connected to Mongo: ", MONGO_HOST);
    });
});