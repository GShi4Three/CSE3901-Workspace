// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

// Import application stylesheets
import "stylesheets/application";

// Import Stimulus and helper functions
import { Application } from "@hotwired/stimulus";
import { definitionsFromContext } from "stimulus/webpack-helpers";

// Start the Stimulus application
const application = Application.start();

// Load Stimulus controllers dynamically from the controllers directory
const context = require.context("../controllers", true, /\.js$/);
application.load(definitionsFromContext(context));

// Configure Stimulus development experience
application.debug = false;
window.Stimulus = application;

export { application };

// Add global event listeners or page-specific functions here
document.addEventListener("DOMContentLoaded", function () {
  console.log("DOM fully loaded and parsed");

  // Dynamic title update
  const pageTitle = document.querySelector("title");
  if (pageTitle) {
    const defaultTitle = "Presentation Evaluator";
    const currentTitle = document.querySelector("[data-title]")?.getAttribute("data-title");
    pageTitle.textContent = currentTitle || defaultTitle;
  }

  // Handle links with `data-turbo` for Turbo Rails navigation
  const turboLinks = document.querySelectorAll("a[data-turbo]");
  turboLinks.forEach(link => {
    link.addEventListener("click", (event) => {
      event.preventDefault();
      Turbo.visit(link.getAttribute("href"));
    });
  });

  // Handle buttons with `data-action` attributes
  const actionButtons = document.querySelectorAll("button[data-action]");
  actionButtons.forEach(button => {
    button.addEventListener("click", () => {
      alert(`Action performed: ${button.dataset.action}`);
    });
  });

  // Example Stimulus controller registration (if not using auto-loading)
  const dynamicControllerElement = document.querySelector("[data-controller='dynamic']");
  if (dynamicControllerElement) {
    import("../controllers/dynamic_controller").then((module) => {
      const DynamicController = module.default;
      const dynamicController = new DynamicController(dynamicControllerElement);
      dynamicController.connect();
    });
  }
});
