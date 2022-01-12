// TODO 4: SETUP CONTROLLER
const Status = require('../models').Status;

class StatusController {
    async index(req, res) {
        let response = {};

        const status = await Status.findAll();
        if (status.length > 0) {
            response = {
                message: "Get all status",
                data: status

            };
            return res.status(200).json(response);
        }

        response = { message: "Statuses is empty", data: [] };
        return res.status(200).json(response);
    }
}

// object
const objStatus = new StatusController();

// export
module.exports = objStatus;