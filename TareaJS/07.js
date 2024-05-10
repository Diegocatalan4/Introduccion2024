function precioCompleto (precio, impuesto){
    precio + precio * impuesto;
}
let resultado = precioCompleto(19.90, 0.15)
console.log(resultado);