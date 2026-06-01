import 'product.dart';

List<Usuario> usuarios = [
  Usuario("admin", "1234"),
  Usuario("juan", "1111"),
  Usuario("maria", "2222"),
  Usuario("pedro", "3333"),
  Usuario("ana", "4444"),
  Usuario("luis", "5555"),
  Usuario("sofia", "6666"),
  Usuario("carlos", "7777"),
  Usuario("lucas", "8888"),
  Usuario("laura", "9999"),
];

List<Product> productos = [];

bool login(String user, String pass) {
  return usuarios.any(
    (u) => u.username == user && u.password == pass,
  );
}

void agregarProducto(Product p) {
  productos.add(p);
}
