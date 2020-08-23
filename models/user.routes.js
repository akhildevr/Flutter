module.exports = app => {
    const customers = require("./user.controller.js");
  
    app.post("/customer", customers.create);
  
    app.get("/customer", customers.findAll);
  
    app.get("/customer/:uid", customers.findOne);
  
    app.put("/customer/:uid", customers.update);
  
    app.delete("/customer/:uid", customers.delete);
  
    app.delete("/customer", customers.deleteAll);
  };