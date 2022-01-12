'use strict';
const {
  Model
} = require('sequelize');
module.exports = (sequelize, DataTypes) => {
  class Patients extends Model {
    /**
     * Helper method for defining associations.
     * This method is not a part of Sequelize lifecycle.
     * The `models/index` file will call this method automatically.
     */
    static associate(models) {
      // define association here
      this.belongsTo(models.Status, {
        foreignKey: 'status_id',
        as: 'status'
      });
    }
  };
  Patients.init({
    name: DataTypes.STRING,
    phone: DataTypes.STRING,
    address: DataTypes.TEXT,
    status_id: DataTypes.INTEGER,
    in_date_at: DataTypes.DATE,
    out_date_at: DataTypes.DATE
  }, {
    sequelize,
    modelName: 'Patients',
  });
  return Patients;
};