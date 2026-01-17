import code as code

KEYWORDS = {
    ":>": "$$1 = $$2",
    ":D": "print($$1)",
    # ":3": "silly()",
    "@_@": "for i in range(0, $$1): $$2",
}

interpreter = code.InteractiveInterpreter()

# silly_function = '''def silly():\n\tprint('I feel silly!')'''

# interpreter.runsource(f'''${silly_function}''')

def parseParams(string, token_vector, iterations):
    for i in range(1, iterations + 1):
        string = string.replace(f"$${i}", token_vector[i])
    return string

with open("colonthree\\test.col3", encoding="utf-8") as code:
    lines = code.read().split("\n")
    tokens = []

    for i in range(len(lines)):
        tokens.append(lines[i].split("  "))
        for j in KEYWORDS:
            if tokens[i][0] == j:
                interpreter.runsource(f'''{parseParams(KEYWORDS[j], tokens[i], len(tokens[i]) - 1)}''')