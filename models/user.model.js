const sql = require("./db.js");

// constructor
const Customer = function(customer) {
  this.cname = customer.cname;
  this.address = customer.address;
  this.email = customer.email;
  this.phoneno = customer.phoneno;
  this.pass = customer.pass;
  this.country = customer.country;
  this.active = customer.active;
};

Customer.create = (newCustomer, result) => {
  sql.query("INSERT INTO customer SET ?", newCustomer, (err, res) => {
    if (err) {
      console.log("error: ", err);
      result(err, null);
      return;
    }

    console.log("created customer: ", { id: res.insertId, ...newCustomer });
    result(null, { id: res.insertId, ...newCustomer });
  });
};

Customer.findById = (uid, result) => {
  sql.query(`SELECT * FROM customer WHERE uid = ${uid}`, (err, res) => {
    if (err) {
      console.log("error: ", err);
      result(err, null);
      return;
    }

    if (res.length) {
      console.log("found customer: ", res[0]);
      result(null, res[0]);
      return;
    }

    // not found Customer with the id
    result({ kind: "not_found" }, null);
  });
};

Customer.getAll = result => {
  sql.query("SELECT * FROM customer", (err, res) => {
    if (err) {
      console.log("error: ", err);
      result(null, err);
      return;
    }

    console.log("customer: ", res);
    result(null, res);
  });
};

Customer.updateById = (uid, customer, result) => {
  sql.query(
    "UPDATE customer SET cname = ?, email = ?, active = ? WHERE uid = ?",
    [ customer.cname, customer.email, customer.active, uid],
    (err, res) => {
      if (err) {
        console.log("error: ", err);
        result(null, err);
        return;
      }

      if (res.affectedRows == 0) {
        // not found Customer with the id
        result({ kind: "not_found" }, null);
        return;
      }

      console.log("updated customer: ", { uid: uid, ...customer });
      result(null, { uid: uid, ...customer });
    }
  );
};

Customer.remove = (id, result) => {
  sql.query("DELETE FROM customer WHERE uid = ?", id, (err, res) => {
    if (err) {
      console.log("error: ", err);
      result(null, err);
      return;
    }

    if (res.affectedRows == 0) {
      // not found Customer with the id
      result({ kind: "not_found" }, null);
      return;
    }

    console.log("deleted customer with id: ", id);
    result(null, res);
  });
};

Customer.removeAll = result => {
  sql.query("DELETE FROM customer", (err, res) => {
    if (err) {
      console.log("error: ", err);
      result(null, err);
      return;
    }

    console.log(`deleted ${res.affectedRows} customer`);
    result(null, res);
  });
};

module.exports = Customer;