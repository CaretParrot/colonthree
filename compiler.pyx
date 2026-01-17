import code as code
from code import compile_command

KEYWORDS = {
    ":>": "$$1 = $$2",
    ":D": "print($$1)"
}

interpreter = code.InteractiveConsole()

def parseParams(string, token_vector, iterations):
    for i in range(1, iterations + 1):
        try:
            string = string.replace(f"$${i}", token_vector[i])
            string = string.replace(f"@@{i}", token_vector[i])
        except:
            continue

    return string

def run_code(file_name):
    with open(f"colonthree\\{file_name}", encoding="utf-8") as code:
        lines = code.read().split("\n")
        tokens = []
        code_string = ""

        for i in range(len(lines)):
            tokens.append(lines[i].split("  "))
            for j in KEYWORDS:
                if tokens[i][0] == j:
                    code_string += f"{parseParams(KEYWORDS[j], tokens[i], len(tokens[i]) - 1)}; "

        try:
            compile_command(code_string)
        except:
            raise Exception("Error occured during compilation")
        
        interpreter.runsource(code_string)

run_code("main.col3")