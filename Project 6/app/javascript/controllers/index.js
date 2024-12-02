// Import and register all your controllers from the importmap via controllers/**/*_controller
import { application } from "controllers/application";
import { eagerLoadControllersFrom } from "@hotwired/stimulus-loading";
import { Application } from "stimulus";
import { definitionsFromContext } from "@stimulus/webpack-helpers";

// Eager load all controllers
eagerLoadControllersFrom("controllers", application);

// Create a new Stimulus application
const app = Application.start();

// Load all the controllers from the importmap
const context = require.context("controllers", true, /\.js$/);
app.load(definitionsFromContext(context));

// Connect the Stimulus application to the DOM
document.addEventListener("DOMContentLoaded", () => {
    app.connect();
});

// Functionality for Login Form
document.addEventListener("DOMContentLoaded", () => {
    const loginForm = document.querySelector('.login-form');
    if (loginForm) {
        loginForm.addEventListener('submit', (event) => {
            event.preventDefault();
            const username = document.querySelector('#username').value.trim();
            const password = document.querySelector('#password').value.trim();

            if (!username || !password) {
                alert('Please fill in all fields.');
                return;
            }

            console.log(`Logging in with Username: ${username}`);
            // Simulate successful login for testing
            alert('Login successful!');
        });
    }
});

// Functionality for Evaluation Form
document.addEventListener("DOMContentLoaded", () => {
    const evaluationForm = document.querySelector('.evaluation-form form');
    if (evaluationForm) {
        evaluationForm.addEventListener('submit', (event) => {
            event.preventDefault();

            const formData = new FormData(evaluationForm);
            const data = {
                content: formData.get('content'),
                organization: formData.get('organization'),
                timePacing: formData.get('time-pacing'),
                professionalism: formData.get('professionalism'),
                comments: formData.get('comments'),
            };

            console.log('Evaluation Submitted:', data);
            alert('Evaluation submitted successfully!');
            evaluationForm.reset();
        });
    }
});

// Functionality for Adding New Presentation
document.addEventListener("DOMContentLoaded", () => {
    const blankPresentation = document.querySelector('.blank-presentation');
    if (blankPresentation) {
        blankPresentation.addEventListener('click', () => {
            alert('Create a new blank presentation');
            // Logic for creating a new presentation goes here
        });
    }
});

// Functionality for Presentation Cards
document.addEventListener("DOMContentLoaded", () => {
    const presentationCards = document.querySelectorAll('.presentation-cards .card');
    if (presentationCards.length > 0) {
        presentationCards.forEach((card) => {
            card.addEventListener('click', () => {
                const title = card.querySelector('.card-title').textContent;
                alert(`Opening presentation: ${title}`);
                // Logic for navigating to the presentation page goes here
            });
        });
    }
});
