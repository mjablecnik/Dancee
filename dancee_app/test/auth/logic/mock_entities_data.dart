import 'package:dancee_app/entities/user.dart';

final expectedLoginUser = User(
  userName: 'emilys',
  firstName: 'Emily',
  lastName: 'Johnson',
  token:
  'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwidXNlcm5hbWUiOiJlbWlseXMiLCJlbWFpbCI6ImVtaWx5LmpvaG5zb25AeC5kdW1teWpzb24uY29tIiwiZmlyc3ROYW1lIjoiRW1pbHkiLCJsYXN0TmFtZSI6IkpvaG5zb24iLCJnZW5kZXIiOiJmZW1hbGUiLCJpbWFnZSI6Imh0dHBzOi8vZHVtbXlqc29uLmNvbS9pY29uL2VtaWx5cy8xMjgiLCJpYXQiOjE3MjczNTc3NzEsImV4cCI6MTcyNzM2MTM3MX0.-_tQ6x_6jp_8Q8g5yGaYSdB57M81jpKlo5O3zNpJTcs',
);

final expectedLoggedUser = User(userName: 'emilys', firstName: 'Emily', lastName: 'Johnson');
