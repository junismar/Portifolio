import os
import flet as ft
import qrcode
import base64
from io import BytesIO
from PIL import Image
from fpdf import FPDF

# Constantes
QR_IMAGE_PATH = "qr_code_temp.png"
PDF_PATH = "qr_code.pdf"
DEFAULT_TEXT = "Texto para converter em QR Code"

def main(page: ft.Page):
    page.title = "Gerador de QR Code"
    page.window.width = 800
    page.window.height = 600
    page.window_resizable = False
    page.vertical_alignment = ft.MainAxisAlignment.START

    def gerar_qr_code(e):
        input_text = input_field.value
        if input_text:
            qr = qrcode.make(input_text)
            buffer = BytesIO()
            qr.save(buffer, format="PNG")
            buffer.seek(0)
            qr_image.src_base64 = base64.b64encode(buffer.read()).decode('utf-8')
            qr_image.visible = True
            qr_image.update()
        else:
            qr_image.visible = False
            qr_image.update()

    def limpar_tela(e):
        input_field.value = ''
        input_field.label = DEFAULT_TEXT
        qr_image.visible = False
        input_field.update()
        qr_image.update()

        try:
            if os.path.exists(PDF_PATH):
                os.remove(PDF_PATH)
            if os.path.exists(QR_IMAGE_PATH):
                os.remove(QR_IMAGE_PATH)
        except Exception as ex:
            show_message(f"Erro ao limpar arquivos: {ex}")

    def exportar_para_pdf(e):
        input_text = input_field.value
        if input_text and qr_image.visible:
            pdf = FPDF()
            pdf.add_page()
            pdf.set_font("Arial", size=12)
            pdf.cell(200, 10, txt="QR Code Gerado", ln=True, align="C")

            qr = qrcode.make(input_text)
            with open(QR_IMAGE_PATH, "wb") as f:
                qr.save(f, format="PNG")

            pdf.image(QR_IMAGE_PATH, x=80, y=30, w=50)
            pdf.output(PDF_PATH)
            show_message("QR Code exportado para PDF com sucesso!")

    def show_message(message):
        page.snack_bar = ft.SnackBar(ft.Text(message))
        page.snack_bar.open = True
        page.update()

    # Campos de input e botões
    input_field = ft.TextField(label=DEFAULT_TEXT, width=600)
    gerar_button = ft.ElevatedButton("Gerar QR Code", on_click=gerar_qr_code)
    limpar_button = ft.ElevatedButton("Limpar", on_click=limpar_tela)
    exportar_button = ft.ElevatedButton("Exportar PDF", on_click=exportar_para_pdf)

    qr_image = ft.Image(width=250, height=250, visible=False)

    # Adicionar componentes na página
    page.add(
        ft.Container(
            content=ft.Column(
                [
                    input_field,
                    ft.Row(
                        [gerar_button, limpar_button, exportar_button],
                        alignment=ft.MainAxisAlignment.START,
                        spacing=10
                    ),
                    ft.Container(
                        content=qr_image,
                        alignment=ft.alignment.center,
                        padding=ft.padding.only(top=20)
                    )
                ],
                alignment=ft.MainAxisAlignment.START,
                horizontal_alignment=ft.CrossAxisAlignment.START,
                spacing=10
            ),
            padding=ft.padding.only(top=15)
        )
    )

if __name__ == "__main__":
    ft.app(target=main)
