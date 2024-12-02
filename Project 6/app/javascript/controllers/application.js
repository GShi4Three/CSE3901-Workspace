// Import Stimulus and your controllers
import { Application } from "@hotwired/stimulus";
import YourController from "./your_controller.js";

// Initialize the Stimulus application
const application = Application.start();

// Register your controller
application.register("your-controller", YourController);

// Configure Stimulus for development or production
application.debug = false;
window.Stimulus = application;

export { application };

// Add event listeners or execute functions here
document.addEventListener("DOMContentLoaded", function () {
  console.log("DOM fully loaded and parsed");

  // Example: Dynamically update the page title
  const pageTitle = document.querySelector("title");
  if (pageTitle) {
    const defaultTitle = "Presentation Evaluator";
    const currentTitle = document.querySelector("[data-title]")?.getAttribute("data-title");
    pageTitle.textContent = currentTitle || defaultTitle;
  }

  // Example: Setup navigation links
  const links = document.querySelectorAll("a[data-link]");
  links.forEach(link => {
    link.addEventListener("click", (event) => {
      event.preventDefault();
      const href = event.target.getAttribute("href");
      if (href) {
        window.location.href = href;
      }
    });
  });

  // Example: Interactive dynamic behaviors
  const buttons = document.querySelectorAll("button[data-action]");
  buttons.forEach(button => {
    button.addEventListener("click", () => {
      alert(`Button clicked: ${button.dataset.action}`);
    });
  });
});
