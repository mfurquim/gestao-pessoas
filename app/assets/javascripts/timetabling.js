function update(subjectId){
    console.log(element);
    $.ajax({
        url: '/users/1/update_t',
        method: 'POST',
        data: {'key':element.getAttribute('id'),
               'subject_id': subjectId},
        success: function(data){
            element.textContent=data.ok;
            console.log(data);
        },
        error: function(){
            console.log('error');
        }
    });
    $("#myModal").modal('hide');
    
}
function getElement(elementFunction){
    element=elementFunction;
}
