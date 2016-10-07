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
    $('button#add').hide();
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
            a=element
            var alertMessage = $('.alert');
            alertMessage.show();
            alertMessage.removeClass('alert-info');
            alertMessage.removeClass('alert-warning');
            if(stats === "success"){
                alertMessage.text(message.message);
                alertMessage.addClass('alert-info');
                $(element).attr('onclick','').unbind('click');
                $(element).remove();
                $('ul.disok').append(element);
            }else{
                alertMessage.addClass('alert-warning');
                alertMessage.text("Não foi possível adicionar essa disciplina");
            }
            setTimeout(function(){
                alertMessage.hide();
            },3000);
            console.log(message);
        },
        error: function(e){ console.log(e);}
    });
    console.log(id);
}
