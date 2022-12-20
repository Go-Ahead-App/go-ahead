import React from "react";

function NotesEdit({ note }) {
  return (
    <section>
      <input
        type="text"
        value={note.title}
        className="font-bold font-display text-7xl bg-transparent border-0"
      />
    </section>
  );
}

export default NotesEdit;
