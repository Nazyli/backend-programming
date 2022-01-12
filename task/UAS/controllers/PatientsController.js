// TODO 4: SETUP CONTROLLER
const Sequelize = require('sequelize');
const Op = Sequelize.Op;
const { body, validationResult } = require('express-validator');
const Patients = require('../models').Patients;
const Status = require('../models').Status;

const getPagination = (page, size) => {
    const limit = size ? +size : 10;
    const offset = page ? page * limit : 0;

    return { limit, offset };
};

const getPagingData = (data, page, limit) => {
    const { count, rows } = data;
    page = page ? +page : 0;
    const maxPage = Math.ceil(count / limit) - 1;
    return {
        count, maxPage, page, limit, rows
    }
};

const POSITIVE = 1, RECOVERED = 2, DEAD = 3;

class PatientsController {

    async index(req, res) {
        const name = req.params.name || '';
        const { page, size } = req.query;
        const { limit, offset } = getPagination(page, size);

        await Patients.findAndCountAll({
            limit: limit,
            offset: offset,
            where: {
                name: {
                    [Op.like]: `%${name}%`
                }
            },
            include: [{
                model: Status,
                as: 'status',
                attributes: {
                    exclude: ['createdAt', 'updatedAt']
                },
            }],
            attributes: {
                exclude: ['status_id']
            }
        }).then(data => {
            return res.send({ status: "success", data: getPagingData(data, page, limit) })
        }).catch(err => {
            return res.status(500).send({
                status: "error",
                message: err.message
            });
        });
    }


    async positive(req, res) {
        return await new PatientsController().findByStatus(req, res, POSITIVE).then(data => {
            return data
        }).catch(err => {
            return err
        });
    }

    async recovered(req, res) {
        return await new PatientsController().findByStatus(req, res, RECOVERED).then(data => {
            return data
        }).catch(err => {
            return err
        });
    }

    async dead(req, res) {
        return await new PatientsController().findByStatus(req, res, DEAD).then(data => {
            return data
        }).catch(err => {
            return err
        });
    }
    async findByStatus(req, res, statusId) {
        const { page, size } = req.query;
        const { limit, offset } = getPagination(page, size);

        return Patients.findAndCountAll({
            limit: limit,
            offset: offset,
            where: { status_id: statusId },
            include: [{
                model: Status,
                as: 'status',
                attributes: {
                    exclude: ['createdAt', 'updatedAt']
                },
            }],
            attributes: {
                exclude: ['status_id']
            }
        }).then(data =>
            res.send({ status: "success", data: getPagingData(data, page, limit) })
        ).catch(err => res.status(500).send({ status: "error", message: err.message }));
    }

    async show(req, res) {
        await Patients.findByPk(req.params.id, {
            include: [{
                model: Status,
                as: 'status',
                attributes: {
                    exclude: ['createdAt', 'updatedAt']
                },
            }],
            attributes: {
                exclude: ['status_id']
            }
        }).then(patients => {
            if (!patients) return res.status(404).send({ status: "error", message: "Patients Not Found" });

            return res.status(200).send({ status: "success", data: patients });
        }).catch(err => {
            return res.status(500).send({ status: "error", message: err.message });
        });
    }
    async store(req, res) {
        const errors = validationResult(req);
        if (!errors.isEmpty()) return res.status(400).json({ status: "error", errors: errors.array() });
        
        const { name, phone, address, status_id, in_date_at, out_date_at } = req.body;
        
        Status.findByPk(status_id).then(data => {if (!data) return res.status(404).send({ status: "error", message: `Status id ${status_id} Not Found` });})

        return Patients.create({
            name, phone, address, status_id, in_date_at, out_date_at
        })
            .then((data) => res.status(201).send({ status: "success", data }))
            .catch(err => res.status(500).send({ status: "error", message: err.message }));
    }

    async update(req, res) {
        await Patients.findByPk(req.params.id).then(patients => {
            if (!patients) return res.status(404).send({ status: "error", message: "Patients Not Found" });

            const errors = validationResult(req);
            if (!errors.isEmpty()) return res.status(400).json({ status: "error", errors: errors.array() });

            const { name, phone, address, status_id, in_date_at, out_date_at } = req.body;
            return patients.update({
                name: name || patients.name,
                phone: phone || patients.phone,
                address: address || patients.address,
                status_id: status_id || patients.status_id,
                in_date_at: in_date_at || patients.in_date_at,
                out_date_at: out_date_at || patients.out_date_at
            })
                .then((data) => res.status(200).send({ status: "success", data }))
                .catch(err => res.status(500).send({ status: "error", message: err.message }));
        }).catch(err => {
            return res.status(500).send({ status: "error", message: err.message });
        });
    }

    async destroy(req, res) {
        await Patients.findByPk(req.params.id).then(patients => {
            if (!patients) return res.status(404).send({ status: "error", message: "Patients Not Found" });

            return patients.destroy()
                .then((data) => res.status(200).send({ status: "success", data }))
                .catch(err => res.status(500).send({ status: "error", message: err.message }));
        }).catch(err => {
            return res.status(500).send({ status: "error", message: err.message });
        });
    }
}
// object
const objPatients = new PatientsController();

// export
module.exports = objPatients;