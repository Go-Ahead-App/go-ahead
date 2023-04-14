import { Inertia } from "@inertiajs/inertia";
import { usePage, Link } from "@inertiajs/inertia-react";

import React, { useState } from "react";

function New({ program }) {
  const sharedData = usePage().props;

  const [values, setValues] = useState({
    name: program.name,
    description: program.description,
    difficulty: program.difficulty,
    duration: program.duration,
    authenticity_token: sharedData.csrf_token,
  });

  function handleSubmit(e) {
    e.preventDefault();

    Inertia.post(`/programs`, values);
  }

  function handleChange(e) {
    const key = e.target.id;
    const value = e.target.value;

    setValues((values) => ({
      ...values,
      [key]: value,
    }));
  }

  return (
    <section className="mx-auto md:mt-32 flex justify-center space-x-16">
      <div className="lg:w-1/2">
        <div className="col-12">
          <h1 className="font-display text-5xl text-red-400 mb-12">
            New Program
          </h1>

          <form action="">
            <div className="mt-4">
              <label htmlFor="name" className="text-xs">
                Name
              </label>
              <input
                type="text"
                id="name"
                name="name"
                className="px-4 py-3 bg-transparent border border-neutral-500 w-full focus:outline-0 focus:border-neutral-100 duration-200"
                onChange={handleChange}
              />
            </div>

            <div className="mt-4">
              <label htmlFor="description" className="text-xs">
                Description
              </label>

              <textarea
                name="description"
                id="description"
                className="px-4 py-3 bg-transparent border border-neutral-500 w-full focus:outline-0 focus:border-neutral-100 duration-200"
                onChange={handleChange}
              ></textarea>
            </div>

            <div className="mt-4">
              <label htmlFor="difficulty" className="text-xs">
                Difficulty
              </label>

              <select
                name="difficulty"
                id="difficulty"
                className="px-4 py-3 bg-transparent border border-neutral-500 w-full focus:outline-0 focus:border-neutral-100 duration-200"
                onChange={handleChange}
              >
                <option value="0">Beginner</option>
                <option value="1">Intermediate</option>
                <option value="2">Advanced</option>
              </select>
            </div>

            <div className="mt-4">
              <label htmlFor="duration" className="text-xs">
                Duration
              </label>

              <input
                type="text"
                id="duration"
                name="duration"
                className="px-4 py-3 bg-transparent border border-neutral-500 w-full focus:outline-0 focus:border-neutral-100 duration-200"
                onChange={handleChange}
              />
            </div>

            <button
              type="submit"
              className="px-6 py-4 text-sm bg-neutral-900 duration-200 hover:bg-neutral-800 mt-8"
              onClick={handleSubmit}
            >
              Create Program
            </button>
          </form>
        </div>
      </div>
    </section>
  );
}

export default New;
