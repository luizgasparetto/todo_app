class AppApiConstants {
  static String baseUrl = 'https://fteam.pagekite.me';

  // End-points
  static String updateTodoEndPoint(int id) => '/todo/updateTodo?id=$id';
  static String deleteTodoEndPoint(int id) => '/todo/deleteTodo?id=$id';
  static String refreshTokenEndPoint(String refresh) => '/auth/refreshToken?refreshToken=$refresh';
  static String todoListEndPoint = '/todo/todoList';
  static String loginEndPoint = '/auth/login';
  static String registerEndPoint = '/auth/registerAndAuth';
  static String createTodoPoint = '/todo/createTodo';
}
