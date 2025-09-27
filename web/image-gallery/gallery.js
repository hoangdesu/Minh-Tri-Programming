const backBtn = document.querySelector('#back-btn');
const nextBtn = document.querySelector('#next-btn');
const imageView = document.querySelector('#image-view');

const images = [
  'https://cdn.motor1.com/images/mgl/qkk7zv/s3/novitec-ferrari-sf90-stradale-2022.jpg',
  'https://cdn.ferrari.com/cms/network/media/img/resize/68c0011f30b362002146768c?width=960&height=540',
  'https://www.lamborghini.com/sites/it-en/files/DAM/lamborghini/face_react/ad_personam/2024/gallery/ad_personam_01_m.jpg',
  'https://images.pistonheads.com/nimg/47438/blobid0.jpg',
  'https://www.pcarmarket.com/static/media/uploads/galleries/photos/uploads/galleries/20981-novak-2021-mercedes-benz-amg-gt-black-series/.thumbnails/_IMG7102.webp/_IMG7102-1200x0.webp',
];

let currentIndex = 0;

nextBtn.addEventListener('click', () => {
  if (currentIndex < images.length - 1) {
    currentIndex++;
    imageView.src = images[currentIndex];
  }

  //   disabled buttons
  if (currentIndex == 0) {
    backBtn.disabled = true;
  } else if (currentIndex == images.length - 1) {
    nextBtn.disabled = true;
  } else {
    backBtn.disabled = false;
    nextBtn.disabled = false;
  }
});

backBtn.addEventListener('click', () => {
  if (currentIndex > 0) {
    currentIndex--;
    imageView.src = images[currentIndex];
  }

  if (currentIndex == 0) {
    backBtn.disabled = true;
  } else if (currentIndex == images.length - 1) {
    nextBtn.disabled = true;
  } else {
    backBtn.disabled = false;
    nextBtn.disabled = false;
  }
});

document.addEventListener('keydown', (evt) => {
  // console.log('key down event ', evt.key);

  if (evt.key === 'ArrowLeft') {
    if (currentIndex > 0) {
      currentIndex--;
      imageView.src = images[currentIndex];
    }
  } else if (evt.key === 'ArrowRight') {
    if (currentIndex < images.length - 1) {
      currentIndex++;
      imageView.src = images[currentIndex];
    }
  }

  if (currentIndex == 0) {
    backBtn.disabled = true;
  } else if (currentIndex == images.length - 1) {
    nextBtn.disabled = true;
  } else {
    backBtn.disabled = false;
    nextBtn.disabled = false;
  }
});
