$(document).on('turbolinks:load',function() {
  let length = $('.previews__box').length
  $(".input-box").css('width',`calc(100% - 20% * ${length})`);

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
  
  $('#previews').on('change',function() {
  })

  $('#image-box').on('change', '.js-file', function(e) {
    lastIndex = $('.js-file_group:last').data('index');
  // fileIndex.splice(0, lastIndex);
    let fileIndex = $(".previews__box").length
   
    const targetIndex = $(this).parent().parent().data('index');
    // ファイルのブラウザ上でのURLを取得する
    const file = e.target.files[0];
    const blobUrl = window.URL.createObjectURL(file);
    // 該当indexを持つimgがあれば取得して変数imgに入れる(画像変更の処理)
    if (img = $(`img[data-index="${targetIndex}"]`)[0]) {
      img.setAttribute('src', blobUrl);
    } else {  // 新規画像追加の処理
      $('ul.prev').append(buildImg(targetIndex, blobUrl));
      // fileIndexの先頭の数字を使ってinputを作る
      $('.input-box').append(buildFileField(fileIndex+1));
    }
    
    var length = $('.previews__box').length;
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
    $(`.js-file[name="product[images_attributes][${targetIndex}][src]"]`).after(`<input class="cropImage" id="${targetIndex}" type="text" name="product[images_attributes][${targetIndex}][croped_image]">`);
    img = $(`img[data-index="${targetIndex}"]`);
    const file = img.attr('src');
    $image.cropper('destroy').removeAttr('src');
      $image.attr('src',"");
      $image.attr('src',file);
      $('.modal-dialog').css('display','');
      $('.modal').css('display','');
      $(".modalbg").css('display',``);

      $cropModal.on('shown.bs.modal',()=>
        $image.cropper(options));
        $cropModal.on('click', () => {
          $image.cropper(options);
        });
        $('.btn-save').click(function() {
          let i = $(this).data('index');
          imgCropping(targetIndex);
          $('.modal-dialog').css('display','none');
          $('.modal').css('display','none');
          $(".modalbg").css('display',`none`);

        });
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
      $(".js-file_group:last-child").css('display',``);
    }
    if($('.previews__box').length < 10){
      $(".input-box:last-child").css('display',``);
    }
  });
  $('.btn-return').on('click', function() {
    $('.modal').css('display','none');
    $(".modalbg").css('display',`none`);
  });

  
  if(length >= 5 && length <= 10){
    length -= 5;
    $(".input-box").css('width',`calc(100% - 20% * ${length})`);
  }
  const loadlength = $('.previews__box').length
  if(loadlength == 10){
    $(".input-box").css('display',`none`);
  }
  
  let $image = $('#imageModal'),
    $img_field = $('#image-box'),
    $croppedImage = $('#croppedImage'),
    $cropModal = $('#cropModal'),
    $beforeUpload = $('#beforeUpload'),
    $button = $('#btn-save'),
    $dataX = $('.dataX'),
    $dataY = $('.dataY'),
    $dataWidth = $('.dataWidth'),
    $dataHeight = $('.dataHeight');

  let options = {
    dragmode: 'crop',
    aspectRatio: 3/4,
    restore: false,
    guides: false,
    center: false,
    highlight: true,
    cropBoxMovable: true,
    cropBoxResizable: true,
    modal: true,
    crop: function(e) {
      $dataX.val(Math.round(e.detail.x));
      $dataY.val(Math.round(e.detail.y));
      $dataWidth.val(Math.round(e.detail.width));
      $dataHeight.val(Math.round(e.detail.height));
    }
  };
  
  // modalを閉じたとき、cropper要素を初期化
  $cropModal.on('hidden.bs.modal',function() {
    $image.cropper('destroy').removeAttr('src');
    let $cropperContainer = $('.cropper-container');
    $cropperContainer.remove();
  });

  function imgCropping(target) {
    $beforeUpload.hide();
    let croppedData = $image.cropper('getCroppedCanvas').toDataURL();
    $croppedImage.attr('src', croppedData);
    let blob = Base64toBlob(croppedData);
    $(`input[id="${target}"]`).val(croppedData);
    $(`img[data-index="${target}"]`).attr('src',croppedData);
    
  }
  function Base64toBlob(base64){
    // カンマで分割して以下のようにデータを分ける
    // tmp[0] : データ形式（data:image/png;base64）
    // tmp[1] : base64データ（iVBORw0k～）
    var tmp = base64.split(',');
    // base64データの文字列をデコード
    var data = atob(tmp[1]);
    // tmp[0]の文字列（data:image/png;base64）からコンテンツタイプ（image/png）部分を取得
    var mime = tmp[0].split(':')[1].split(';')[0];
      //  1文字ごとにUTF-16コードを表す 0から65535 の整数を取得
    var buf = new Uint8Array(data.length);
    for (var i = 0; i < data.length; i++) {
        buf[i] = data.charCodeAt(i);
    }
    // blobデータを作成
	var blob = new Blob([buf], { type: mime });
    return blob;
  }
});