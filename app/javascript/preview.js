document.addEventListener('DOMContentLoaded', () => {
  const createImageHTML = (blob) => {
    const imageElement = document.getElementById('new-image');
    const blobImage = document.createElement('img');
    blobImage.setAttribute('class', 'new-img')
    blobImage.setAttribute('src', blob);
    blobImage.setAttribute('id', 'new-img-preview');
    imageElement.appendChild(blobImage);
  };

  document.getElementById('post_post_image').addEventListener('change', (e) =>{
    const imageContent = document.getElementById('new-img-preview');
    if (imageContent){
      imageContent.remove();
    }
      const file = e.target.files[0];
      const blob = window.URL.createObjectURL(file);
      createImageHTML(blob);
    });
});

