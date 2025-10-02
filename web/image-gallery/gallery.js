const backBtn = document.querySelector('#back-btn');
const nextBtn = document.querySelector('#next-btn');
const imageView = document.querySelector('#image-view');

const imageLinks = [
  'https://cdn.motor1.com/images/mgl/qkk7zv/s3/novitec-ferrari-sf90-stradale-2022.jpg',
  'https://cdn.ferrari.com/cms/network/media/img/resize/68c0011f30b362002146768c?width=960&height=540',
  'https://www.lamborghini.com/sites/it-en/files/DAM/lamborghini/face_react/ad_personam/2024/gallery/ad_personam_01_m.jpg',
  'https://images.pistonheads.com/nimg/47438/blobid0.jpg',
  'https://www.pcarmarket.com/static/media/uploads/galleries/photos/uploads/galleries/20981-novak-2021-mercedes-benz-amg-gt-black-series/.thumbnails/_IMG7102.webp/_IMG7102-1200x0.webp',
  'https://www.topgear.com/sites/default/files/2023/03/pagani1.jpg',
  'https://xehay.vn/uploads/images/2024/1/01/xehay_Koenigsegg%20Jesko%20Odin_040123_6.jpg'
];

let currentIndex = 0;


// List of image objects 
const images = imageLinks.map((link, index) => {
  const img = document.createElement('img');
  img.src = link;
  // img.className = 'thumbnail-img';

  // default border
  img.style.border = '2px solid transparent';

  img.addEventListener('mouseenter', () => {
    if (index !== currentIndex) {
      img.style.border = '2px solid red';
    }
  });

  // reset border
  img.addEventListener('mouseleave', () => {
    // ! = =
    if (index !== currentIndex) {
      img.style.border = '2px solid transparent';
    }
  });


  img.addEventListener('click', () => {
    const clonedImg = img.cloneNode();
    clonedImg.style.border = 'none';

    console.log('clicked on img', index);

    // clear current container
    imageView.innerHTML = '';

    // add current img to container
    imageView.append(clonedImg);

    // also update the currentIndex
    currentIndex = index;

    // img.style.border = '2px solid blue';
    resetBorders();

    // TODO: refactor checking buttons style in another function
    if (currentIndex === 0) {
      backBtn.disabled = true;
    } else if (currentIndex === images.length - 1) {
      nextBtn.disabled = true;
    } else {
      backBtn.disabled = false;
      nextBtn.disabled = false;
    }
  });

  return img;
});

const resetBorders = () => {
  for (let i = 0; i < images.length; i++) {
    if (i === currentIndex) {
      images[i].style.border = '2px solid blue';
    } else {
      images[i].style.border = '2px solid transparent';
    }
  }

  // for ... of ...

  // forEach...
}

// resetBorders();
images[currentIndex].style.border = '2px solid blue';

console.log(images);

// Check if image has successfully loaded. Can be used to display a loading spinner
for (const [i, img] of images.entries()) {
  img.addEventListener('load', () => {
    console.log('loaded ' + i);
  });
}

// Dynamic rendering
const thumbnailsContainer = document.querySelector('#thumbnails-container');

for (const imageElement of images) {
  thumbnailsContainer.append(imageElement);
}




const changeImage = (newIndex) => {
  if (currentIndex >= 0 && currentIndex <= images.length) {
    currentIndex += newIndex;
    // imageView.src = images[currentIndex];

    // clear all elements inside the div
    imageView.innerHTML = '';

    // add the new img to the container (clone to avoid moving from thumbnails)
    // When you call append() on a DOM element that's already
    // in the document, it moves the element from its current
    // location to the new location.
    imageView.append(images[currentIndex].cloneNode());


      // check buttons
    if (currentIndex === 0) {
      backBtn.disabled = true;
    } else if (currentIndex === images.length - 1) {
      nextBtn.disabled = true;
    } else {
      backBtn.disabled = false;
      nextBtn.disabled = false;
    }

    resetBorders();
  }

  console.log('current index', currentIndex);
  console.log('thumbnails:', images);
}

nextBtn.addEventListener('click', () => {
  changeImage(1);
});

backBtn.addEventListener('click', () => {
  changeImage(-1);
});

document.addEventListener('keydown', (evt) => {
  // console.log('key down event ', evt.key);

  if (evt.key === 'ArrowLeft') {
    if (currentIndex > 0) {
      changeImage(-1);
    }
  } else if (evt.key === 'ArrowRight') {
    if (currentIndex < images.length - 1) {
      changeImage(1);
    }
  }
});

