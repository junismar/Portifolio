import smtplib
from email.mime.text import MIMEText
from config_email import smtp_host, smtp_port, de

def enviar_email(smtp_user, smtp_password, para, assunto, html_conteudo):
    mensagem = MIMEText(html_conteudo, 'html')
    mensagem['Subject'] = assunto
    mensagem['From'] = de
    mensagem['To'] = para

    try:
        with smtplib.SMTP(smtp_host, smtp_port) as servidor:
            servidor.starttls()
            servidor.login(smtp_user, smtp_password)
            servidor.sendmail(de, para, mensagem.as_string())
            print('Email enviado com sucesso!')
    except smtplib.SMTPServerDisconnected as e1:
        print(f"Erro: Conexão fechada inesperadamente. Verifique suas configurações e autenticação. : {e1}")
    except smtplib.SMTPException as e2:
        print(f"Erro ao enviar: {e2}")
