var clearFlags, clearInputs, isEmail, removeClasses;

isEmail = function(email) {
  var template;
  template = /^([a-zA-Z0-9_.+-])+\@(([a-zA-Z0-9-])+\.)+([a-zA-Z0-9]{2,4})+$/;
  return template.test(email);
};

clearFlags = function() {
  return $('#contact-form').find('input,textarea').removeClass('error');
};

removeClasses = function() {
  return $('#contact-submit').removeClass('error').removeClass('success');
};

clearInputs = function() {
  return $('#contact-form').find('input,textarea').val('');
};
