from enviar_email import enviar_email

def configurar_email():
    smtp_user = input("Digite seu e-mail: ")
    smtp_password = input("Digite sua senha: ")
    return smtp_user, smtp_password

def obter_dados_email():
    para = input("Digite o e-mail do destinatário: ")
    assunto = input("Digite o assunto do e-mail: ")
    html_conteudo = input("Digite o conteúdo do e-mail (em HTML): ")
    return para, assunto, html_conteudo

def menu_principal():
    while True:
        print("\nMenu Principal:")
        print("1. Configurar e-mail")
        print("2. Enviar e-mail")
        print("3. Sair")
        opcao = input("Escolha uma opção: ")

        if opcao == '1':
            smtp_user, smtp_password = configurar_email()            
        elif opcao == '2':
            para, assunto, html_conteudo = obter_dados_email()            
            enviar_email(smtp_user, smtp_password, para, assunto, html_conteudo)
        elif opcao == '3':
            print("Saindo...")
            break
        else:
            print("Opção inválida. Tente novamente.")

if __name__ == "__main__":
    menu_principal()
