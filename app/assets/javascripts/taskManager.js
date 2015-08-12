$(document).ready(function() {

  $("#completed-tasks").click(function() {
    $("[data-status='complete']").toggle();
  });

  $("#incomplete-tasks").click(function() {
    $("[data-status='incomplete']").toggle();
  });

  $("#future-tasks").click(function() {
    $(".task-element").toggleClass("hidden");
  });

  $('select').on('change', function(event) {
    event.preventDefault();
    var value = $(event.currentTarget).val()
    var taskId = $(this.parentElement).attr('data-id')
    var listId = $(this.parentElement).attr('data-list-id')
    $.ajax({
      type: 'POST',
      url: '/change',
      data: { task: {task_id: taskId, status: value }}
    })
  });

  $("#filter-title").keyup(function(){
    var text = $(this).val()
    if (text == "") {
      $(".task-title").each(function(){
        $(this.parentElement).fadeIn();
      });
    } else {
      $(".task-title").each(function(){
        if ($(this).text().search(new RegExp(text, "i")) < 0) {
            $(this.parentElement).fadeOut();
        } else {
            $(this).show();
        }
      });
    }
  });

  $("#filter-due-date").keyup(function(){
    var text = $(this).val()
    if (text == "") {
      $(".due-date").each(function(){
        $(this.parentElement).fadeIn();
      });
    } else {
      $(".due-date").each(function(){
        if ($(this).text().search(new RegExp(text, "i")) < 0) {
            $(this.parentElement).fadeOut();
        } else {
            $(this).show();
        }
      });
    }
  });

  $("#filter-status").keyup(function(){
    var text = $(this).val()
    if (text == "") {
      $(".status").each(function(){
        $(this.parentElement).fadeIn();
      });
    } else {
      $(".status").each(function(){
        if ($(this).text().search(new RegExp(text, "i")) < 0) {
            $(this.parentElement).fadeOut();
        } else {
            $(this).show();
        }
      });
    }
  });
});
