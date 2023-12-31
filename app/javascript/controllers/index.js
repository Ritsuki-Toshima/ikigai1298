// Import and register all your controllers from the importmap under controllers/*

import { application } from "controllers/application"
import Chart from 'stimulus-chartjs'

// Eager load all controllers defined in the import map under controllers/**/*_controller
import { eagerLoadControllersFrom } from "@hotwired/stimulus-loading"
eagerLoadControllersFrom("controllers", application)
application.register('chart', Chart)
// Lazy load controllers as they appear in the DOM (remember not to preload controllers in import map!)
// import { lazyLoadControllersFrom } from "@hotwired/stimulus-loading"
// lazyLoadControllersFrom("controllers", application)

// import { Application } from 'stimulus'
// import Chart from 'stimulus-chartjs'

// const application = Application.start()
// application.register('chart', Chart)
