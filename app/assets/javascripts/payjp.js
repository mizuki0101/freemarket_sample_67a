document.addEventListener(
  "DOMContentLoaded", e =>{
    if (document.getElementById("token_submit") != null) { //token_submitというidがnullの場合、下記コードを実行しない
      Payjp.setPublicKey("pk_test_269a4ce0c05b539828b95f72"); 
      let btn = document.getElementById("token_submit"); //IDがtoken_submitの場合に取得される
      btn.addEventListener("click", e => { 
        e.preventDefault();
        let card = {
          number: document.getElementById("card_number").value,
          cvc: document.getElementById("cvc").value,
          exp_month: document.getElementById("exp_month").value,
          exp_year: document.getElementById("exp_year").value,
        }; //入力されたデータを取得
        Payjp.createToken(card, (status, response) => {
          if (status === 200){
            $("#card_number").removeAttr("name");
            $("#cvc").removeAttr("name");
            $("#exp_month").removeAttr("name");
            $("#exp_year").removeAttr("name");
            $("#charge-form").append(
            $('<input type="hidden" name="payjp-token">').val(response.id));
            $("#charge-form").get(0).submit();
            alert("登録完了！！！"); 
          } else {
            alert("失敗やり直し"); 
          }
        });
      });
    }
  },
  false
);