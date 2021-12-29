// function handleDisplay(imageIndex) {
//   console.log(imageIndex);
//   const imageRemove = $(".product__image__preview")[imageIndex];
//   console.log(imageRemove);
//   imageRemove.remove();
// }

// const currentURL = window.location.pathname;

// $(document).on("click", ".product__icon__close", function (event) {
// const imageId = event.target.innerHTML;
// const productId = currentURL.split(/^\D+/g);
// const imageIndex = this.nextSibling.nextSibling.innerText;
// $.post(
//   "clear_image",
//   { productId: productId, imageId: imageId },
//   function () {
//     handleDisplay(imageIndex);
//   }
// );
// });
