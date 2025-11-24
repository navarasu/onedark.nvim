import React, { useState } from 'react';

// This is a comment in TypeScript
interface Props {
  name: string;
  count: number;
}

/**
 * Documentation comment for component
 */
function MyComponent({ name, count }: Props) {
  const [value, setValue] = useState(0);

  // Comment inside function
  const handleClick = () => {
    setValue(value + 1);
  };

  return (
    <div className="container">
      <h1>Hello {name}</h1>
      <p>Count: {count}</p>
      <button onClick={handleClick}>
        Click me: {value}
      </button>
      <CustomComponent prop="value" />
    </div>
  );
}

// More comments
const CustomComponent = ({ prop }: { prop: string }) => {
  return <span>{prop}</span>;
};

export default MyComponent;
