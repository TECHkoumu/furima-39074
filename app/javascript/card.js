const pay = () => {
  const payjp = Payjp(process.env.PAYJP_PUBLIC_KEY);// PAY.JPテスト公開鍵 Payjpインスタンス生成
  const elements = payjp.elements(); //elementsインスタンス生成
  const numberElement = elements.create('cardNumber'); //カード番号入力フォーム作成
  const expiryElement = elements.create('cardExpiry'); //有効期限入力フォーム作成
  const cvcElement = elements.create('cardCvc'); //CVC入力フォーム作成

  numberElement.mount('#card-number'); //card-numberというid属性の要素とフォームを置き換える
  expiryElement.mount('#card-expiry');//card-expiryというid属性の要素とフォームを置き換える
  cvcElement.mount('#card-cvc');//card-cvcというid属性の要素とフォームを置き換える

  const submit = document.getElementById("button");
  submit.addEventListener("click", (e) => {
    e.preventDefault();
    payjp.createToken(numberElement).then(function (response) {
      if (response.error) {
      } else {
        const token = response.id;
        const renderDom = document.getElementById("charge-form");
        const tokenObj = `<input value=${token} name='token' type="hidden">`;
        renderDom.insertAdjacentHTML("beforeend", tokenObj);
      }
      numberElement.clear();
      expiryElement.clear();
      cvcElement.clear();
      document.getElementById("charge-form").submit();
    });
  });
};

window.addEventListener("load", pay);