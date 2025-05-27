// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
import "./controllers"

window.addEventListener('resize', () => {
  const sheetContent = document.querySelector('[data-controller="ruby-ui--sheet-content"]')
  if (sheetContent) {
    if (window.innerWidth >= 768) { // 768px is the medium breakpoint
      sheetContent.classList.add('hidden')
    } else {
      sheetContent.classList.remove('hidden')
    }
  }
})
