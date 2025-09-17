from django.contrib import admin
from django.utils.html import format_html
from django.core.mail import send_mail
from django.urls import path
from django.shortcuts import redirect
from django.contrib import messages

from .models import enquiriesModel, DealerEnquiry

# Single Product Enquiry Admin
class EnquiriesAdmin(admin.ModelAdmin):
    list_display = [
        'name', 'phone_number', 'product_name', 'product_image', 'quantity',
        'total_price', 'enquiry_date', 'is_verified', 'verify_button', 'remove_button'
    ]
    list_filter = ['enquiry_date', 'is_verified']
    readonly_fields = ['product_image', 'enquiry_date']
    date_hierarchy = 'enquiry_date'

    def product_name(self, obj):
        return obj.Product_id.pro_name if obj.Product_id else "-"
    product_name.short_description = 'Product Name'

    def product_image(self, obj):
        first_image = obj.Product_id.images.first() if obj.Product_id else None
        if first_image and first_image.image:
            return format_html('<img src="{}" width="80" height="60" style="object-fit: contain;" />', first_image.image.url)
        return "-"
    product_image.short_description = 'Product Image'

    def total_price(self, obj):
        if obj.Product_id and obj.quantity:
            return obj.Product_id.price * obj.quantity
        return "-"
    total_price.short_description = 'Total Price'

    def verify_button(self, obj):
        if not obj.is_verified:
            return format_html(
                '<a class="button" style="color: white; background: blue; padding: 6px 12px; border-radius: 4px;" href="{}">Verify</a>',
                f'verify/{obj.id}/'
            )
        return "Verified"
    verify_button.short_description = 'Verify Action'

    def remove_button(self, obj):
        return format_html(
            '<a class="button" style="color: white; background: #d9534f; padding: 6px 12px; border-radius: 4px;" onclick="return confirm(\'Are you sure you want to remove this enquiry?\')" href="{}">Remove</a>',
            f'remove/{obj.id}/'
        )
    remove_button.short_description = 'Remove Action'

    def get_urls(self):
        urls = super().get_urls()
        custom_urls = [
            path('verify/<int:enquiry_id>/', self.admin_site.admin_view(self.verify_enquiry), name='verify-enquiry'),
            path('remove/<int:enquiry_id>/', self.admin_site.admin_view(self.remove_enquiry), name='remove-enquiry'),
        ]
        return custom_urls + urls

    def verify_enquiry(self, request, enquiry_id):
        enquiry = enquiriesModel.objects.get(id=enquiry_id)

        if enquiry.is_verified:
            messages.warning(request, "Already verified.")
        else:
            enquiry.is_verified = True
            enquiry.save()

            html_message = f"""
            <div style="font-family: Arial, sans-serif; background-color: #f9f9f9; padding: 30px;">
                <div style="max-width: 600px; margin: auto; background: white; border-radius: 10px; box-shadow: 0 4px 8px rgba(0,0,0,0.1); overflow: hidden;">
                    <div style="background-color: #102D59; padding: 20px; text-align: center;">
                        <h1 style="color: white;">VEERARAGAVAN FURNITURES</h1>
                        <h2 style="color: white;">Product Enquiry Verified</h2>
                    </div>
                    <div style="padding: 30px;">
                        <p style="font-size: 16px;">Dear <strong>{enquiry.name}</strong>,</p>
                        <p>Your enquiry for <strong>{enquiry.Product_id.pro_name}</strong> has been <span style="color: #4CAF50; font-weight: bold;">verified</span>.</p>
                        <p>We will contact you shortly with more details.</p>
                        <hr style="margin: 20px 0;" />
                        <p style="font-size: 14px; color: gray;">Thank you for choosing us!</p>
                    </div>
                </div>
            </div>
            """

            send_mail(
                subject='Your Product Enquiry Has Been Verified',
                message='Your enquiry has been verified.',
                from_email='samuelreegan372@example.com',
                recipient_list=[enquiry.email],
                fail_silently=False,
                html_message=html_message,
            )

            messages.success(request, f'Verified and email sent to {enquiry.email}')

        return redirect(request.META.get('HTTP_REFERER'))

    def remove_enquiry(self, request, enquiry_id):
        try:
            enquiry = enquiriesModel.objects.get(id=enquiry_id)
            enquiry.delete()
            messages.success(request, f"Enquiry from {enquiry.name} has been removed.")
        except enquiriesModel.DoesNotExist:
            messages.error(request, "Enquiry not found.")
        return redirect(request.META.get('HTTP_REFERER'))


admin.site.register(enquiriesModel, EnquiriesAdmin)

