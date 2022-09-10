from django.urls import path

from .views import HitcountHitCountAPIView
from .views import HomePageView

urlpatterns = [
    path("", HomePageView.as_view(), name="home"),
    path("api/", HitcountHitCountAPIView.as_view(), name="hitcount_view"),
]
