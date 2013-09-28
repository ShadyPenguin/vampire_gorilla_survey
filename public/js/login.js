var LogIn = function() {
  $('#log_in').on('submit', function(event) {
    event.preventDefault();
    
    var log_in_array = $(this).serializeArray();
    var email = log_in_array[0].value
    var password = log_in_array[1].value

    var data = {email: email, password: password}

    var errors = []
    var validations_passed = true
    // javascript form validations
    if (!/\S{3,}@\S{3,}\.\S{2,}/.exec(email)) {
      errors.push('<li>Email is not a valid format</li>')
      validations_passed = false
    }
    if (!/\S{6,}/.exec(password)) {
      errors.push('<li>Password must be at least 6 characters</li>')
      validations_passed = false
    }

    if (validations_passed) {
      $.post('/log_in', data, function(response) {
        $('body').replaceWith(response);
      });
    } else {
      $('.errors').html(errors);
    }
  });
};