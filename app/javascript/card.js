const pay = () => {
  //  PAY.JPテスト公開鍵
  Payjp.setPublicKey(process.env.PAYJP_PUBLIC_KEY);

  // 入力フォームの内容を変数に
  const form = document.getElementById("charge-form");
  form.addEventListener("submit", (e) => {

    // 元からsubmitボタンに設定されているイベントの阻止
    e.preventDefault();

    // フォーム情報を取得、FormDataオブジェクト(フォームに入力された値を取得できるオブジェクト)として生成
    const formResult = document.getElementById("charge-form");
    const formData = new FormData(formResult);

    // クレジットカードの情報を変数cardに代入
    const card = {
      number: formData.get("order_form[number]"),
      exp_month: formData.get("order_form[exp_month]"),
      exp_year: `20${formData.get("order_form[exp_year]")}`,
      cvc: formData.get("order_form[cvc]"),
    };

    // PAYJPからのレスポンス、ステータスコードを受け取った後に処理
    Payjp.createToken(card, (status, response) => {
      if (status == 200) {

        const token = response.id;

        // トークンの値をHTMLのinput要素へ
        const renderDom = document.getElementById("charge-form");
        const tokenObj = `<input value=${token} type="hidden" name='token' >`;
        renderDom.insertAdjacentHTML("beforeend", tokenObj);
      }
      // フォームの情報を削除
      document.getElementById("card-number").removeAttribute("name");
      document.getElementById("card-exp-month").removeAttribute("name");
      document.getElementById("card-exp-year").removeAttribute("name");
      document.getElementById("card-cvc").removeAttribute("name");

      // サーバーサイドに送信
      document.getElementById("charge-form").submit();
    });
  });
};

// payページを読み込んだ時に実行する
window.addEventListener("load", pay);