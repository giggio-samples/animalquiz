namespace AnimalQuiz

import System
import NUnit.Framework

[TestFixture]
class TesteAnimal:
	adivinhador as Adivinhador

	[SetUp]
	def SetUp():	
		adivinhador = Adivinhador()

	[Test]
	def RespondeQueNaoEhUmElefante():
		pergunta = adivinhador.Pergunta()
		adivinhador.RespondeNao()
		Assert.IsFalse(adivinhador.FimJogo())

	[Test]
	def SeNaoForElefanteEleDevePerguntarMais():
		pergunta = adivinhador.Pergunta()
		adivinhador.RespondeNao()
		devePerguntarMais = adivinhador.AindaPergunto()
		Assert.IsTrue(devePerguntarMais)

	[Test]
	def PerguntaSeEElefante():
		pergunta = adivinhador.reajaCom(null)
		Assert.AreEqual("É um elefante?", pergunta)

	[Test]
	def PerguntaSeEElefanteRespostaSim():
		adivinhador.reajaCom(null)
		pergunta = adivinhador.reajaCom("s")
		Assert.AreEqual("Obrigado! Fim de jogo", pergunta)

	[Test]
	def PerguntaSeEElefanteRespostaNao():
		adivinhador.reajaCom(null)
		pergunta = adivinhador.reajaCom(false)
		Assert.AreEqual("Você venceu. Qual animal você esta pensando?", pergunta)

		
	def PrimeiraIteracaoComElefante() as string:
		adivinhador.reajaCom(null)
		pergunta = adivinhador.reajaCom(false)
		return adivinhador.reajaCom("coelho")
		
		
	[Test]
	def PerguntaQualADiferencaDoNovoAnimal():
		resposta = PrimeiraIteracaoComElefante()
		Assert.AreEqual("Me de uma pergunta que o diferencia", resposta)

	[Test]
	def PerguntaQualRespostaDoNovoAnimal():
		PrimeiraIteracaoComElefante()
		resposta = adivinhador.reajaCom("E um animal pequeno?")
		Assert.AreEqual("Para essa pergunta, qual seria a resposta?", resposta)
	
	

class Adivinhador:
	fimJogo as bool
	esperandoPergunta as bool

	def reajaCom(resposta as bool):
		if resposta:
			return "Obrigado! Fim de jogo"
		else:
			return "Você venceu. Qual animal você esta pensando?"
	
	def reajaCom(novoAnimal as string) as string:
		if esperandoResposta:
		if esperandoPergunta:
			return "Para essa pergunta, qual seria a resposta?"
		if novoAnimal:
			esperandoPergunta = true
			return "Me de uma pergunta que o diferencia"
		
		return "É um elefante?"


	def Pergunta() as string:
		return "É um elefante?"
	def RespondeSim():
		fimJogo = true
	def FimJogo() as bool:
		return fimJogo
	def RespondeNao() as bool:
		pass

	def AindaPergunto() as bool:
		return true