INSERT INTO public.enviohistoricocredito(
	cnpjif, dtrms)
	VALUES (?, ?);

INSERT INTO public.cliente(
	idfccli, enviohistoricocredito_cnpjif)
	VALUES (?, ?);

INSERT INTO public.operacao(
	nrunco, cliente_idfccli, dtctrc, dtaprc, cdmdld)
	VALUES (?, ?, ?, ?, ?);

INSERT INTO public.detalheoperacao(
	operacao_nrunco, inprefix, dtvnctultpcl, vlctrdfut, qtpcl)
	VALUES (?, ?, ?, ?, ?);

INSERT INTO public.parcelasfuturas(
	index, dtvnctprxpcl, vlprxpcl, qtpclvncr, qtpclpgr, operacao_nrunco)
	VALUES (?, ?, ?, ?, ?, ?);

INSERT INTO public.parcelaanterior(
	index, operacao_nrunco, dtvnctpclant, vlpclant)
	VALUES (?, ?, ?, ?);

INSERT INTO public.pagamentoparcelaanterior(
	index, dtpgtopclant, vlpgtopclant, parcelaanterior_index)
	VALUES (?, ?, ?, ?);