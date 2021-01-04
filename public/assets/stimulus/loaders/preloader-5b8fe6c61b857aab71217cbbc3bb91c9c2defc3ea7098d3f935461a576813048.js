// Experimental: Not currently exposed.
import { Application } from "stimulus"

const application = Application.start()

async function preloadControllers() {
  const imports = await fetch("/assets/importmap-bfe8314ce0c56a72992d937a8622139da858654b61466fa04d84157fe6e63b62.json").then(r => r.json()).then(json => json.imports)

  for (const name in imports) {
    if (name.startsWith("controllers/")) {
      let controllerName = name.replace(/controllers\//, "").replace("_controller", "")

      import(imports[name]).then((module) => {
        application.register(controllerName, module.default)
      }).catch(error => console.log(error))
    }
  }
}

preloadControllers()
;
