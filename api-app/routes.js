var faker = require("faker");
var db = require("./db");

var log = function(req) {
    db.get().collection("logs").insert({
        hostname: req.hostname,
        method: req.method,
        url: req.originalUrl,
        ip: req.ip,
        date: Date.now()
    }, function(err, result) {
        if (err) {
            console.error(err);
        } else {
            console.log(result);
        }
    });
};

var appRouter = function (app) {

  app.get("/", function (req, res) {
    log(req);
    res.status(200).send({ message: 'Welcome to our restful API' });
  });

  app.get("/user", function (req, res) {
    log(req);
      
    var data = ({
      firstName: faker.name.firstName(),
      lastName: faker.name.lastName(),
      username: faker.internet.userName(),
      email: faker.internet.email()
    });
    
    res.status(200).send(data);
  });

 app.get("/users/:num", function (req, res) {
   log(req);
     
   var users = [];
   var num = req.params.num;

   if (isFinite(num) && num  > 0 ) {
     for (i = 0; i <= num-1; i++) {
       users.push({
           firstName: faker.name.firstName(),
           lastName: faker.name.lastName(),
           username: faker.internet.userName(),
           email: faker.internet.email()
        });
     }

     res.status(200).send(users);
    
   } else {
     res.status(400).send({ message: "Invalid number supplied." });
   }

 });
}

module.exports = appRouter;