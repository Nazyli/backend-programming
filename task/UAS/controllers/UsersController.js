// TODO 4: SETUP CONTROLLER
const Users = require("../models").Users;
const bcrypt = require('bcryptjs');
const { body, validationResult } = require('express-validator');
const jwt = require('jsonwebtoken');
require("dotenv").config();
const secret = process.env.SECRET;

class UsersController {

    async checkDuplicateEmail(req, res, next) {
        Users.findOne({
            where: {
                email: req.body.email
            }
        }).then(user => {
            if (user) {
                return res.status(400).send({
                    status: "Error",
                    message: "Email is already taken!"
                });
            }
            next();
        });
    }

    async register(req, res) {
        const errors = validationResult(req);
        if (!errors.isEmpty()) return res.status(400).json({ status: "error", errors: errors.array() });

        const { name, email } = req.body;

        let password = bcrypt.hashSync(req.body.password, 8);
        return await Users.create(
            { name, email, password }
        )
            .then((data) => res.status(200).send({ status: "success", message: "User registered successfully!", data }))
            .catch(err => res.status(500).send({ status: "error", message: err.message }));
    }

    async login(req, res) {
        const { email, password } = req.body;
        Users.findOne({
            where: {
                email: req.body.email
            }
        }).then(user => {
            if (!user || !(bcrypt.compareSync(password, user.password))) return res.status(401).send({ status: "unauthorized", message: "Incorrect email or password!" });

            let token = jwt.sign({
                id: email
            }, secret, {
                expiresIn: 3600 //1h expired
            });
            return res.status(200).send({
                message: "success login", data: {
                    auth: true,
                    email: email,
                    type: 'Bearer',
                    accessToken: token,
                }
            });
        }).catch(err => {
            return res.status(401).send({
                auth: false,
                email: email,
                accessToken: null,
                message: "Error",
                errors: err
            });
        });
    }

    async verifyToken(req, res, next) {
        let token = req.headers.authorization;

        if (!token) {
            return res.status(403).send({
                auth: false, message: "Error", errors: "Forbidden,token required"
            });
        }
        if (token.split(' ')[0] !== 'Bearer') {
            return res.status(400).send({
                auth: false, message: "Error", errors: "Incorrect token format"
            });
        }
        token = token.split(' ')[1];
        jwt.verify(token, secret, (err, decoded) => {
            if (err) {
                return res.status(500).send({
                    auth: false,
                    message: "Error",
                    errors: err
                });
            }
            req.userId = decoded.id;
            next();
        });
    }
}

// object
const objUsers = new UsersController();

// export
module.exports = objUsers;