var LogIn = function() {
  $('#log_in').on('submit', function(event) {
    event.preventDefault();
    
    var log_in_array = $(this).serializeArray();
    var email = log_in_array[0].value
    var password = log_in_array[1].value

    var data = {email: email, password: password}

    $.post('/log_in', data, function(response) {
      $('body').replaceWith(response);
    });
  });
};