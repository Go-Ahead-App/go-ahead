import { Inertia } from "@inertiajs/inertia";
import { usePage, Link } from "@inertiajs/inertia-react";

import React, { useState } from "react";

import ChallengeForm from "./Shared/ChallengeForm";

function Edit({ program, challenges }) {
  const sharedData = usePage().props;

  const [values, setValues] = useState({
    name: program.name,
    description: program.description,
    difficulty: program.difficulty,
    length: program.length,
    challenges: challenges,
    authenticity_token: sharedData.csrf_token,
  });

  React.useEffect(() => {
    const description = document.getElementById("description");
    description.style.height = description.scrollHeight + "px";
  }, []);

  function handleSubmit(e) {
    e.preventDefault();

    Inertia.put(`/programs/${program.id}`, values);
  }

  function handleChange(e) {
    const key = e.target.id;
    const value = e.target.value;

    if (key === "description") {
      e.target.style.height = e.target.scrollHeight + "px";
    }

    setValues((values) => ({
      ...values,
      [key]: value,
    }));
  }

  return (
    <section className="mx-auto md:mt-32 flex justify-center space-x-16">
      <div className="lg:w-2/3">
        <div className="flex justify-between items-center mb-12">
          <h1 className="font-display text-5xl text-red-400">Edit Program</h1>

          <a
            href={`/programs/${program.id}`}
            className="px-6 py-4 text-sm bg-neutral-900 duration-200 hover:bg-neutral-800 mt-8"
          >
            Back
          </a>
        </div>

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
              value={values.name || ""}
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
              value={values.description || ""}
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
              value={values.difficulty || ""}
              onChange={handleChange}
            >
              <option value="0">Beginner</option>
              <option value="1">Intermediate</option>
              <option value="2">Advanced</option>
            </select>
          </div>

          <div className="mt-4">
            <label htmlFor="length" className="text-xs">
              Length
            </label>

            <input
              type="text"
              id="length"
              name="length"
              className="px-4 py-3 bg-transparent border border-neutral-500 w-full focus:outline-0 focus:border-neutral-100 duration-200"
              value={values.length || ""}
              onChange={handleChange}
            />
          </div>

          <button
            type="submit"
            className="px-6 py-4 text-sm bg-neutral-900 duration-200 hover:bg-neutral-800 mt-8"
            onClick={handleSubmit}
          >
            Update Program
          </button>
        </form>
      </div>

      <div className="lg:w-1/3">
        <h1 className="font-display text-3xl mb-12">Challenges</h1>

        <ChallengeForm
          program={program}
          setValues={setValues}
          token={sharedData.csrf_token}
        />

        <div className="mt-4 grid grid-cols-2 gap-4">
          {values.challenges
            ? values.challenges.map((challenge) => {
                return (
                  <div className="p-4 bg-neutral-900" key={challenge.id}>
                    <div className="flex justify-between items-start mb-4">
                      <h1 className="font-display text-base text-red-400">
                        {challenge.name}
                      </h1>

                      <span className="text-xs px-1 bg-black">
                        {challenge.day}
                      </span>
                    </div>
                    <p className="text-sm">{challenge.description}</p>
                  </div>
                );
              })
            : "no challenges"}
        </div>
      </div>
    </section>
  );
}

export default Edit;
