$(document).on('change',':file', function(){
  $('#error-image').hide();
  var inputField = $(this);
  var fileName = inputField.val().replace(/\\/g, '/').replace(/.*\//,'');
  var partsName = fileName.split('.');
  var extension = partsName[partsName.length-1];
  if (extension === "jpg" || extension === "png" ){
    $('#image-name').html(fileName);
  }else{
    $('#error-image').html('Formato diferente de <b>png</b> e <b>jpg</b> para'+
                          ' o arquivo: '+ fileName);
    $('#error-image').show();
  }
});
