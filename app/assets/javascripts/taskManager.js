$(document).ready(function() {



  $("#completed-tasks").click(function () {
    var allCompleteTaskDivs = $("[id*='task-complete']").each(function (i, el) {
    }).parent('div');
    $(allCompleteTaskDivs).toggle();
  });

  $("#incomplete-tasks").click(function () {
    var allIncompleteTaskDivs = $("[id*='task-incomplete']").each(function (i, el) {
    }).parent('div');
    $(allIncompleteTaskDivs).toggle();
  });
  // $("#completed-tasks").click(function () {
  //   var allStatusSets = $("[id*='task-status']").each(function (i, el) {
  //     if(this.textContent == ('Task Status: incomplete')) {
  //       $(this).parent('div').fadeOut();
  //     }
  //   });
  // });

  $("#incomplete-tasks").click(function () {
    var allStatusSets = $("[id*='task-status']").each(function (i, el) {
      if(this.textContent == ('Task Status: complete')) {
        $(this).parents('div').fadeOut();
      }
    });
  });
});



// function editIdea(idea) {
//   $(idea).find('.edit').on('click', function () {
//     var $idea = $(this).parents('.idea')
//     var $form = $(this).siblings('.edit-idea-form');
//
//     if ($form.is(':hidden')) {
//       var title = $idea.find('h4').text();
//       var body = $idea.find('h5').text();
//       $form.find('.idea-title').val(title);
//       $form.find('.idea-body').val(body);
//     }
//     $form.toggle()
//   });
// }
