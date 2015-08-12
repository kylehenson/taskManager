$(document).ready(function() {
  defaultTasks();

  function defaultTasks() {
    $("[data-status='complete']").hide();
  };

  $("#completed-tasks").click(function() {
    $("[data-status='complete']").toggle();
  });

  $("#incomplete-tasks").click(function() {
    $("[data-status='incomplete']").toggle();
  });

  $("#future-tasks").click(function() {
    $(".task-element").toggleClass("hidden");
  });
  

});
