$(document).on('turbolinks:load',function() {


  const buildFileField = (num)=> {
    const html = `<div data-index="${num}" class="js-file_group">
                    <label for="product_images_attributes_${num}_src"><p>ドラッグアンドドロップ
                    <br>
                    またはクリックしてファイルをアップロード</p>
                    <input class="js-file" type="file"
                    name="product[images_attributes][${num}][src]"
                    id="product_images_attributes_${num}_src"></label>
                </div>
                `;
    return html;
  }
  // プレビュー用のimgタグを生成する関数
  const buildImg = (index, url)=> {
    const html = `<li class="previews__box"><div class="image-box"><img data-index="${index}" src="${url}" width="100px" height="110px"></div><div class="btn-box"><div class="js-change">編集</div><div class="js-remove">削除</div></div></li>`;
    return html;
  }
  // file_fieldのnameに動的なindexをつける為の配列
  let fileIndex = [1,2,3,4,5,6,7,8,9,10];
  // 既に使われているindexを除外
  lastIndex = $('.js-file_group:last').data('index');
  fileIndex.splice(0, lastIndex);

  $('#image-box').on('change', '.js-file', function(e) {
    const targetIndex = $(this).parent().data('index');
    // ファイルのブラウザ上でのURLを取得する
    const file = e.target.files[0];
    const blobUrl = window.URL.createObjectURL(file);
    // 該当indexを持つimgがあれば取得して変数imgに入れる(画像変更の処理)
    if (img = $(`img[data-index="${targetIndex}"]`)[0]) {
      img.setAttribute('src', blobUrl);
    } else {  // 新規画像追加の処理
      $('ul.prev').append(buildImg(targetIndex, blobUrl));
      // fileIndexの先頭の数字を使ってinputを作る
      $('.input-box').append(buildFileField(fileIndex[1]));
      fileIndex.shift();
      // 末尾の数に1足した数を追加する
      fileIndex.push(fileIndex[fileIndex.length - 1] + 1);
    }
    
    let length = $('.previews__box').length;
    $(".input-box").css('width',`calc(100% - 20% * ${length})`);
    if(length >= 5 && length <= 10){
      length -= 5;
      $(".input-box").css('width',`calc(100% - 20% * ${length}`);
    }
    
    if($('.previews__box').length == 10){
      $(".input-box").css('display','none');
      
    }
    
  });
  $('#image-box').on('click', '.js-change', function() {
    const targetIndex = $(this).parent().parent().find('img').data('index');
    $(`input[name="product[images_attributes][${targetIndex}][src]"]`).trigger('click');
  });
  $('#image-box').on('click', '.js-remove', function() {
    const targetIndex = $(this).parent().parent().find('img').data('index');
    // 該当indexを振られているチェックボックスを取得する
    const hiddenCheck = $(`input[data-index="${targetIndex}"].hidden-destroy`);
    // もしチェックボックスが存在すればチェックを入れる
    if (hiddenCheck){
      hiddenCheck.prop('checked', true);
    } 
    $(this).parent().parent().remove();
    $(`div[data-index="${targetIndex}"]`).remove();
    $(`.js-file_group[data-index="${targetIndex}"]`).parent().remove();
    $(this).remove();
    let length = $('.previews__box').length;
    $(".input-box").css('width',`calc(100% - 20% * ${length})`);
    if(length >= 5 && length <= 10){
      length -= 5;
      $(".input-box").css('width',`calc(100% - 20% * ${length}`);
    }
    // 画像入力欄が0個にならないようにしておく
    if ($('.js-file').length == 0) $('#image-box').append(buildFileField(fileIndex[0]));
    if(length < 10){
      $(".input-box:last-child").css('display',``);
    }
  });

  let length = $('.previews__box').length
  $(".input-box").css('width',`calc(100% - 20% * ${length})`);
  if(length >= 5 && length <= 10){
    length -= 5;
    $(".input-box").css('width',`calc(100% - 20% * ${length})`);
  }
  const loadlength = $('.previews__box').length
  if(loadlength == 10){
    $(".input-box").css('display',`none`);
  }
  
});