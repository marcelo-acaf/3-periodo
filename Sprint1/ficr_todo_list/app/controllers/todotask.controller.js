const db = require("../models");
const TodoTask = db.tasks;
const Op = db.Sequelize.Op;


exports.create = (req, res) => {
  
  if (!req.body.nome_tarefa) {
    res.status(400).send({
      message: "Não pode ser vazio!"
    });
    return;
  }

  
  const tarefa = {
    nome_tarefa: req.body.nome_tarefa,
    descricao_tarefa: req.body.descricao_tarefa,
    status_tarefa: req.body.status_tarefa,
    data_criacao: req.body.data_criacao
  };

  
  TodoTask.create(tarefa)
    .then(data => {
      res.send(data);
    })
    .catch(err => {
      res.status(500).send({
        message:
          err.message || "Algo deu erro ao criar a tarefa."
      });
    });
};


exports.findAll = (req, res) => {
  const nome_tarefa = req.query.nome_tarefa;
  var condition = nome_tarefa ? { nome_tarefa: { [Op.like]: `%${nome_tarefa}%` } } : null;

  TodoTask.findAll({ where: condition })
    .then(data => {
      res.send(data);
    })
    .catch(err => {
      res.status(500).send({
        message:
          err.message || "Algo deu errado ao listar as tarefas."
      });
    });
};


exports.findOne = (req, res) => {
  const id = req.params.id;

  TodoTask.findByPk(id)
    .then(data => {
      res.send(data);
    })
    .catch(err => {
      res.status(500).send({
        message: "Erro ao buscar pela tarefa id=" + id
      });
    });
};


exports.update = (req, res) => {
  const id = req.params.id;

  TodoTask.update(req.body, {
    where: { id: id }
  })
    .then(num => {
      if (num == 1) {
        res.send({
          message: "Tarefa atualizada"
        });
      } else {
        res.send({
          message: `Não foi possível editar a tarefa id=${id}.`
        });
      }
    })
    .catch(err => {
      res.status(500).send({
        message: "Erro ao editar a tarefa id=" + id
      });
    });
};


exports.delete = (req, res) => {
  const id = req.params.id;

  TodoTask.destroy({
    where: { id: id }
  })
    .then(num => {
      if (num == 1) {
        res.send({
          message: "TodoTask was deleted successfully!"
        });
      } else {
        res.send({
          message: `Cannot delete TodoTask with id=${id}. Maybe TodoTask was not found!`
        });
      }
    })
    .catch(err => {
      res.status(500).send({
        message: "Could not delete TodoTask with id=" + id
      });
    });
};

