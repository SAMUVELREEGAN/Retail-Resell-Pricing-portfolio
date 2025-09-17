from django.shortcuts import render
from rest_framework.generics import CreateAPIView
from django.core.mail import EmailMessage
from .models import enquiriesModel, DealerEnquiry
from .serializers import enquiriesSerializer

# ✅ Add these imports
from django.utils.decorators import method_decorator
from django.views.decorators.csrf import csrf_exempt


@method_decorator(csrf_exempt, name='dispatch')
class enquieryCreate(CreateAPIView):
    queryset = enquiriesModel.objects.all()
    serializer_class = enquiriesSerializer

    def perform_create(self, serializer):
        request_data = self.request.data
        items = request_data.get("items")

        # ✅ Check if dealer-cart type submission (multiple products)
        if items:
            name = request_data.get("name")
            email = request_data.get("email")
            phone = request_data.get("phone_number")
            total = request_data.get("total")
            link_name = request_data.get("link_name")

            # Save dealer enquiry to DealerEnquiry model
            DealerEnquiry.objects.create(
                name=name,
                email=email,
                phone_number=phone,
                items=items,
                link_name=link_name
            )

            # Build email body with all cart items
            item_html = ""
            for item in items:
                item_html += f"""
                <tr>
                    <td>{item['pro_name']}</td>
                    <td>₹{float(item['price']):.2f}</td>
                    <td>{item['quantity']}</td>
                    <td>₹{float(item['price']) * int(item['quantity']):.2f}</td>
                </tr>
                """

            subject = "🛒 Dealer Cart Enquiry - Multiple Products"
            message = f"""
            <html>
            <head>
                <style>
                    body {{ font-family: Arial, sans-serif; background-color: #f8f8f8; padding: 20px; }}
                    table {{ width: 100%; border-collapse: collapse; margin-top: 20px; }}
                    th, td {{ border: 1px solid #ccc; padding: 10px; text-align: left; }}
                    th {{ background-color: #f0f0f0; }}
                </style>
            </head>
            <body>
                <h2>🔔 Dealer Cart Enquiry Received</h2>
                <p><strong>👤 Name:</strong> {name}</p>
                <p><strong>📞 Phone:</strong> {phone}</p>
                <p><strong>📧 Email:</strong> {email}</p>
                <p><strong>📦 Dealer:</strong> {link_name}</p>
                <h3>🛒 Product List:</h3>
                <table>
                    <tr>
                        <th>Product Name</th>
                        <th>Price</th>
                        <th>Quantity</th>
                        <th>Total</th>
                    </tr>
                    {item_html}
                </table>
                <h3>🧮 Grand Total: ₹{float(total):.2f}</h3>
                <p>✅ Please verify and confirm this dealer enquiry.</p>
            </body>
            </html>
            """

            email_message = EmailMessage(
                subject=subject,
                body=message,
                from_email="VR Store <samuelreegan372@gmail.com>",
                to=["samuelreegan372@gmail.com"],
                reply_to=[email],
            )
            email_message.content_subtype = "html"

            try:
                email_message.send(fail_silently=False)
            except Exception as e:
                print("Email sending failed:", e)

        else:
            # ✅ fallback: non-dealer (single enquiry)
            enquiry = serializer.save()

            product = enquiry.Product_id
            product_name = product.pro_name
            product_price = float(product.price)
            quantity = enquiry.quantity
            total_price = product_price * quantity

            subject = "🔔 New Product Enquiry Received"
            message = f"""
            <!DOCTYPE html>
            <html lang="en">
            <head>
              <meta charset="UTF-8" />
              <meta name="viewport" content="width=device-width, initial-scale=1.0" />
              <title>New Product Enquiry</title>
              <style>
                body {{
                  font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
                  background-color: #f4f4f4;
                }}
                .email-container {{
                  max-width: 600px;
                  margin: 30px auto;
                  background-color: #ffffff;
                  border-radius: 8px;
                  overflow: hidden;
                  box-shadow: 0 0 12px rgba(0, 0, 0, 0.05);
                }}
                .email-header {{
                  background-color: #0d2b56;
                  color: #ffffff;
                  padding: 30px 20px;
                  text-align: center;
                }}
                .email-body {{
                  padding: 30px 25px;
                  color: #333333;
                  font-size: 1rem;
                }}
                .email-body p {{
                  margin: 10px 0;
                }}
                .highlight {{ color: #4a148c; font-weight: bold; }}
              </style>
            </head>
            <body>
              <div class="email-container">
                <div class="email-header">
                  <h1>New Product Enquiry Received</h1>
                </div>
                <div class="email-body">
                  <p>Dear <strong>Admin</strong>,</p>
                  <p>New enquiry from <strong>{enquiry.name}</strong></p>
                  <p>🛒 Product: <span class="highlight">{product_name}</span></p>
                  <p>💰 Price: ₹{product_price:.2f}</p>
                  <p>📦 Quantity: {quantity}</p>
                  <p>🧮 Total: ₹{total_price:.2f}</p>
                  <p>📞 Phone: {enquiry.phone_number}</p>
                  <p>✉️ Email: {enquiry.email}</p>
                </div>
              </div>
            </body>
            </html>
            """

            email_message = EmailMessage(
                subject=subject,
                body=message,
                from_email="VR Store <samuelreegan372@gmail.com>",
                to=["samuelreegan372@gmail.com"],
                reply_to=[enquiry.email],
            )
            email_message.content_subtype = "html"

            try:
                email_message.send(fail_silently=False)
            except Exception as e:
                print("Email sending failed:", e)
