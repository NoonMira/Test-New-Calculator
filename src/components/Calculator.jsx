import React, { useState } from "react";
import "./Calculator.css";

const Calculator = () => {
  const [input, setInput] = useState("");
  const [result, setResult] = useState("");

  const handleClick = (value) => {
    setInput((prev) => prev + value);
  };

  const handleClear = () => {
    setInput("");
    setResult("");
  };

  const handleCalculate = () => {
    try {
      setResult(eval(input)); // Note: eval is used for simplicity; avoid using eval in real applications
    } catch (error) {
      setResult("Error");
    }
  };

  return (
    <div className="calculator">
      <div className="display">
        <div className="input">{input}</div>
        <div className="result">{result}</div>
      </div>
      <div className="buttons">
        {["1", "2", "3", "+"].map((item) => (
          <button key={item} id={`button-${item}`} onClick={() => handleClick(item)}>
            {item}
          </button>
        ))}
        {["4", "5", "6", "-"].map((item) => (
          <button key={item} id={`button-${item}`} onClick={() => handleClick(item)}>
            {item}
          </button>
        ))}
        {["7", "8", "9", "*"].map((item) => (
          <button key={item} id={`button-${item}`} onClick={() => handleClick(item)}>
            {item}
          </button>
        ))}
        {["C", "0", "=", "/"].map((item) => (
          <button
            key={item}
            id={`button-${item}`}
            onClick={() =>
              item === "C"
                ? handleClear()
                : item === "="
                ? handleCalculate()
                : handleClick(item)
            }
          >
            {item}
          </button>
        ))}
      </div>
    </div>
  );
};

export default Calculator;
