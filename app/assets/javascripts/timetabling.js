function update(subjectId, timetablingPath, academicInformation){
    console.log(element);
    $.ajax({
        url: timetablingPath,
        method: 'POST',
        data: {'table_position':element.getAttribute('id'),
               'subject_id': subjectId,
               'academic_information_id': academicInformation },
        success: function(data){
            element.textContent=data.subject_name;
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
