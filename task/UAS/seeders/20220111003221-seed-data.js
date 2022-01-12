'use strict';
const bcrypt = require('bcryptjs');


module.exports = {
  up: async (queryInterface, Sequelize) => {
    /**
     * Add seed commands here.
     *
     * Example:
     * await queryInterface.bulkInsert('People', [{
     *   name: 'John Doe',
     *   isBetaMember: false
     * }], {});
    */
    let statuses = await queryInterface.bulkInsert('Statuses', [{
      name: 'POSITIVE',
      createdAt: new Date(),
      updatedAt: new Date()
    }, {
      name: 'RECOVERED',
      createdAt: new Date(),
      updatedAt: new Date()
    }, {
      name: 'DEAD',
      createdAt: new Date(),
      updatedAt: new Date()
    }], { returning: true });

    // Libarary Faker depcreated
    // const patients = [];
    // const faker = require('faker');
    // for (let i = 0; i < statuses.length; i++) {
    //   let status = statuses[i];
    //   items.push({
    //     name: faker.name.findName(),
    //     phone: faker.name.phoneNumber(),
    //     address: faker.name.cityName(),
    //     status_id: status.id,
    //     in_date_at: new Date(),
    //     out_date_at: status.id == 1 ? null : new Date(),
    //     created_at: new Date(),
    //     updated_at: new Date(),
    //   });
    // }
    // queryInterface.bulkInsert('Patients', patients);

    await queryInterface.bulkInsert('Users', [{
      name: 'Evry Nazyli Ciptanto',
      email: 'admin@gmail.com',
      password: bcrypt.hashSync('admin', 8),
      createdAt: new Date(),
      updatedAt: new Date()
    }], {});
  },

  down: async (queryInterface, Sequelize) => {
    /**
     * Add commands to revert seed here.
     *
     * Example:
     * await queryInterface.bulkDelete('People', null, {});
     */
  }
};
