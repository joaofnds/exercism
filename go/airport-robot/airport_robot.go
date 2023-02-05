package airportrobot

type Greeter interface {
	SayHello(string) string
	LanguageName() string
}

func SayHello(name string, greeter Greeter) string {
	return "I can speak " + greeter.LanguageName() + ": " + greeter.SayHello(name)
}

type Italian struct{}

func (i Italian) SayHello(name string) string { return "Ciao " + name + "!" }
func (i Italian) LanguageName() string        { return "Italian" }

type Portuguese struct{}

func (i Portuguese) LanguageName() string        { return "Portuguese" }
func (i Portuguese) SayHello(name string) string { return "Olá " + name + "!" }
