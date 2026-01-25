import code as code
from code import compile_command

KEYWORDS = {
    ":>": "$$1 = $$2",
    ":D": "print($$1)",
    ":3": "import random as random; random.randint($$1, $$2)",
    ":(": "raise Exception($$1)",
    "-_-": "@@1",
    "@_@": "junk = [@@2 for i in range(1, $$1 + 1)]"
}

interpreter = code.InteractiveConsole()

def parseParams(string, token_vector, num_params):
    for i in range(1, num_params + 1):
        string = string.replace(f"$${i}", token_vector[i])
        if f"@@{i}" in string:
            if token_vector[0] == "@_@":
                string = string.replace(f"@@{i}", compile_function(token_vector[i]))

    return string

def compile_function(file_name, with_formatting = True):
    with open(f"colonthree\\{file_name}", encoding="utf-8") as code:
        lines = code.read().split("\n")
        tokens = []
        code_string = ""

        for i in range(len(lines)):
            tokens.append(lines[i].split("  "))
            for j in KEYWORDS:
                if tokens[i][0] == j:
                    code_string += f"{parseParams(KEYWORDS[j], tokens[i], len(tokens[i]) - 1)} "
        
        compile_command(code_string)
    
    return code_string

def run_code(file_name):
    interpreter.runsource(compile_function(file_name))
    return compile_function(file_name)

run_code("main.col3")