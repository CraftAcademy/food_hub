// if (window.location.pathname === '/recipe') {
    // if(document.readyState === 'complete') {
    //     console.log('LOADED!');
  //       let ratingButtons = document.querySelectorAll('button')
  //       let noticeDiv = document.querySelector('.notice')
  //       let alertDiv = document.querySelector('.alert')
  //       let ratingDiv = document.querySelector('#rating')
  //       ratingButtons.forEach((button)=>{
  //         button.addEventListener('click',(event)=>{
  //           event.preventDefault()
  //           let value = button.dataset.rating
  //           let body = JSON.stringify({rating: value })
  //           fetch("#{recipe_ratings_path(@recipe)}", {
  //             method: 'POST',
  //             body: body,
  //             credentials: 'include',
  //             headers: {
  //               'Content-Type': 'application/json',
  //               'X-Requested-With': 'XMLHttpRequest',
  //               'X-CSRF-Token': Rails.csrfToken()
  //           }}).then(function(response) {
  //             return response.json();
  //           }).then(function(data) {
  //             noticeDiv.innerHTML = data.message
  //             ratingDiv.style.display = 'none'
  //             console.log(data)
  //           }).catch((error) => {
  //             alertDiv.innerHTML = data.error
  //             console.log(error)
  //           });
  //       })
  //
  //     })
  //
// }
  //}
