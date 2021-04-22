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
        $('.js-messages li').remove();

        $(data).each(function (i, message) {
          $('.js-messages').append(`<li class="message"><a href="/messages/${message.id}">${message.title}</a></li>`
            );
        });
      })
    });
  });
}); // このコードを追加する