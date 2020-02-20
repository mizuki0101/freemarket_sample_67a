
$(document).ready(function() {
      $('#btn').click(function() {
          var val1st = $('#area').val();
          if (!val1st) {
              alert("テキストが入力されていません。")
              return false;
          }
      });
  });
  