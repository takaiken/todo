$(document).on('turbolinks:load', function () { // このコードを追加する
  $(function () {
    $('.js-text_field').on('keyup', function () {
      var title = $.trim($(this).val());
      $.ajax({
        type: 'GET',
        url: '/messages/searches',
        data: { title: title }, //("title=" + title),
        dataType: 'json'
      })
      .done(function (data) {
        $('').remove();

        $(data).each(function (i, task) {
          $('').append(`<li class="message"><a href="/tasks/${@task.id}">${@task.title}</a></li>`
            );
        });
      })
    });
  });
}); 