const jsonResponseError = [
  {'cod': '404', 'message': 'city not found', 'city': 'São Paulo'}
];

const jsonResponseGetAllTask = [
  {
    'id': 2,
    'name': 'teste tarefa',
    'done': false,
    'createAt': '1969-07-20T20:18:04.000Z',
    'deadlineAt': '1969-07-20T20:18:04.000Z',
    'updateAt': '1969-07-20T20:18:04.000Z',
    'userId_fk': 1
  },
  {
    'id': 3,
    'name': 'teste tarefa 2',
    'done': false,
    'createAt': '1969-07-20T20:18:04.000Z',
    'deadlineAt': '1969-07-20T20:18:04.000Z',
    'updateAt': '1969-07-20T20:18:04.000Z',
    'userId_fk': 1
  }
];

const jsonResponseEditTask = {
  'id': 2,
  'name': 'teste tarefa',
  'done': false,
  'createAt': '1969-07-20T20:18:04.000Z',
  'deadlineAt': '1969-07-20T20:18:04.000Z',
  'updateAt': '1969-07-20T20:18:04.000Z',
  'userId_fk': 1
};

const jsonResponseCreateTask = {
  'id': 2,
  'name': 'teste tarefa',
  'done': false,
  'createAt': '1969-07-20T20:18:04.000Z',
  'deadlineAt': '1969-07-20T20:18:04.000Z',
  'updateAt': '1969-07-20T20:18:04.000Z',
  'userId_fk': 1
};

const jsonResponseRefreshToken = {
  'token':
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdWQiOlsiMTI3LjAuMC4xIl0sImV4cCI6MTY1NzU3MzE2NywiaWF0IjoxNjU3NDg2NzY3LCJpc3MiOiIxMjcuMC4wLjEvOTAwMSIsImp0aSI6IjEiLCJzdWIiOiIxIn0.r2t0-nlXzA3iAHS2A8Li6-g4732LGpnjshAUCbAHEsA',
  'tokenType': '',
  'refreshToken':
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdWQiOlsiMTI3LjAuMC4xIl0sImV4cCI6MTY1ODc4Mjc2NywiaWF0IjoxNjU3NDg2NzY3LCJpc3MiOiIxMjcuMC4wLjEvOTAwMSIsImp0aSI6IjEiLCJzdWIiOiIxIn0.9OljZV7XSC-EoYgfL9jbcXXfUXHLx_iZ1sfj4K6KYGk'
};
const jsonResponseRegister = {
  'id': 3,
  'name': 'teste teste',
  'email': 'teste2@teste.com',
  'token':
      'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE2NTY2NDQ1NTIsImlhdCI6MTY1NjU1ODE1MiwiaXNzIjoiMTI3LjAuMC4xLzkwMDEiLCJzdWIiOiIzIn0.bGdza2Z5ZHseh3XqguDDmRfqkdcxta_yYqZp4lMXZ6Y',
  'created_on': '2022-06-30T00:02:26.497763Z',
  'last_login': '2022-06-30T00:02:26.497763Z'
};

const jsonResponseLogin = {
  'id': 1,
  'name': 'teste teste',
  'email': 'teste@teste.com',
  'token':
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdWQiOlsiMTI3LjAuMC4xIl0sImV4cCI6MTY1NzU3MTI3OCwiaWF0IjoxNjU3NDg0ODc4LCJpc3MiOiIxMjcuMC4wLjEvOTAwMSIsImp0aSI6IjEiLCJzdWIiOiIxIn0.smo5vznuitQMkDRRfekiRbFrNrDBg1hkhzM4Y42HV9Y',
  'tokenType': 'Bearer',
  'refreshToken':
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdWQiOlsiMTI3LjAuMC4xIl0sImV4cCI6MTY1NzU3MTI3OCwiaWF0IjoxNjU3NDg0ODc4LCJpc3MiOiIxMjcuMC4wLjEvOTAwMSIsImp0aSI6IjEiLCJzdWIiOiIxIn0.smo5vznuitQMkDRRfekiRbFrNrDBg1hkhzM4Y42HV9Y',
  'created_on': '2022-06-29T22:46:50.988629Z',
  'last_login': '2022-07-10T17:27:41.510528Z'
};
const jsonResponseDeleteTask = {'message': 'tarefa deletada com sucesso'};