# Dealer Enquiry Admin (Multiple products)
@admin.register(DealerEnquiry)
class DealerEnquiryAdmin(admin.ModelAdmin):
    list_display = ['name', 'phone_number', 'email', 'dealer_page_link', 'product_summary', 'grand_total', 'enquiry_date', 'is_verified', 'verify_button']
    readonly_fields = ['view_products', 'grand_total', 'enquiry_date']
    date_hierarchy = 'enquiry_date'

    # 👇 clickable link to frontend dealer cart page
    def dealer_page_link(self, obj):
        if obj.link_name:
            return format_html(
                # '<a href="/dealer/{}/cart" target="_blank">{}</a>',
                obj.link_name,
                obj.link_name
            )
        return "-"
    dealer_page_link.short_description = "Dealer Page"

    def view_products(self, obj):
        if not obj.items:
            return "-"
        html = "<ul>"
        for item in obj.items:
            html += f"<li><strong>{item.get('pro_name')}</strong> — Qty: {item.get('quantity')} — ₹{item.get('price')}</li>"
        html += "</ul>"
        return format_html(html)
    view_products.short_description = "Dealer Products"

    def grand_total(self, obj):
        total = 0
        for item in obj.items or []:
            price = float(item.get('price', 0))
            quantity = int(item.get('quantity', 1))
            total += price * quantity
        return f"₹{total:.2f}"
    grand_total.short_description = "Grand Total"

    def product_summary(self, obj):
        return format_html("<br>".join(
            f"{item.get('pro_name')} (x{item.get('quantity')})"
            for item in obj.items or []
        ))
    product_summary.short_description = "Products"

    def verify_button(self, obj):
        if not obj.is_verified:
            return format_html(
                '<a class="button" style="color: white; background: green; padding: 6px 12px; border-radius: 4px;" href="{}">Verify</a>',
                f'verify-dealer/{obj.id}/'
            )
        return "✅ Verified"
    verify_button.short_description = "Verify Action"

    def get_urls(self):
        urls = super().get_urls()
        custom_urls = [
            path('verify-dealer/<int:dealer_id>/', self.admin_site.admin_view(self.verify_dealer), name='verify-dealer'),
        ]
        return custom_urls + urls

    def verify_dealer(self, request, dealer_id):
        dealer = DealerEnquiry.objects.get(id=dealer_id)

        if dealer.is_verified:
            messages.warning(request, "Already verified.")
        else:
            dealer.is_verified = True
            dealer.save()

            item_html = ""
            total = 0
            for item in dealer.items:
                price = float(item.get("price", 0))
                quantity = int(item.get("quantity", 1))
                item_total = price * quantity
                total += item_total

                item_html += f"""
                    <tr>
                        <td style="border: 1px solid #ccc; padding: 6px; font-size: 12px;">{item.get('pro_name')}</td>
                        <td style="border: 1px solid #ccc; padding: 6px; font-size: 12px;">₹{price:.2f}</td>
                        <td style="border: 1px solid #ccc; padding: 6px; font-size: 12px;">{quantity}</td>
                        <td style="border: 1px solid #ccc; padding: 6px; font-size: 12px;">₹{item_total:.2f}</td>
                    </tr>
                """

            html_message = f"""
    <div style="font-family: Arial, sans-serif; background-color: #f9f9f9; padding: 15px;">
    <div style="max-width: 600px; margin: auto; background: white; border-radius: 10px; box-shadow: 0 4px 8px rgba(0,0,0,0.1); overflow: visible;">

        <!-- Header -->
        <div style="background-color: white; padding: 15px; text-align: center;">
        <img src="https://logo-veeraragavan.onrender.com/logo.png" alt="Logo" style="max-height: 60px; margin-bottom: 8px;" />
           <!--<img src="http://localhost:8000/logo/logo.png" alt="Logo" style="max-height: 60px; margin-bottom: 8px;" /> -->
        <h2 style="color:  #0A3871; margin: 5px 0 0 0; font-size: 14px;">Your Dealer Enquiry Verified</h2>
        </div>

        <!-- Body -->
        <div style="padding: 15px;">
        <p style="font-size: 13px;">Dear <strong>{dealer.name}</strong>,</p>
        <p style="font-size: 13px;">Your product enquiry has been <strong style="color: green;">verified</strong>. Below are the product details:</p>

        <!-- Responsive Table (No Scroll) -->
        <table style="width: 100%; border-collapse: collapse; table-layout: fixed; font-size: 12px;">
            <thead>
            <tr style="background-color: white; color: #0A3871;">
                <th style="border: 1px solid #ccc; padding: 6px; text-align: left; width: 40%;">Product</th>
                <th style="border: 1px solid #ccc; padding: 6px; text-align: left; width: 20%;">Price</th>
                <th style="border: 1px solid #ccc; padding: 6px; text-align: left; width: 20%;">Qty</th>
                <th style="border: 1px solid #ccc; padding: 6px; text-align: left; width: 20%;">Total</th>
            </tr>
            </thead>
            <tbody>
            {item_html}
            </tbody>
        </table>

        <h3 style="margin-top: 20px; font-size: 14px;">🧮 Grand Total: ₹{total:.2f}</h3>
        <p style="margin-top: 15px; font-size: 13px;">Thank you for your interest. We'll contact you shortly.</p>
        </div>

    </div>
    </div>
    """









            send_mail(
                subject='Your Dealer Enquiry Has Been Verified',
                message='Your product verified.',
                from_email='samuelreegan372@example.com',
                recipient_list=[dealer.email],
                fail_silently=False,
                html_message=html_message,
            )

            messages.success(request, f'Dealer enquiry verified and email sent to {dealer.email}')

        return redirect(request.META.get('HTTP_REFERER'))
    