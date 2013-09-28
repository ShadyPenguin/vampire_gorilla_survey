var CreateUser = function() {
  $('#sign_up').on('submit', function(event) {
    event.preventDefault();

    var form_input = $('#sign_up').serializeArray();
    // pulling data from serialize array
    var username = form_input[0].value
    var email = form_input[1].value
    var password = form_input[2].value

    var validations_passed = true
    // javascript form validations
    if (!/\S{3,}@\S{3,}\.\S{2,}/.exec(email)) {
      $('#errors').append('<li>Email is not a valid format</li>');
      validations_passed = false
    }
    if (!/\S{6,}/.exec(password)) {
      $('#errors').append('<li>Password must be at least 6 characters</li>');
      validations_passed = false
    }

    var data = {username: username, email: email, password: password}
    // post request to add user to DB, replace screen with new http
    if (validations_passed) {
      $.post('/sign_up', data, function(response) {
        $('body').replaceWith(response)
      });
    }
  });
};