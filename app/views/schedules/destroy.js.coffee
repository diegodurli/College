$('tr#<%= @schedule.id %>').fadeOut()
$('div.alert').remove()
$('div#messages').append("<div class='alert alert-success'><a class='close' data-dismiss='alert'>×</a><div>Schedule was successfully destroyed.</div></div>")