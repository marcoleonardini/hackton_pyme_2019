class Insume{

  String id;
  String nombre;
  int cantidad;
  String descripcion;
  String fechaComp;
  String fechaVen;
  double precio;
  String tipo;
  String proveedor;

  Insume({
    this.cantidad,
    this.descripcion,
    this.fechaComp,
    this.fechaVen,
    this.id,
    this.nombre,
    this.precio,
    this.tipo,
    this.proveedor
  });

  /*factory Product.fromSnapshot({DocumentSnapshot snapshot}){
    return Product(
      cantidad: snapshot.data['cantidad'].toInt(),
      descripcion: snapshot.data['descripcion'],
      fechaComp: snapshot.data['fecha_comp'],
      fechaVen: snapshot.data['fecha_ven'],
      id: snapshot.documentID.toString(),
      nombre: snapshot.data['nombre'],
      precio: snapshot.data['precio'].toDouble(),
      tipo: snapshot.data['tipo']
    );
  }*/
}