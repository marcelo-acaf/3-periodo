module.exports = (sequelize, Sequelize) => {
  const TodoTask = sequelize.define("todo_taks", {
    nome_tarefa : {
      type: Sequelize.STRING, allowNull:false
    },
    descricao_tarefa: {
        type: Sequelize.TEXT
    },
    status_tarefa: {
        type: Sequelize.ENUM('Pendente', 'Em andamento', 'Conclui­da')
    },
    data_criacao:{
        type:Sequelize.DATE
    }
  });

  return TodoTask;
};
