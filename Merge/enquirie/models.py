from django.db import models
from product.models import Product
import django.utils.timezone

# Existing model for single enquiry
class enquiriesModel(models.Model):
    quantity = models.IntegerField(null=True)
    name = models.TextField(max_length=200, null=True)
    phone_number = models.BigIntegerField(null=True, default=0)
    email = models.CharField(max_length=200, null=True)
    Product_id = models.ForeignKey(Product, on_delete=models.CASCADE, related_name='enquiries', null=True)
    enquiry_date = models.DateTimeField(auto_now_add=True)

    is_verified = models.BooleanField(default=False)
    is_dealer = models.BooleanField(default=False)

    def __str__(self):
        return f"{self.name} - {self.phone_number}"

# New model for dealer multiple enquiries
class DealerEnquiry(models.Model):
    name = models.TextField(max_length=200, null=True)
    phone_number = models.BigIntegerField(null=True, default=0)
    email = models.CharField(max_length=200, null=True)
    items = models.JSONField(null=True)  # List of product dictionaries
    total = models.FloatField(default=0)
    enquiry_date = models.DateTimeField(default=django.utils.timezone.now)
    is_verified = models.BooleanField(default=False)
    link_name = models.SlugField(max_length=255, null=True, blank=True)

    def __str__(self):
        return f"Dealer: {self.name} ({self.phone_number})"
