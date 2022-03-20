h1 = {}
h2 = Hash.new()

h1["a"] = "Found A"
h1 [false] = "Found false"
h1
h1[42]
h1.keys
h1.values
h3 = { "SML" => 1, "Racket" => 2, "Ruby" => 3 }
h3.["SML"]
h3.size
h3.each { |k, v| print k; print ": " ; puts v}

1..1000000

(1.100).inject { |acc, elt| acc + elt }