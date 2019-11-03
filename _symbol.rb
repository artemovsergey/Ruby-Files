
p :new.class
p :'new_new'.class

s = "string"
sym =:"#{s}"
p sym.class


# string to symbol
a = "s"
b = %s[a]
p b.class

# symbol to string
s = "str"
s.to_sym  # or .intern
sym = :sym
sym.to_s


# проверка наличия метода у объекта
str = 'test'
p str.respond_to? :size