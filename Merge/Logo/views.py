from django.shortcuts import render
from .serializers import *
from rest_framework.generics import ListAPIView,CreateAPIView,DestroyAPIView,UpdateAPIView
from rest_framework.views import APIView
from rest_framework.response import Response

from django.http import FileResponse, Http404
from .models import Logo
import os
from django.conf import settings

# Create your views here.
class LogoCreate(UpdateAPIView):
    queryset = Logo.objects.all()
    serializer_class = LogoSerializers

# class LogoList(ListAPIView):
#     queryset = Logo.objects.all()
#     serializer_class = LogoSerializers

class LatestLogoView(APIView):
    def get(self, request):
        latest_logo = Logo.objects.latest('updated_at')
        serializer = LogoSerializers(latest_logo)
        return Response(serializer.data)
    


class ProductBanner(UpdateAPIView):
    queryset = Logo.objects.all()
    serializer_class = LogoSerializers

class LatestProductBanner(APIView):
    def get(self, request):
        latest_logo = Logo.objects.latest('updated_at')
        serializer = LogoSerializers(latest_logo)
        return Response(serializer.data)
    



def serve_latest_logo_png(request):
    try:
        latest_logo = Logo.objects.latest('updated_at')
        file_path = os.path.join(settings.MEDIA_ROOT, latest_logo.picture.name)

        if not os.path.exists(file_path):
            raise Http404("Logo file not found on disk")

        return FileResponse(open(file_path, 'rb'), content_type='image/png')
    except Exception as e:
        print("❌ Error:", e)
        raise Http404("Logo not found")