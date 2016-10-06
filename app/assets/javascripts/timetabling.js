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

function showDiscipline(path){
    $('.dis').show();
    $.ajax({
        url: path,
        method: 'GET',
        success: function(data,stats){
           var list_subject=$('.dis ul');
           data.forEach(function(subject){
               list_subject.append('<li id="'+subject.id+'" onclick="updateCoursed(this,'+"'"+path+"'"+')">'+subject.name+'</li>');
           });
            },
        error: function(){
              console.log("error");
            }
    })
}
function removeDiscipline(){}
function updateCoursed(element,path){
    var id = element.id;
    $.ajax({
        url: path+".json",
        method: 'POST',
        data: {'subject_id': id},
        success: function(message,stats){
            $(element).remove();
            $('ul.disok').append(element);
            console.log(message);
            console.log(stats);
        },
        error: function(e){ console.log(e);}
    });
    console.log(id);
}
