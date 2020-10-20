const buttonDec = document.querySelector(".btn.round-bordered.incrementer.minus");
const buttonInc = document.querySelector("a[href]");
​
const counting = document.querySelector("#counter");
let counterValue = Number.parseInt(counting.innerText, 10);
​
const placeholder = document.getElementById("price-input");
placeholder.setAttribute("type", "hidden");
const price = document.getElementById("submit");
​
​
const addPlaceholderPrice = () => {
  let num = parseInt(placeholder.value, 10);
  num += 15000;
  placeholder.value = num;
  price.value = `Pay ${num / 100}€`;
};
​
const subtractPlaceholderPrice = () => {
  let num = parseInt(placeholder.value, 10);
  num -= 15000;
  placeholder.value = num;
  price.value = `Pay ${num / 100}€`;
};
​
buttonDec.addEventListener('click', (event) => {
  if (counterValue <= 1) {
    return;
  }
  counterValue -= 1;
  counting.dataset.count -= 1;
  counting.innerText = `${counterValue}`;
  subtractPlaceholderPrice();
});
​
buttonInc.addEventListener('click', (event) => {
  counterValue += 1;
  counting.dataset.count += 1;
  counting.innerText = `${counterValue}`;
  addPlaceholderPrice();
});