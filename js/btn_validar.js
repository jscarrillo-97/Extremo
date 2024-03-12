$("#btnAgregarRegistro").click(function () {
  Swal.fire({
    position: "center",
    icon: "success",
    title: "Tu registro se agrego",
    showConfirmButton: false,
    timer: 1200,
  });
});

$("#btnCancelar").click(function () {
  Swal.fire({
    title: "cancelar",
    position: "center",
    icon: "error",
    text: "Estas seguro que deseas cancelar el registro",
    showConfirmButton: false,
    timer: 60000,
  });
});
