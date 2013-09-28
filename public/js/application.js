$(document).ready(function() {
  $('#sign_up').on('submit', function(event) {
    event.preventDefault();

    
    var form_input = $('#sign_up').serializeArray();
    var username = form_input[0].value
    var email = form_input[1].value
    var password = form_input[2].value
    var validations_passed = true

    if (!/\S{3,}@\S{3,}\.\S{2,}/.exec(email)) {
      $('#errors').append('<li>Email is not a valid format</li>');
      validations_passed = false
    }
    if (!/\S{6,}/.exec(password)) {
      $('#errors').append('<li>Password must be at least 6 characters</li>');
      validations_passed = false
    }

    console.log($(this).serialize() );
    // if (validations_passed) {
    //   $.ajax({
    //     type: 'POST'
    //     url: '/sign_up'
    //   });
    // }

  });
});
