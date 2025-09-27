const clickMeBtn = document.querySelector('#click-me-btn');

clickMeBtn.addEventListener('click', () => {
  alert('Wassuppppp');
});


const nameInput = document.querySelector('#name-input');
const form = document.querySelector('form');

form.addEventListener('submit', (evt) => {
    evt.preventDefault();

    let message = 'hello ' + nameInput.value;
    console.log(message);

    alert(message)
    
});