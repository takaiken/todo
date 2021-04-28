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
      