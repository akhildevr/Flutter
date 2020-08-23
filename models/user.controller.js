const Customer = require("./user.model.js");

exports.create = (req, res) => {
    if (!req.body) {
        res.status(400).send({
          message: "Content can not be empty!"
        });
    }

    const customer = new Customer({
        
        cname: req.body.cname,
        address:req.body.address,
        email: req.body.email,
        phoneno:req.body.phoneno,
        pass:req.body.pass,
        country:req.body.country,
        active: req.body.active
    });

    Customer.create(customer, (err, data) => {
        if (err)
        res.status(500).send({
            message:
            err.message || "Some error occurred while creating the Customer."
        });
        else res.send(data);
    });
};


exports.findAll = (req, res) => {
    Customer.getAll((err, data) => {
        if (err)
          res.status(500).send({
            message:
              err.message || "Some error occurred while retrieving customers."
          });
        else res.send(data);
    });
};

exports.findOne = (req, res) => {
    Customer.findById(req.params.uid, (err, data) => {
        if (err) {
          if (err.kind === "not_found") {
            res.status(404).send({
              message: `Not found Customer with id ${req.params.uid}.`
            });
          } else {
            res.status(500).send({
              message: "Error retrieving Customer with id " + req.params.uid
            });
          }
        } else res.send(data);
    });
};

exports.update = (req, res) => {
    if (!req.body) {
        res.status(400).send({
          message: "Content can not be empty!"
        });
      }
    
      console.log(req.body);
    
      Customer.updateById(req.params.uid, new Customer(req.body),
        (err, data) => {
          if (err) {
            if (err.kind === "not_found") {
              res.status(404).send({
                message: `Not found Customer with id ${req.params.uid}.`
              });
            } else {
              res.status(500).send({
                message: "Error updating Customer with id " + req.params.uid
              });
            }
          } else res.send(data);
        }
      );
};

exports.delete = (req, res) => {
    Customer.remove(req.params.uid, (err, data) => {
        if (err) {
          if (err.kind === "not_found") {
            res.status(404).send({
              message: `Not found Customer with id ${req.params.uid}.`
            });
          } else {
            res.status(500).send({
              message: "Could not delete Customer with id " + req.params.uid
            });
          }
        } else res.send({ message: `Customer was deleted successfully!` });
      });
};

exports.deleteAll = (req, res) => {
    exports.deleteAll = (req, res) => {
        Customer.removeAll((err, data) => {
          if (err)
            res.status(500).send({
              message:
                err.message || "Some error occurred while removing all customers."
            });
          else res.send({ message: `All Customers were deleted successfully!` });
        });
    };
};