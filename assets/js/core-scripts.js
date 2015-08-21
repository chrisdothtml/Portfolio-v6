var animSpeed, scrollSpeed, scrollSpeedSlow;

scrollSpeed = 750;

scrollSpeedSlow = 900;

animSpeed = 200;

$(window).bind("load", function() {
  if ($('#bad-ie').length < 1) {
    $('body').removeClass('loading');
    return $('#main-overlay').remove();
  }
});

$(document).ready(function() {
  $(window).scroll(function() {
    if ($(window).scrollTop() > 0) {
      return $('header').addClass('scrolled');
    } else {
      return $('header').removeClass('scrolled');
    }
  });
  $(window).scroll();
  $('#nav-toggle').click(function() {
    return $('header').toggleClass('open');
  });
  $('nav ul li,#nav-overlay').click(function() {
    return $('header').removeClass('open');
  });
  $(window).scroll(function() {
    if ($(window).scrollTop() > 200) {
      return $('#back-to-top').addClass('show');
    } else {
      return $('#back-to-top').removeClass('show');
    }
  });
  $('#back-to-top,#main-logo').click(function() {
    return $.scrollTo('#home', scrollSpeed);
  });
  $('#contact-me').click(function() {
    return $.scrollTo('#contact', scrollSpeedSlow);
  });
  return $('#contact-submit').click(function(e) {
    var error, errors;
    e.preventDefault();
    clearFlags();
    error = false;
    errors = '#contact-submit';
    if ($('#contact-name').val().length < 1) {
      error = true;
      errors += ',#contact-name';
    }
    if ($('#contact-email').val().length < 1 || !isEmail($('#contact-email').val())) {
      error = true;
      errors += ',#contact-email';
    }
    if ($('#contact-subject').val().length < 1) {
      error = true;
      errors += ',#contact-subject';
    }
    if ($('#contact-message').val().length < 21) {
      error = true;
      errors += ',#contact-message';
    }
    if (error === true) {
      $(errors).addClass('error');
    } else {
      $.post('inc/php/sendMail.php', {
        "name": $('#contact-name').val(),
        "email": $('#contact-email').val(),
        "subject": $('#contact-subject').val(),
        "message": $('#contact-message').val()
      }, function(data) {
        $('#contact-submit').addClass('success');
        return clearInputs();
      });
    }
    return setTimeout(removeClasses, 3000);
  });
});
