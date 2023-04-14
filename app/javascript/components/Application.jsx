import React from "react";
import { createRoot } from "react-dom/client";
import { createInertiaApp } from "@inertiajs/inertia-react";

createInertiaApp({
  resolve: (name) => {
    return import(`./${name}.jsx`, { eager: true });
  },
  setup({ el, App, props }) {
    const container = document.getElementById(el.id);
    const root = createRoot(container);
    root.render(<App {...props} />);
  },
});
