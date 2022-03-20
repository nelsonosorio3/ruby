#blocks are second-class
#procs are first-class

a =  [3,5,7,9]

b = a.map { |x| x + 1}

b  

i = b.count { |x| x >= 6 }
i 
c = a.map { |x| lambda { |y| x >= y } }

c.size

c[2].call(17)

c[2].call(2)

j = c.count {|x| x.call(5) }



