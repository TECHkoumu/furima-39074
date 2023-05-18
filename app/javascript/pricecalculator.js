window.addEventListener('load', () => {

  const priceInput = document.getElementById('item-price');
  const taxProfitContainer = document.getElementById('tax-profit-container');
  const profitContainer = document.getElementById('profit-container');
  const addTaxPrice = document.getElementById('add-tax-price');
  const profit = document.getElementById('profit');

  priceInput.addEventListener('input', () => {
    const price = parseFloat(priceInput.value);
    if (isNaN(price) || price <= 0) {
      addTaxPrice.innerHTML = '0';
      profit.innerHTML = '0';
      taxProfitContainer.style.display = 'block';
      profitContainer.style.display = 'block';
    } else {
      const tax = Math.floor(price * 0.1);
      const profitValue = Math.floor(price - tax);

      addTaxPrice.innerHTML = tax.toString();
      profit.innerHTML = profitValue.toString();
      taxProfitContainer.style.display = 'block';
      profitContainer.style.display = 'block';
    }
  });

  priceInput.addEventListener('blur', () => {
    if (priceInput.value === '') {
      taxProfitContainer.style.display = 'none';
      profitContainer.style.display = 'none';
    }
  });
});