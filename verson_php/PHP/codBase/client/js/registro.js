$(document).ready(function(){
  $('form').on('submit', function(event){
      event.preventDefault();
      var form_data = new FormData();
      form_data.append('fullname', $('#name').val());
      form_data.append('correo', $('#mail').val());
      form_data.append('password', $('#pass').val());
      form_data.append('birthday', $('#birthday').val());
      $.ajax({
        url: '../server/create_user.php',
        cache: false,
        processData: false,
        contentType: false,
        data: form_data,
        type: 'POST',
        success: function(msg){
          if (msg == "OK") {
            alert("Usuario creado correctamente");
            $("#name").val("");
            $("#mail").val("");
            $("#pass").val("");
            $("#birthday").val("");
            window.location.href = 'index.html';
          }else {
            alert(msg+" no se pudo crear el usuario");
            $("#name").val("");
            $("#mail").val("");
            $("#pass").val("");
            $("#birthday").val("");
          }
        },
        error: function(){
          alert("error en la comunicación con el servidor :V");
        }
      });
    });

});
