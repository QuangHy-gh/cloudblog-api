from django.shortcuts import render

from rest_framework import generics

from blog_api.models import HitcountHitCount
from .serializers import HitcountHitCountSerializer
from django.views.generic import TemplateView


class HitcountHitCountAPIView(generics.ListAPIView):
    queryset = HitcountHitCount.objects.all()
    serializer_class = HitcountHitCountSerializer


class HomePageView(TemplateView):
    template_name = "home.html"
